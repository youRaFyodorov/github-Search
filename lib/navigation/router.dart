import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:top_git_rep/navigation/page_stack_controller.dart';
import 'package:top_git_rep/navigation/route_configuration.dart';

class AppRouter extends RouterDelegate<RouteConfiguration>
    with
        ChangeNotifier,
        PageStackController,
        PopNavigatorRouterDelegateMixin<RouteConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  RouteConfiguration? get currentConfiguration =>
      pages.isNotEmpty ? RouteConfiguration(page: pages.last) : null;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _navigatorKey,
      onPopPage: onPopPage,
      pages: pages,
      observers: <NavigatorObserver>[],
    );
  }

  @override
  Future<void> setNewRoutePath(RouteConfiguration configuration) {
    resetTo(configuration.page);
    return SynchronousFuture<void>(null);
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    onPopResultDispatch();
    final bool didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    pop();
    return true;
  }

  void pushNamedWithFixedPop(int popCount, Page<dynamic> page) {
    for (int i = 0; i < popCount; i++) {
      pop();
    }
    push(page);
  }
}
