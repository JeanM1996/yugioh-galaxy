import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:yugiohgalaxy/core/presentation/design/atoms/atoms.dart';
import 'package:yugiohgalaxy/core/presentation/design/tokens/colors.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipe_detail/arquetipe_detail_page.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/arquetipes_list/arquetipes_list_page.dart';
import 'package:yugiohgalaxy/features/arquetipes_section/presentation/card_detail/card_detail_page.dart';
import 'package:yugiohgalaxy/features/banned_section/presentation/arquetipes_list/banned_list_page.dart';
import 'package:yugiohgalaxy/features/home_section/presentation/home_section_page.dart';
import 'package:yugiohgalaxy/features/main/main_page.dart';
import 'package:yugiohgalaxy/localization/generated/lang.dart';
import 'package:yugiohgalaxy/splash_page/splash_page.dart';

class Routes {
  static const String rootRoute = '/';
  static const String homeRoute = '/home';
  static const String banCardRoute = '/banned';
  static const String arquetipesRoute = '/arquetipes';
  static const String arquetipeDetailRoute = '/arquetipeDetail';
  static const String cardRoute = '/card';
}

final router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: Routes.rootRoute,
      pageBuilder: (context, state) =>
          page(state: state, child: const SplashPage()),
    ),
    GoRoute(
      path: Routes.homeRoute,
      pageBuilder: (context, state) {
        return page(
          state: state,
          child: MainPage(
            pageTitle: Lang.of(context).home,
            customTitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  'Yu-Gi-Oh! Galaxy',
                  fontWeight: FontWeight.w500,
                  textColor: colors.darkOverlay,
                  fontFamily: 'Figtree',
                  letterSpacing: -0.5,
                ),
              ],
            ),
            pageState: 0,
            centerContent: false,
            child: const HomeSectionPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.arquetipesRoute,
      pageBuilder: (context, state) => page(
        state: state,
        child: MainPage(
          pageTitle: Lang.of(context).arquetipes,
          pageState: 1,
          child: ArquetipesListPage(state.extra! as Map),
        ),
      ),
    ),
    GoRoute(
      path: Routes.arquetipeDetailRoute,
      pageBuilder: (context, state) {
        final data = state.extra! as Map;

        return page(
          state: state,
          child: MainPage(
            showBackButton: true,
            showNavigationBar: false,
            pageTitle: Lang.of(context).arquetipeDetail,
            pageState: 2,
            child: ArquetipeDetailPage(state.extra! as Map),
          ),
        );
      },
    ),
    GoRoute(
      path: Routes.cardRoute,
      pageBuilder: (context, state) {
        final data = state.extra! as Map;

        return page(
          state: state,
          child: MainPage(
            showBackButton: true,
            showNavigationBar: false,
            pageTitle: Lang.of(context).cardDetail,
            pageState: 1,
            child: CardDetailPage(state.extra! as Map),
          ),
        );
      },
    ),

    //Banned
    GoRoute(
      path: Routes.banCardRoute,
      pageBuilder: (context, state) => page(
        state: state,
        child: MainPage(
          pageTitle: Lang.of(context).banlist,
          pageState: 2,
          child: BannedListPage(state.extra! as Map),
        ),
      ),
    ),
  ],
);

dynamic page({required GoRouterState state, required Widget child}) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
    );

final goRouterProvider = Provider<GoRouter>((ref) => router);
