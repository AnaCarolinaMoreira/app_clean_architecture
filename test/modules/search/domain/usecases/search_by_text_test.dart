import 'package:app_clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:app_clean_architecture/modules/search/domain/entities/result_search.dart';
import 'package:app_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';



class SearchRepositoryMock extends Mock implements SearchRepository{}
main(){

final repository = SearchRepositoryMock();

  final usecase=SearchByTextImpl(repository);

  test('deve retornar uma lista de ResultSearch',() async {

  //when(repository.search(any)).thenAnswer((_)async => Right(<ResultSearch>[]));
    when(() => repository.search(any())).thenAnswer((_)async => Right(<ResultSearch>[]));
   final result = await usecase("ana");
   expect(result | null, isA<List<ResultSearch>>());//retorna uma FailureSearch

  });
}
// when(() => repository.search(any)).thenAnswer((_)async => Right(<ResultSearch>[]));

//List<ResultSearch>nunca pode ser nulo, add nullable no Lis<Result>? para abstrata e para implementação
//quando metodo chama call não prescisa escrever el para chamar a função
//expect(result, isA<Right>());//retorna uma lista
// expect(result.getOrElse(() => null), isA<List<ResultSearch>>());//retorna uma FailureSearch
//getOrElse(() => null) usando o | no dartz