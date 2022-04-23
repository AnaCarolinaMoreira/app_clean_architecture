import 'package:app_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:app_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:app_clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:app_clean_architecture/modules/search/infra/models/result_search_model.dart';
import 'package:app_clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';


class SearchDatasourceMock extends Mock implements SearchDataSource{}
main() {
  final datasource=SearchDatasourceMock();
  final repository = SearchRepositoryImpl(datasource);

  test('deve retorna uma lista de ResultSearc ', () async{
    when(()=>datasource.getSearch(any()))
    .thenAnswer((_) async =><ResultSearchModel>[]);

    final result = await repository.search("ana");

    expect(result|null, isA<List<ResultSearch>>());
  });



   test('deve retorna um DatasourceError se o datasource falhar', () async{
    //when(datasource.getSearch(any)).thenThrow(Exception());
    when(()=> datasource.getSearch(any())).thenThrow(Exception());
    final result = await repository.search("ana");
    expect(result.fold(id, id),isA<DatasourceError>());
  });
}
//when(() => repository.search(any())).thenAnswer((_)async => Right(<ResultSearch>[]));