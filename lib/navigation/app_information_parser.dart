import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:top_git_rep/navigation/route_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<RouteConfiguration> {
  final Page<void> intialPage;
  AppRouteInformationParser ({required this.intialPage});
  bool isStartUp = true;
  Uri? initialUri;

  @override
  Future<RouteConfiguration> parseRouteInformation(
      RouteInformation routeInformation) {
    Uri? uri;
    if (isStartUp && initialUri != null) {
      uri = initialUri;
      isStartUp = false;
    } else {
      uri = Uri?.tryParse(routeInformation.location.toString());
    }
    late Page<dynamic> page;
    if (uri == null) {
      page = intialPage;
    } else {
      final List<String> uriSegments = uri.pathSegments;
      if (uriSegments.isEmpty) {
        page = intialPage;
      }
    }
    return SynchronousFuture<RouteConfiguration>(
      RouteConfiguration(page: page),
    );
  }
}