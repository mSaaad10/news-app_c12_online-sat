import 'package:news_app_c12_online_sat/base/base_state/base_state.dart';
import 'package:news_app_c12_online_sat/base/base_viewModel/base_viewModel.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sat/result.dart';

class ArticlesViewModel extends BaseViewModel<List<Article>> {
  ArticlesViewModel() : super(state: LoadingState());

  void getNewsBySourceId(String sourceId) async {
    emit(LoadingState());
    var result = await ApiManager.getArticles(sourceId);
    switch (result) {
      case Success<List<Article>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<Article>>():
        emit(ErrorState(serverError: result));
      case Error<List<Article>>():
        emit(ErrorState(error: result));
    }
  }
}

// sealed class ArticlesState {}
//
// class ArticlesInitialState extends ArticlesState {}
//
// class ArticlesSuccessState extends ArticlesState {
//   List<Article> articles;
//
//   ArticlesSuccessState({required this.articles});
// }
//
// class ArticlesErrorState extends ArticlesState {
//   ServerError? serverError;
//   Error? error;
//
//   ArticlesErrorState({this.serverError, this.error});
// }
//
// class ArticlesLoadingState extends ArticlesState {
//   String? loadingMessage;
//
//   ArticlesLoadingState({this.loadingMessage});
// }
