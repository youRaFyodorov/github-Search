// import 'package:flutter/material.dart';
// import 'package:top_git_rep/navigation/router.dart';
//
// import 'app_information_parser.dart';
//
// class UniLinksAdapter {
//   final AppRouter appRouter;
//   final AppRouteInformationParser appRouteInformationParser;
//
//   UniLinksAdapter({
//     required this.appRouter,
//     required this.appRouteInformationParser,
//   });
//
//   Future<void> init() async {
//     await _getInitialUri();
//     await _initDeepLinkListener();
//   }
//
//   Future<void> _getInitialUri() async {
//     try {
//       final Uri? initialUri = await getInitialUri();
//       if (initialUri != null) {
//         appRouteInformationParser.initialUri = initialUri;
//       } else {
//       }
//     } catch (e) {
//       String? errorMessage;
//       if (e is AppException) {
//         errorMessage = e.message;
//       }
//     }
//   }
//
//   Future<void> _initDeepLinkListener() async {
//     uriLinkStream.listen(
//           (Uri? uri) async {
//         if (uri != null) {
//           appRouter.setNewRoutePath(
//             await appRouteInformationParser.parseRouteInformation(
//               RouteInformation(
//                 location: uri.toString(),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
