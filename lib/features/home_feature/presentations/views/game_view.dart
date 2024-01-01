import 'package:count_four/features/home_feature/presentations/widgets/game_view_body.dart';
import 'package:count_four/features/home_feature/states_manager/controler/game_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Gameview extends StatelessWidget {
  Gameview({super.key});
  static const id = "GameView";
  final GameControler gameControler = Get.find<GameControler>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff4554F1),
          title: Obx(() => Text(
                gameControler.turnYellow
                    ? "Player Yellow"
                    : "player Red", // to show palyer that have turn to play
                style: TextStyle(
                    color:
                        gameControler.turnYellow ? Colors.yellow : Colors.red),
              )),
        ),
        body: GameViewBody());
  }
}
