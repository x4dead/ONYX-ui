import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:onyx_ui/themes/colors/app_colors.dart';
import 'package:onyx_ui/ui/pages/auth_page/auth_page.dart';
import 'package:onyx_ui/ui/pages/new_card_page/new_card_page.dart';
import 'package:onyx_ui/ui/pages/news_page/news_page.dart';
import 'package:onyx_ui/ui/pages/payment_page/payment_page.dart';
import 'package:onyx_ui/ui/pages/payment_schedule_page/payment_schedule_page.dart';
import 'package:onyx_ui/ui/pages/reconstruction_page/reconstruction_page.dart';
import 'package:onyx_ui/ui/pages/settings_page/settings_page.dart';
import 'package:onyx_ui/ui/pages/splash_screen/splash_screen.dart';
import 'package:onyx_ui/ui/pages/support_page/support_page.dart';
import 'package:onyx_ui/ui/widgets/custom_app_bar.dart';
import 'package:onyx_ui/utils/router/fade_transition.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final shellNavigatorKey = GlobalKey<NavigatorState>();
  static final sectionShellKey = GlobalKey<NavigatorState>();
  static final GoRouter router = GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      observers: [GoRouterObserver()],
      initialLocation: '/',
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          redirect: (_, __) {
            // if (UserPref.getUserUid != '') {
            // return '/main';
            // } else {
            return '/splash';
            // return '/auth';
            // }
          },
        ),
        GoRoute(
          name: 'new-card',
          path: '/new-card',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: const NewCardPage(), key: state.pageKey);
          },
        ),
        GoRoute(
          name: 'payment',
          path: '/payment',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: const PaymentPage(), key: state.pageKey);
          },
        ),
        GoRoute(
          path: '/auth',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: const AuthPage(), key: state.pageKey);
          },
        ),
        GoRoute(
          path: '/splash',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: const SplashScreen(), key: state.pageKey);
          },
        ),
        GoRoute(
          path: '/reconstruction',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: ReconstructionPage(routeState: state),
                key: state.pageKey);
            // }
          },
        ),
        GoRoute(
          path: '/news',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: NewsPage(routeState: state), key: state.pageKey);
          },
        ),
        GoRoute(
          path: '/payment_schedule',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: PaymentSchedulePage(routeState: state),
                key: state.pageKey);
          },
        ),
        GoRoute(
          name: 'settings',
          path: '/settings',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: SettingsPage(routeState: state), key: state.pageKey);
          },
        ),
        // GoRoute(
        //   name: 'booking_object',
        //   path: '/booking_object',
        //   pageBuilder: (context, state) {
        //     Map<String, dynamic>? map = state.extra as Map<String, dynamic>?;
        //     return FadeTransitionPage(
        //         child: BookingObjectPage(
        //             isNewObjectPage: map?['is_new_object'],
        //             objectToBook: map?['info'] == null
        //                 ? null
        //                 : ObjectToBook.fromMap(map?['info'])),
        //         key: state.pageKey);
        //   },
        // ),
        // GoRoute(
        //   name: 'guest_info',
        //   path: '/guest_info',
        //   pageBuilder: (context, state) {
        //     Map<String, dynamic>? map = state.extra as Map<String, dynamic>?;
        //     // if (map?['nav_instant_effect'] != true) {
        //     //  return MaterialPageRoute(builder: builder)
        //     // }
        //     return FadeTransitionPage(
        //         // isInstantEffect: true,
        //         child: GuestInfoPage(
        //             guestModel: map?['info'] == null
        //                 ? null
        //                 : GuestModel.fromMap(map?['info']),
        //             isRegisterGuest: map?["is_register_guest"] ?? false),
        //         key: state.pageKey);
        //   },
        // ),
        // GoRoute(
        //   name: 'profile',
        //   path: '/profile',
        //   pageBuilder: (context, state) {
        //     return FadeTransitionPage(
        //         child: ProfilePage(routeState: state), key: state.pageKey);
        //   },
        // ),
        GoRoute(
          name: 'support',
          path: '/support',
          pageBuilder: (context, state) {
            return FadeTransitionPage(
                child: SupportPage(routeState: state), key: state.pageKey);
          },
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
          backgroundColor: AppColors.colorWhite,
          appBar: CustomAppBar(
              title: 'Not found page',
              leading: (null, () => context.go('/auth'))),
          body: const Center(child: Text('Not found route'))));
}

class GoRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didPush: $route');
    log('MyTest didPush pref: $previousRoute');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didPop: $route');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('MyTest didRemove: $route');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log('MyTest didReplace: $newRoute');
  }
}
