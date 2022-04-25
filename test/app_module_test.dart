import 'dart:convert';

import 'package:app_clean_architecture/app_module.dart';
import 'package:app_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:app_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'modules/search/utils/github_response.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  initModule(AppModule(), changeBinds: [
    Bind<Dio>(((i) => dio)),
  ]);
  test('Deve retorna o usecase', () {
    final usecase = Modular.get<SearchByText>();
    expect(usecase, isA<SearchByTextImpl>());
  });
  //pesquisa na internet,mock
  test('Deve trazer uma lista de  ResultSearch', () async {
    when(() => dio.get(any())).thenAnswer((_) async => Response(
          data: jsonDecode(githubResult),
          requestOptions: any(),
          statusCode: 200,
        ));
    final usecase = Modular.get<SearchByText>();
    final result = await usecase("ana");

    expect(result | null, isA<List<ResultSearch>>());
  });
}
