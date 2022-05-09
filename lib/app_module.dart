import 'package:app_clean_architecture/app_widget.dart';
import 'package:app_clean_architecture/modules/search/domain/repositories/search_repository.dart';
import 'package:app_clean_architecture/modules/search/domain/usecases/search_by_text.dart';
import 'package:app_clean_architecture/modules/search/external/datasources/github_datasources.dart';
import 'package:app_clean_architecture/modules/search/infra/repositories/search_repository_impl.dart';
import 'package:app_clean_architecture/modules/search/presenter/search_bloc.dart';
import 'package:app_clean_architecture/modules/search/presenter/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => GithubSearchDatasource(i())),
        Bind((i) => SearchRepositoryImpl(i())),
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => SearchBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [ChildRoute('/', child: (context, args) => SearchPage())];

  @override
  Widget get bootstrap => AppWidget();
}
