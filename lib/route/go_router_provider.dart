
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_sample_app/route/named_route.dart';
import 'package:youtube_sample_app/screen/error/route_error_screen.dart';
import 'package:youtube_sample_app/screen/home_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/home',
        name: root,
        builder: (context, state) => HomeScreen(key: state.pageKey),
      )

    ],
    errorBuilder: (context, state) => RouteErrorScreen(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});