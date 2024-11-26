import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/base/base_state/base_state.dart';
import 'package:news_app_c12_online_sat/data_model/category_DM.dart';
import 'package:news_app_c12_online_sat/presentation/common/error_state_widget.dart';
import 'package:news_app_c12_online_sat/presentation/common/loading_state_widget.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/sources/viewModel/sources_viewModel.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/sources/widgets/SourceTabs.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.categoryDM});

  CategoryDM categoryDM;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  var viewModel = SourcesViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer<SourcesViewModel>(
          builder: (context, viewModel, child) {
            // if (viewModel.isLoading) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            // if (viewModel.errorMessage != null) {
            //   return Center(
            //     child: Text(viewModel.errorMessage!),
            //   );
            // }
            // return SourceTabs(sources: viewModel.sources!);
            var state = viewModel.state;
            switch (state) {
              case SuccessState():
                return SourceTabs(sources: state.data);
              case LoadingState():
                return LoadingStateWidget(
                  loadingMessage: 'Plz, wait...',
                );
              case ErrorState():
                return ErrorStateWidget(
                  error: state.error,
                  serverError: state.serverError,
                  retryText: 'retry',
                  retryButtonAction: () {
                    viewModel.getSourcesByCategoryId(widget.categoryDM.id);
                  },
                );
            }
          },
        ));
  }
}
