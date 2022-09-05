import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/utils/app_strings.dart';
import 'package:supermarket/features/search/data/models/search_model.dart';
import 'package:supermarket/features/search/domain/usecases/search_use_case.dart';
import 'package:supermarket/features/search/presentation/cubits/search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.searchUseCase}) : super(SearchInitialState());

  SearchUseCase searchUseCase;

  bool isSearchActive=false;

  searchActive(context){
    emit(RemoveSearchScreen());
    Navigator.pop(context);
    emit(ShowSearchScreen());
  }
  searchDone(){
    emit(RemoveSearchScreen());
    isSearchActive= false;
    emit(ShowSearchScreen());
  }


  SearchModel? searchModel;
  Future<void>search({required String text})async{
    emit(SearchLoadingState());
    Either<Failure,SearchModel> response=await searchUseCase.call(token: AppStrings.userToken, text: text);
    response.fold(
            (failure) => SearchErrorState(msg: _mapFailureToMsg(failure)),
            (products)  {
              searchModel=products;
              emit(SearchSuccessState(searchModel: products));
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
