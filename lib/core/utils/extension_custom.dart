import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as ctx;
import 'package:go_router/go_router.dart';
import 'package:pokebag_flutter/core/utils/error_entity.dart';

extension ContextDialog on ctx.BuildContext {
  String get path => GoRouterState.of(this).fullPath ?? '';
  TextTheme get textStyle => Theme.of(this).textTheme;
  ColorScheme get colors => Theme.of(this).colorScheme;

  void loading(bool value) {
    if (value) {
      showDialog(
        context: this,
        useRootNavigator: true,
        barrierDismissible: false,
        builder: (context) => Center(
          child: Container(
            color: Colors.white,
            width: 90,
            height: 90,
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          ),
        ),
      );
    } else {
      pop();
    }
  }

  void snackbarError(ErrorEntity? error) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(error?.getMsg ?? ''),
        backgroundColor: colors.error,
      ),
    );
  }

  void snackbarSuccess(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }
}

extension STR on String? {
  String get caps =>
      (this ?? '')[0].toUpperCase() + (this ?? '').substring(1).toLowerCase();

  String addUnit(String unit) =>
      (this ?? '').padRight((this ?? '').length + 1, unit);
}
