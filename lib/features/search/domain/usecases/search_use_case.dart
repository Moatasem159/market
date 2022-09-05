import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/search/data/models/search_model.dart';
import 'package:supermarket/features/search/domain/repositories/search_repository.dart';

class SearchUseCase{

  SearchRepository searchRepository;

  SearchUseCase({required this.searchRepository});


  Future<Either<Failure,SearchModel>> call({required String ?token,required String text }){
    return searchRepository.search(token: token, text: text);
  }
}