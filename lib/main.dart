import 'package:ecommereceapp/%20utils/theme.dart';
import 'package:ecommereceapp/providers/auth_provider.dart';
import 'package:ecommereceapp/providers/home_provider.dart';
import 'package:ecommereceapp/providers/navigation_provider.dart';
import 'package:ecommereceapp/screens/auth/login_screen.dart';
import 'package:ecommereceapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/category_provider.dart';
import './providers/product_provider.dart';
import './providers/cart_provider.dart';
import './providers/order_provider.dart';
import 'navigation_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => NavigationController()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: SAppTheme.lightTheme,
        darkTheme: SAppTheme.darkTheme,
        home: const NavigationMenu(),
      ),
    );
  }
}
