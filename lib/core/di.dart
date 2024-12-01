import 'package:http/http.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/datasource_impl/articles_datasource_impl.dart';
import 'package:news_app_c12_online_sat/data/datasource_impl/sources_datasource_impl.dart';
import 'package:news_app_c12_online_sat/data/reposiotry_impl/articles_repository_impl.dart';
import 'package:news_app_c12_online_sat/data/reposiotry_impl/sources_repository_impl.dart';
import 'package:news_app_c12_online_sat/domain/usecases/articles_usecase.dart';
import 'package:news_app_c12_online_sat/domain/usecases/sources_usecase.dart';

GetArticlesUseCase getArticlesUseCase() {
  return GetArticlesUseCase(repository: getArticlesRepository());
}

ArticlesRepositoryImpl getArticlesRepository() {
  return ArticlesRepositoryImpl(dataSource: getArticlesDataSource());
}

ArticlesApiDataSourceImpl getArticlesDataSource() {
  return ArticlesApiDataSourceImpl(apiManager: getApiManager());
}

ApiManager getApiManager() {
  return ApiManager();
}

SourcesRepositoryImpl getSourcesRepo() {
  return SourcesRepositoryImpl(dataSource: getSourcesDataSource());
}

SourcesApiDataSourceImpl getSourcesDataSource() {
  return SourcesApiDataSourceImpl(apiManager: getApiManager());
}

GetSourcesUseCase getSourcesUseCase() {
  return GetSourcesUseCase(repository: getSourcesRepo());
}
