import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/features/auth/screen/auth_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    default:
      // 404
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${routeSettings.name}'),
          ),
        ),
      );
  }
}
