import 'package:count_four/features/home_feature/presentations/widgets/cell.dart';
import 'package:count_four/features/home_feature/states_manager/controler/game_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BoardColumn extends StatelessWidget {
  BoardColumn({
    super.key,
    required this.columnOfPlayerChips,
  });

  final GameControler gameControler = Get.find<GameControler>();
  final List<int> columnOfPlayerChips;
  List<Cell> _buildBoardColumn() {
    return columnOfPlayerChips.map((number) => Cell()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: _buildBoardColumn()
        //  [
        //   Cell(),
        //   Cell(),
        //   Cell(),
        //   Cell(),
        //   Cell(),
        //   Cell(),
        // ],
        );
  }
}
