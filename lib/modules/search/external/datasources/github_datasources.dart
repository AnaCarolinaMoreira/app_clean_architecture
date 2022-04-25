import 'package:app_clean_architecture/modules/search/domain/errors/errors.dart';
import 'package:app_clean_architecture/modules/search/infra/datasources/search_datasource.dart';
import 'package:app_clean_architecture/modules/search/infra/models/result_search_model.dart';
import 'package:dio/dio.dart';

extension on String {
  normalize() {
    return this.replaceAll("", "+");
  }
}

class GithubSearchDatasource implements SearchDatasource {
  final Dio dio;
  GithubSearchDatasource(this.dio);
  @override
  Future<List<ResultSearchModel>> getSearch(String? searchText) async {
    final response = await dio
        //   .get("https://api.github.com/search/users?q=${searchText.normalize()}");
        .get("https://api.github.com/search/users?q=$searchText");
    if (response.statusCode == 200) {
      final list = (response.data as List)
          .map((e) => ResultSearchModel.fromMap(e))
          .toList();
      return list;
    } else {
      throw DatasourceError();
    }
  }
}
