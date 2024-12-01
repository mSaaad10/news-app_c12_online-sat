import 'package:news_app_c12_online_sat/base/base_state/base_state.dart';
import 'package:news_app_c12_online_sat/base/base_viewModel/base_viewModel.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sat/domain/etities/source_entitiy.dart';
import 'package:news_app_c12_online_sat/domain/repository_contract/sources_repository.dart';
import 'package:news_app_c12_online_sat/domain/usecases/sources_usecase.dart';
import 'package:news_app_c12_online_sat/result.dart';

class SourcesViewModel extends BaseViewModel<List<SourceEntity>> {
  GetSourcesUseCase sourcesUseCase;

  SourcesViewModel({required this.sourcesUseCase})
      : super(state: LoadingState());

  void getSourcesByCategoryId(String categoryId) async {
    state = LoadingState();
    var result = await sourcesUseCase.execute(categoryId);
    switch (result) {
      case Success<List<SourceEntity>>():
        {
          emit(SuccessState(data: result.data));
        }
      case ServerError<List<SourceEntity>>():
        {
          emit(ErrorState(serverError: result));
        }
      case Error<List<SourceEntity>>():
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
