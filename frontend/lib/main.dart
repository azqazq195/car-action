import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:frontend/config/app_scroll_behavior.dart';
import 'package:frontend/on_board/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      title: "Flutter Demo",
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.redAccent,
        // pageTransitionsTheme: CustomPageTransitionsTheme(),
      ),
      initialRoute: '/on-board',
      routes: {
        '/on-board': (context) => const OnBoardScreen(),
      },
    );
  }
}

class CustomPageTransitionsTheme extends PageTransitionsTheme {
  CustomPageTransitionsTheme()
      : super(
          builders: kIsWeb
              ? {
                  for (final platform in TargetPlatform.values)
                    platform: const NoTransitionsBuilder(),
                }
              : const {
                  TargetPlatform.android: NoTransitionsBuilder(),
                  TargetPlatform.iOS: NoTransitionsBuilder(),
                },
        );
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget? child,
  ) {
    return child!;
  }
}
