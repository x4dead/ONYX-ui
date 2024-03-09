import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onyx_ui/l10n/l10n.dart';
import 'package:onyx_ui/modules/signal_service/river/river.dart';
import 'package:onyx_ui/utils/router/router.dart';
import 'package:onyx_ui/utils/user_pref.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPref.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(River.settingsPod);
    final router = AppRouter.router;
    return MaterialApp.router(
      title: 'ONYX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: UserPref.getLocale == 'ru' ? 'Gilroy' : "SF Pro Display",
        // iconButtonTheme: IconButtonThemeData(
        //   style: IconButton.styleFrom(minimumSize: kS36, padding: kPAll6),
        // ),
        // textSelectionTheme: TextSelectionThemeData(
        //     cursorColor: AppColors.colorDarkGray,
        //     selectionColor: AppColors.colorBlue.withOpacity(0.5),
        //     selectionHandleColor: AppColors.colorBlue)
      ),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      builder: (context, child) => child!,
      locale: Locale(settings.locale!),
      supportedLocales: L10n.all,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
