import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sat/data/data_source_contract/articles_datasource.dart';
import 'package:news_app_c12_online_sat/result.dart';

class ArticlesApiDataSourceImpl extends ArticlesDataSource {
  ApiManager apiManager;

  ArticlesApiDataSourceImpl({required this.apiManager}); // dependency injection

  @override
  Future<Result<List<Article>>> getArticles(String sourceId) async {
    // u should get list of articles from api

    var result = await apiManager.getArticles(sourceId);
    switch (result) {
      case Success<List<Article>>():
        return Success(data: result.data);
      case ServerError<List<Article>>():
        return ServerError(code: result.code, message: result.message);
      case Error<List<Article>>():
        return Error(exception: result.exception);
    }
  }
}

// class MuahmmedSaadArticlesDataSourceImpl extends ArticlesDataSource{
//   @override
//   Future<Result<List<Article>>> getArticles(String sourceId) {
//     // TODO: implement getArticles
//     throw UnimplementedError();
//     // u should get list of articled from muhammed's home
//   }
//
// }
//
// class ArticlesFireStoreDataSourceImpl extends ArticlesDataSource {
//   @override
//   Result<List<Article>> getArticles(String sourceId) {
//     // TODO: implement getArticles
//     throw UnimplementedError();
//     // u should get list of articles from fireStore database
//   }
// }
//
// class ArticlesOfflineDataSourceImpl extends ArticlesDataSource {
//   @override
//   Result<List<Article>> getArticles(String sourceId) {
//     // TODO: implement getArticles
//     throw UnimplementedError();
//     // u should get list of articles from caching data
//   }
// }
