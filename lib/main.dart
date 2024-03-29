
import 'package:flutter/material.dart';
import 'package:productos_app/screens/product_screen.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/servides.dart';
import 'package:provider/provider.dart';

import 'screens/dashboard_screen.dart';
import 'screens/deposito_screen.dart';
import 'screens/retiro_screen.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsService(),
        ),
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginScreen(),
        'home': (_) => const HomeScreen(),
        'product': (_) => const ProductScreen(),
        'register': (_) => const RegisterScreen(),
        'dashboard': (_) => DashboardScreen(),
        'deposito': (_) => DepositoScreen(),
        'retiro': (_) => RetiroScreen(),
      },
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.amber,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
          elevation: 0,
        ),
      ),
    );
  }
}
