import 'package:flutter/material.dart';
import 'package:flutter_amazon_clone/constants/global_variables.dart';
import 'package:flutter_amazon_clone/features/auth/screen/auth_screen.dart';
import 'package:flutter_amazon_clone/features/auth/services/auth_service.dart';
import 'package:flutter_amazon_clone/providers/user_provider.dart';
import 'package:flutter_amazon_clone/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        useMaterial3: false,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
