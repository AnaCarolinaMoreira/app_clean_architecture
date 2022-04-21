import 'package:app_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:app_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:app_clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:app_clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpl implements SearchRepository {

final SearchDataSource datasource;

SearchRepositoryImpl(this.datasource); 

  @override
  Future<Either<FailureSearch, List<ResultSearch>?>> search(
      String? searchText) async {

        try{
         final result = await datasource.getSearch(searchText);
       //Right(result);
          return right(result);
        }on DatasourceError catch(e){ 
          //error costumizado
          return  left(e);
        }catch(e){ 
          //error desconhecido
          //Left(DatasourceError());
          return  left(DatasourceError());
        }

 
  }
}
