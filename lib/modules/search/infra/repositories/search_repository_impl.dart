import 'package:app_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:app_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:app_clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {
  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> search(
      String? searchText) {
    throw UnimplementedError();
  }
}
