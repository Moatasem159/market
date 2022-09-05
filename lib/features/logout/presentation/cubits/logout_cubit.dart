import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/logout/data/models/logout_model.dart';
import 'package:supermarket/features/logout/domain/usecases/logout_use_case.dart';
import 'package:supermarket/features/logout/presentation/cubits/logout_state.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit({required this.logoutUseCase,required this.sharedPreferences}) : super(LogoutInitialState());

  LogoutUseCase logoutUseCase;
  SharedPreferences sharedPreferences;
  Future<void> userLogout()async{

    emit(LogoutLoadingState());
    Either<Failure, LogoutModel> response =
        await logoutUseCase.call(token: AppStrings.userToken!);
    response.fold(
            (failure) => LogoutErrorState(msg: _mapFailureToMsg(failure)),
            (done) {
              sharedPreferences.remove(AppStrings.token);
              emit(LogoutSuccessState(logoutModel: done));
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
