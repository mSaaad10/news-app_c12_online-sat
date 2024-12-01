import 'package:news_app_c12_online_sat/domain/etities/article_entity.dart';
import 'package:news_app_c12_online_sat/result.dart';

abstract class ArticlesRepository {
  Future<Result<List<ArticleEntity>>> getArticles(String sourceId);
}
// const -> Full Immutable
//final -> half Immutable
// void test(){
//   const int x = 10;
//   final int y ;
//   y = 20;
//   y = 5;
// }
