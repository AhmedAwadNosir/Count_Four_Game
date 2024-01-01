import 'dart:ffi';

import 'package:get/get.dart';

class GameControler extends GetxController {
  final RxList<List<int>> _board = RxList<List<int>>();
  set board(List<List<int>> value) =>
      _board.value = value; //this for set values of ever cell in game_board
  List<List<int>> get board =>
      _board.value; // this for returning values of every cell in game_board

  void _buildBoard() {
    board = [
      List.filled(6,
          0), // this is list of integer for every column in game board set value of each cell to 0
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
    ];
  }

  @override
  void onInit() {
    _buildBoard(); // to initialize buildBoard methode when controler hade been inzialized
    super.onInit();
  }
}
