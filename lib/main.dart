import 'package:count_four/core/bindings/main_binding.dart';
import 'package:count_four/features/home_feature/presentations/views/game_view.dart';
import 'package:count_four/features/home_feature/presentations/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CountFourApp());
}

class CountFourApp extends StatelessWidget {
  const CountFourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //GetMaterialApp is not nessasry for stateManagement  but it nessary for routing
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.blue),
      getPages: [
        GetPage(
            name: "/homeview",
            page: () =>
                const HomeView()), //Note name of every page must start with "/"
        GetPage(
            name: "/gameview",
            page: () => const Gameview(),
            binding: MainBindings()), // bindings for conect controler with page
      ],
      initialRoute: "/homeview",
    );
  }
}
