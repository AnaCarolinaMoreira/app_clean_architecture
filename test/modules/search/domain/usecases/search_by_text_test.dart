import 'package:app_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:app_clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:app_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:app_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();

  final usecase = SearchByTextImpl(repository);
//caminho feliz
  test('deve retornar uma lista de ResultSearch', () async {
    when(() => repository.search(any()))
        .thenAnswer((_) async => Right(<ResultSearch>[]));
    final result = await usecase("ana");
    expect(
        result | null, isA<List<ResultSearch>>()); //retorna uma FailureSearch
  });

  test('deve retornar um InvalidTextError caso o texto seja inválido',
      () async {
    when(() => repository.search(any()))
        .thenAnswer((_) async => Right(<ResultSearch>[]));

    var result = await usecase(null);

    expect(result.fold(id, id), isA<InvalidTextError>());
    result = await usecase("");
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
   // expect(result.isLeft(), true);
    //  expect(result.fold((l) => l, (r) => r), matcher)