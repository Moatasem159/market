import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/login/data/models/login_model.dart';
import 'package:supermarket/features/profile/data/models/address_model.dart';
import 'package:supermarket/features/profile/domain/usecases/add_address_use_case.dart';
import 'package:supermarket/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:supermarket/features/profile/domain/usecases/get_user_addresses_use_case.dart';
import 'package:supermarket/features/profile/domain/usecases/update_user_data_use_case.dart';
import 'package:supermarket/features/profile/presentation/cubits/profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(
      {required this.getProfileUseCase,
      required this.addAddressUseCase,
      required this.getUserAddressesUseCase,
      required this.updateUserDataUserCase})
      : super(ProfileInitialState());
  GetProfileUseCase getProfileUseCase;
  GetUserAddressesUseCase getUserAddressesUseCase;
  AddAddressUseCase addAddressUseCase;
  UpdateUserDataUserCase updateUserDataUserCase;

  UserModel ?user;

  Future<void> getProfile() async {
    emit(GetProfileLoadingState());
    user = UserModel();
    Either<Failure, UserModel> response =
        await getProfileUseCase.call(token: AppStrings.userToken);
    response.fold((failure) {
      emit(GetProfileErrorState(msg: _mapFailureToMsg(failure)));
    }, (profile) {
      user = profile;
      emit(GetProfileSuccessState(userModel: profile));
    });
  }

  Future<void> getUserAddresses() async {
    emit(GetUserAddressesLoadingState());
    Either<Failure, AddressModel> response =
        await getUserAddressesUseCase.call(token: AppStrings.userToken);
    response.fold((failure) {
      emit(GetUserAddressesErrorState(msg: _mapFailureToMsg(failure)));
    }, (addresses) {
      emit(GetUserAddressesSuccessState(addressModel: addresses));
    });
  }

  Future<void> addAddress(
      {required int id,
      required String addressName,
      required String city,
      required String region,
      required String details,
      required String notes,
      required int latitude,
      required int longitude}) async {
    emit(AddNewAddressLoadingState());

    Either<Failure, AddressModel> response = await addAddressUseCase.call(
        token: AppStrings.userToken,
        addressName: addressName,
        city: city,
        region: region,
        details: details,
        notes: notes,
        latitude: latitude,
        longitude: longitude);
    response.fold((failure) {
      emit(AddNewAddressErrorState(msg: _mapFailureToMsg(failure)));
    }, (done) {
      emit(AddNewAddressSuccessState(addressModel: done));
    });
  }

  Future<void> updateUserData(
      {required String name,
      required String email,
      required String phone}) async {
    emit(UpdateUserDataLoadingState());

    Either<Failure, UserModel> response = await updateUserDataUserCase.call(
        token: AppStrings.userToken, name: name, email: email, phone: phone);

    response.fold((failure) {
      emit(UpdateUserDataErrorState(msg: _mapFailureToMsg(failure)));
    }, (done) {
      getProfile();
      user = done;
      emit(UpdateUserDataSuccessState(userModel: done));
    });
  }

  String _mapFailureToMsg(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "Server Failure";
      case CacheFailure:
        return "Cache Failure";

      default:
        return " error";
    }
  }
}
