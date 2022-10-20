
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:youtube_sample_app/features/cart/presentation/ui/cart_screen.dart';
import 'package:youtube_sample_app/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:youtube_sample_app/features/setting/presentation/ui/setting_screen.dart';
import 'package:youtube_sample_app/route/named_route.dart';
import 'package:youtube_sample_app/screen/error/route_error_screen.dart';
import 'package:youtube_sample_app/screen/home_screen.dart';


final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator = GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/home',
        name: root,
        builder: (context, state) => HomeScreen(key: state.pageKey),
      ),

      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) => DashboardScreen(key: state.pageKey, child: child),

        routes: [
          GoRoute(            
            path: '/',
            name: home,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeScreen(
                  key: state.pageKey,
                )
              );
            },
          ),
          GoRoute(            
            path: '/cart',
            name: cart,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: CartScreen(
                  key: state.pageKey,
                )
              );
            },
          ),
          GoRoute(            
            path: '/setting',
            name: setting,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: SettingScreen(
                  key: state.pageKey,
                )
              );
            },
          )
        ]
      )

    ],
    errorBuilder: (context, state) => RouteErrorScreen(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});