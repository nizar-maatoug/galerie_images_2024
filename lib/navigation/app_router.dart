import 'dart:async';

import 'package:flutter/material.dart';
import 'package:galerie_image_2024/core/pages/page_not_found.dart';
import 'package:galerie_image_2024/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:galerie_image_2024/features/auth/presentation/pages/auth_apge.dart';
import 'package:galerie_image_2024/features/auth/presentation/pages/login_page.dart';
import 'package:galerie_image_2024/features/auth/presentation/pages/register_page.dart';
import 'package:galerie_image_2024/features/auth/presentation/pages/update_user_page.dart';
import 'package:galerie_image_2024/features/gallerie/presentation/pages/gallerie_images_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final AuthBloc authBloc;

  AppRouter(this.authBloc);

  late final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: 'authentication',
        builder: (context, state) {
          return AuthPage();
        },
        routes: [
          GoRoute(
            path: 'register',
            name: 'register',
            builder: (context, state) {
              return RegisterPage();
            },
          ),
          GoRoute(
            path: 'login',
            name: 'login',
            builder: (context, state) {
              return LoginPage();
            },
          ),
          GoRoute(
            path: 'update',
            name: 'update_user',
            builder: (context, state) {
              return UpdateUserPage();
            },
          ),
        ],
      ),
      GoRoute(
          path: '/galerie',
          name: 'galerie',//découpler l'URL de son utilisation, si je modifie l'url => name c le meme
          builder: (context, state) {
            return GallerieImagePage();
          }),
    ],
    errorBuilder: (context, state) => PageNotFound(),
    redirect: (context, state) {
      final bool unauthenticated = authBloc.state is UnAuthenticatedState;
      final bool isGaleriePage = (state.subloc == '/galerie');

      if (unauthenticated && isGaleriePage) {
        return '/';
      }
    },
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
  );
}

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription<dynamic> _subscription;

  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
