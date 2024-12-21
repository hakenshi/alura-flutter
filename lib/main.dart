import 'package:alura_flutter/data/waifu_inherited.dart';
import 'package:alura_flutter/screens/form_screen.dart';
import 'package:alura_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/form': (context) => const FormScreen(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          useMaterial3: false),
      home: WaifuInherited(child: const HomeScreen()),
    );
  }
}
