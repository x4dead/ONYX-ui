import 'package:flutter/material.dart';
import 'package:onyx_ui/utils/router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router;
    return MaterialApp.router(
      title: 'ONYX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Gilroy',
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
    );
  }
}
