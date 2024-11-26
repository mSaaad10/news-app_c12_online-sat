import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/base/base_state/base_state.dart';

class BaseViewModel<T> extends ChangeNotifier {
  BaseState<T> state;

  BaseViewModel({required this.state});

  void emit(BaseState<T> newState) {
    state = newState;
    notifyListeners();
  }
}
