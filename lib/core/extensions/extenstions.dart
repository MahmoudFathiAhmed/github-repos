import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  /// get screen height
  double get height => MediaQuery.sizeOf(this).height;

  /// get screen width
  double get width => MediaQuery.sizeOf(this).width;
}

extension NavigationExtesnions on BuildContext {
  /// push named route
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  /// push replacement named route
  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  /// push named and remove until
  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments, required RoutePredicate predicate}) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  /// pop
  void pop() => Navigator.of(this).pop();
}

extension OmitBranchExtension on String {
  String omitBranchPattern() {
    return replaceAll("{/branch}", "");
  }
}
