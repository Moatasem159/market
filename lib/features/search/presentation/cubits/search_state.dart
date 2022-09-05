import 'package:equatable/equatable.dart';
import 'package:supermarket/features/search/data/models/search_model.dart';

abstract class SearchStates extends Equatable {
  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchStates {}


class SearchLoadingState extends SearchStates {}

class SearchSuccessState extends SearchStates {

  final SearchModel searchModel;

  SearchSuccessState({required this.searchModel});

  @override
  List<Object> get props => [searchModel];
}

class SearchErrorState extends SearchStates {
  final String msg;

  SearchErrorState({required this.msg});

  @override
  List<Object> get props => [msg];

}


class ShowSearchScreen extends SearchStates{}
class RemoveSearchScreen extends SearchStates{}