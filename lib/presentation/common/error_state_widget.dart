import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_c12_online_sat/result.dart';

class ErrorStateWidget extends StatelessWidget {
  ServerError? serverError;
  Error? error;
  String? retryText;
  VoidCallback? retryButtonAction;

  ErrorStateWidget(
      {super.key,
      this.error,
      this.serverError,
      this.retryText,
      this.retryButtonAction});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            extractError(),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 4.h,
          ),
          if (retryText != null)
            ElevatedButton(
                onPressed: () {
                  retryButtonAction?.call();
                },
                child: Text(retryText!))
        ],
      ),
    );
  }

  String extractError() {
    String message = 'Something wnt wrong';
    if (serverError?.message != null) {
      message = serverError!.message;
      return message;
    } else if (error?.exception != null) {
      Exception ex = error!.exception;
      switch (ex) {
        case SocketException():
          message = 'No Internet connection';
        case HttpException():
          message = 'Couldn\'t find the post';
        case FormatException():
          message = 'Bad response format';
      }
      return message;
    }
    return message;
  }
}
