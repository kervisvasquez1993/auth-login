import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:teslo_shop/config/router/app_router_notifier.dart';
import 'package:teslo_shop/features/auth/auth.dart';
import 'package:teslo_shop/features/auth/presentation/providers/auth_provider.dart';
import 'package:teslo_shop/features/products/products.dart';

final goRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
      initialLocation: '/splash',
      refreshListenable: goRouterNotifier,
      routes: [
        ///*Splash
        GoRoute(
            path: '/splash', builder: (context, state) => CheckStatusScreen()),

        ///* Auth Routes
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterScreen(),
        ),

        ///* Product Routes
        GoRoute(
          path: '/',
          builder: (context, state) => const ProductsScreen(),
        ),
      ],

      ///! TODO: Bloquear si no se está autenticado de alguna manera
      redirect: ((context, state) {
        final isGoinTo = state.subloc;
        final authStatus = goRouterNotifier.authStatus;
        if (isGoinTo == '/splash' && authStatus == AuthStatus.checking)
          return null;
        if (authStatus == AuthStatus.notAuthenticated) {
          if (isGoinTo == '/login' ||
              isGoinTo == '/register' ||
              isGoinTo == '/splash') {
            return '/';
          }
        }

        return null;
      }));
});
