import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/home/data/models/home_model.dart';
import 'package:supermarket/features/home/domain/usecases/get_home_usecase.dart';
import 'package:supermarket/features/home/presentation/cubit/home_cubit/home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit({required this.getHomeUseCase})
      : super(HomeInitialState());

  GetHomeUseCase getHomeUseCase;




  HomeModel ?homeModel=HomeModel();
  Future<void> getHomeData(BuildContext context) async {
    emit(GetHomeLoadingState());
    Either<Failure, HomeModel> response =
        await getHomeUseCase.call(token: AppStrings.userToken);
    emit(response.fold(
        (failure) => GetHomeErrorState(msg: _mapFailureToMsg(failure)),
        (homeData){
          return  GetHomeSuccessState(homeModel: homeData);
        }));
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
