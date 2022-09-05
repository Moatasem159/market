import 'package:dartz/dartz.dart';
import 'package:supermarket/core/error/exceptions.dart';
import 'package:supermarket/core/error/failures.dart';
import 'package:supermarket/core/network/network_info.dart';
import 'package:supermarket/features/search/data/data_sources/search_data_source.dart';
import 'package:supermarket/features/search/data/models/search_model.dart';
import 'package:supermarket/features/search/domain/repositories/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository{

  final NetworkInfo networkInfo;
  final SearchDataSource searchDataSource;


  SearchRepositoryImpl({required this.networkInfo, required this.searchDataSource});

  @override
  Future<Either<Failure, SearchModel>> search({required String?token, required String text})async {
    try {
      final search = await searchDataSource.search(token: token,text: text);
      return Right(search);
    } on ServerException {
      return Left(ServerFailure());
    }
  }







}