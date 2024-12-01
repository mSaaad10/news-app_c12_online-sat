import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sat/result.dart';

abstract class ArticlesDataSource {
  // this function get a list of articles base on Concrete dataSource
  Future<Result<List<Article>>> getArticles(String sourceId);
}
