import 'package:count_four/features/home_feature/presentations/views/game_view.dart';
import 'package:count_four/features/home_feature/presentations/views/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CountFourApp());
}

class CountFourApp extends StatelessWidget {
  const CountFourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      routes: {
        HomeView.id: (context) => const HomeView(),
        Gameview.id: (context) => const Gameview()
      },
      initialRoute: HomeView.id,
    );
  }
}
