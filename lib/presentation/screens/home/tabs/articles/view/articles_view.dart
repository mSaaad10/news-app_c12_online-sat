import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/base/base_state/base_state.dart';
import 'package:news_app_c12_online_sat/data/api/model/sources_response/source.dart';
import 'package:news_app_c12_online_sat/presentation/common/error_state_widget.dart';
import 'package:news_app_c12_online_sat/presentation/common/loading_state_widget.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/articles/viewModel/articles_viewModel.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/articles/widget/article_widget.dart';
import 'package:provider/provider.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({super.key, required this.source});

  Source source;

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView> {
  var viewModel = ArticlesViewModel();

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
