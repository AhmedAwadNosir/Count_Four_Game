import 'package:count_four/features/home_feature/presentations/widgets/game_board.dart';
import 'package:flutter/material.dart';

class GameViewBody extends StatelessWidget {
  const GameViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff4554F1),
            Color(0xffE544EC),
            Color(0xff4554F1),
            Color(0xffE544EC),
            Color(0xff4554F1),
          ],
        ),
      ),
      child: GameBoard(),
    );
  }
}
