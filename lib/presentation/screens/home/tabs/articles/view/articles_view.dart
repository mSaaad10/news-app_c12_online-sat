import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/base/base_state/base_state.dart';
import 'package:news_app_c12_online_sat/core/di.dart';
import 'package:news_app_c12_online_sat/data/api/api_manager/api_manager.dart';
import 'package:news_app_c12_online_sat/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sat/data/datasource_impl/articles_datasource_impl.dart';
import 'package:news_app_c12_online_sat/data/reposiotry_impl/articles_repository_impl.dart';
import 'package:news_app_c12_online_sat/domain/etities/source_entitiy.dart';
import 'package:news_app_c12_online_sat/domain/usecases/articles_usecase.dart';
import 'package:news_app_c12_online_sat/presentation/common/error_state_widget.dart';
import 'package:news_app_c12_online_sat/presentation/common/loading_state_widget.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/articles/viewModel/articles_viewModel.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/articles/widget/article_widget.dart';
import 'package:provider/provider.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({super.key, required this.source});

  SourceEntity source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  // Design Pattern
  // Injectable

  var viewModel = ArticlesViewModel(articlesUseCase: getArticlesUseCase());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  void didUpdateWidget(covariant ArticlesView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id)
      viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Consumer<ArticlesViewModel>(
        builder: (context, viewModel, child) {
          var state = viewModel.state;
          switch (state) {
            case SuccessState():
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) =>
                      ArticleWidget(article: state.data[index]),
                  itemCount: state.data.length,
                ),
              );
            case ErrorState():
              return ErrorStateWidget(
                serverError: state.serverError,
                error: state.error,
                retryText: 'retry',
                retryButtonAction: () {
                  viewModel.getNewsBySourceId(widget.source.id ?? '');
                },
              );
            case LoadingState():
              return const LoadingStateWidget(
                loadingMessage: 'Plz, wait...',
              );
          }
        },
      ),
    );
  }
}
// observer
// singleton
// factory
// builder
