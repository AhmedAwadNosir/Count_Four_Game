import 'package:count_four/features/home_feature/presentations/widgets/coin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameControler extends GetxController {
  final RxList<List<int>> _board = RxList<List<int>>();
  set board(List<List<int>> value) =>
      _board.value = value; //this for set values of ever cell in game_board

  List<List<int>> get board =>
      _board.value; // this for returning values of every cell in game_board

  void _buildBoard() {
    _turnYellow.value = true;
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
    update();
  }

  RxBool _turnYellow = true.obs; //this for defin which player has turn to play
  bool get turnYellow => _turnYellow
      .value; // to get value that define which player have trun to play

  void playColumn(int columnNumber) {
    //this methode is resbonsable for when player tack action that method aply to colum chosen color of the player
    final int playerNumber = turnYellow
        ? 1
        : 2; // this for get player number to define the color of the coin
    final selectedColumn = board[
        columnNumber]; //this for define who is the column sected to make coin
    if (selectedColumn.contains(0)) {
      // to define if column has empty cell
      final int rowIndex = selectedColumn.indexWhere((cell) =>
          cell == 0); // to get first empty cell to change its color to player
      selectedColumn[rowIndex] =
          playerNumber; // changing cell is selected to color of the player
      _turnYellow.value =
          !_turnYellow.value; // changing the player have the turn to play
      update(); // to update ui

      int resultHorizantal = checkHorizontals();
      int resultVirtecals = checkVerticals();

      //* to update ui when any of the player won with dialog show whos palyer when and rebuild ui
      if (resultHorizantal == 1 || resultVirtecals == 1) {
        Get.defaultDialog(
                title: "YELLOW WON", content: Coin(coinColor: Colors.yellow))
            .then((value) => _buildBoard());
      } else if (resultHorizantal == 2 || resultVirtecals == 2) {
        Get.defaultDialog(
                title: "RED WON", content: Coin(coinColor: Colors.red))
            .then((value) => _buildBoard());
        ;
      }
    } else {
      Get.snackbar('Not available',
          'this column is already filled up. choose another column', // to show snack par if column is filled up
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //* to check every cell in every row
  int checkHorizontals() {
    int yellowInRow = 0;
    int redInRow = 0;
    List<List<int>> rows = [];
    for (var i = 0; i < 6; i++) {
      final List<int> currentRow =
          getRowList(i); // for storing each row (with its cells) in current row
      rows.add(
          currentRow); // ading row to list of list of intg contain all row of its cells
    }

    //* to check every cell in every row
    for (final row in rows) {
      for (final cell in row) {
        if (yellowInRow >= 4) {
          return 1;
        } else if (redInRow >= 4) {
          return 2;
        } else {
          if (cell == 1) {
            yellowInRow++;
            redInRow = 0;
          } else if (cell == 2) {
            redInRow++;
            yellowInRow = 0;
          } else {
            yellowInRow = 0;
            redInRow = 0;
          }
        }
      }
    }
    return 0;
  }

  //*to get every cell in current row
  List<int> getRowList(int rowNumber) {
    List<int> rowList = [];
    for (final Column in board) {
      rowList.add(Column[rowNumber]);
    }
    return rowList;
  }

  //*to check every cell in every column
  int checkVerticals() {
    int yellowInRow = 0;
    int redInRow = 0;

    for (final column in board) {
      for (final cell in column) {
        if (yellowInRow >= 4) {
          return 1;
        } else if (redInRow >= 4) {
          return 2;
        } else {
          if (cell == 1) {
            yellowInRow++;
            redInRow = 0;
          } else if (cell == 2) {
            redInRow++;
            yellowInRow = 0;
          } else {
            yellowInRow = 0;
            redInRow = 0;
          }
        }
      }
    }
    return 0;
  }

  @override
  void onInit() {
    _buildBoard(); // to initialize buildBoard methode when controler hade been inzialized
    super.onInit();
  }
}
