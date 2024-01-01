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
    } else {
      Get.snackbar('Not available',
          'this column is already filled up. choose another column', // to show snack par if column is filled up
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  @override
  void onInit() {
    _buildBoard(); // to initialize buildBoard methode when controler hade been inzialized
    super.onInit();
  }
}
