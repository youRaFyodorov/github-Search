import 'package:flutter/material.dart';
import 'package:top_git_rep/data/db_storage_factory_impl.dart';
import 'package:top_git_rep/main_screen.dart';
import 'package:top_git_rep/models/app_di.dart';
import 'package:top_git_rep/navigation/router.dart';

import 'navigation/app_information_parser.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  DbStorageFactoryImpl.createInstance();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final AppRouter appRouter;
  late final AppRouteInformationParser appRouteInformationParser;

  @override
  void initState() {
    appRouter = AppRouter();
    appRouteInformationParser =
        AppRouteInformationParser(intialPage: MainPage());
    getIt.registerSingleton(appRouter);
    getIt.registerSingleton(appRouteInformationParser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: appRouteInformationParser,
      routerDelegate: appRouter,
    );
  }
}
