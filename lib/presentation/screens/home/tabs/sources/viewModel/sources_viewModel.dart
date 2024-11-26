import 'package:news_app_c12_online_sat/base/base_state/base_state.dart';
import 'package:news_app_c12_online_sat/base/base_viewModel/base_viewModel.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sat/result.dart';

class SourcesViewModel extends BaseViewModel<List<Source>> {
  SourcesViewModel() : super(state: LoadingState());

  void getSourcesByCategoryId(String categoryId) async {
    state = LoadingState();
    var result = await ApiManager.getSources(categoryId);
    switch (result) {
      case Success<List<Source>>():
        emit(SuccessState(data: result.data));
      case ServerError<List<Source>>():
        emit(ErrorState(serverError: result));
      case Error<List<Source>>():
        emit(ErrorState(error: result));
    }
  }
}

// sealed class SourcesState {}
//
// class SourcesSuccessState extends SourcesState {
//   List<Source> sources;
//
//   SourcesSuccessState({required this.sources});
// }
//
// class SourcesLoadingState extends SourcesState {
//   String? loadingMessage;
//
//   SourcesLoadingState({this.loadingMessage});
// }
//
// class SourcesErrorState extends SourcesState {
//   ServerError? serverError;
//   Error? error;
//
//   SourcesErrorState({this.serverError, this.error});
// }
