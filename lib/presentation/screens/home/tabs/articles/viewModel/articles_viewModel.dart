import 'package:news_app_c12_online_sat/base/base_state/base_state.dart';
import 'package:news_app_c12_online_sat/base/base_viewModel/base_viewModel.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sat/domain/etities/article_entity.dart';
import 'package:news_app_c12_online_sat/domain/repository_contract/articles_repo_contract.dart';
import 'package:news_app_c12_online_sat/domain/usecases/articles_usecase.dart';
import 'package:news_app_c12_online_sat/result.dart';

class ArticlesViewModel extends BaseViewModel<List<ArticleEntity>> {
  ArticlesViewModel({required this.articlesUseCase})
      : super(state: LoadingState());
  GetArticlesUseCase articlesUseCase;

  void getNewsBySourceId(String sourceId) async {
    emit(LoadingState());
    var result = await articlesUseCase.execute(sourceId);
    switch (result) {
      case Success<List<ArticleEntity>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<ArticleEntity>>():
        emit(ErrorState(serverError: result));
      case Error<List<ArticleEntity>>():
        emit(ErrorState(error: result));
    }
  }
}

// Data Layer
// Domain Layer

// Design patterns
// Singltone
// Factory
// Builder

// ecommerce ? 4
