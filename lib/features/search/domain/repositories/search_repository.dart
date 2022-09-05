import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/features/search/data/models/search_model.dart';

abstract class SearchRepository{


  Future<Either<Failure,SearchModel>> search({required String ?token,required String text});



}