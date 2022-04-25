import 'dart:convert';

import 'package:app_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:app_clean_architecture/modules/search/external/datasources/github_datasources.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = Dio();
  final datasource = GithubSearchDatasource(dio);
  test('Deve retorna uma lista de ResultSearchModel', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: jsonDecode(githubResult),
          requestOptions: any(),
          statusCode: 200,
        ));
    final future = datasource.getSearch("searchText");
    expect(future, completes);
  });

  test('Deve retorna um erro se o code não for 200', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: null,
          requestOptions: any(),
          statusCode: 401,
        ));
    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<DatasourceError>()));
  });

  test('Deve retorna uma Exception se tiver um erro no dio', () async {
    when(() => dio.get(any())).thenThrow(Exception());

    final future = datasource.getSearch("searchText");
    expect(future, throwsA(isA<Exception>()));
  });
}
