import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/builder_screen.dart';
import 'screens/preview_screen.dart';
import 'screens/proof_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Resume Builder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: Colors.black,
          secondary: Colors.grey,
          surface: Colors.white,
        ),
        useMaterial3: true,
        fontFamily: 'Helvetica', // Default sans-serif
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/builder': (context) => const BuilderScreen(),
        '/preview': (context) => const PreviewScreen(),
        '/proof': (context) => const ProofScreen(),
      },
    );
  }
}
