import 'package:count_four/features/home_feature/presentations/widgets/game_view_body.dart';
import 'package:flutter/material.dart';

class Gameview extends StatelessWidget {
  const Gameview({super.key});
  static const id = "GameView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: GameViewBody());
  }
}
