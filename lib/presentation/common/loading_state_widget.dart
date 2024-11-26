import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';

class LoadingStateWidget extends StatelessWidget {
  final String? loadingMessage;

  const LoadingStateWidget({super.key, this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (loadingMessage != null) Text(loadingMessage!),
          const SizedBox(
            width: 8,
          ),
          const Center(
              child: CircularProgressIndicator(
            color: ColorsManager.green,
          ))
        ],
      ),
    );
  }
}
