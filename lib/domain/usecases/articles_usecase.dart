import 'package:news_app_c12_online_sat/domain/etities/article_entity.dart';
import 'package:news_app_c12_online_sat/domain/repository_contract/articles_repo_contract.dart';
import 'package:news_app_c12_online_sat/result.dart';

// use case is a concept in sw engineering represent a functional requirement
// from user prespective and hiding details
class GetArticlesUseCase {
  ArticlesRepository repository;

  GetArticlesUseCase({required this.repository});

  Future<Result<List<ArticleEntity>>> execute(String sourceId) {
    return repository.getArticles(sourceId);
  }
}
