import 'package:cat_breeds_app/core/injection_container.dart';
import 'package:cat_breeds_app/presentation/page/detail_page.dart';
import 'package:cat_breeds_app/presentation/page/home_page.dart';
import 'package:cat_breeds_app/presentation/page/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  initServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catbreeds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
        fontFamily: GoogleFonts.getFont('Roboto').fontFamily,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
      },
    );
  }
}
