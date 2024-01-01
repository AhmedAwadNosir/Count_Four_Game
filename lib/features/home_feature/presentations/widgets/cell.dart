import 'package:count_four/features/home_feature/presentations/widgets/coin.dart';
import 'package:flutter/material.dart';

enum cellMode {
  Empty,
  Yellow,
  RED,
}

class Cell extends StatelessWidget {
  const Cell({
    super.key,
    @required this.currentCellMode,
  });

  final currentCellMode;
  Coin _buildCoin() {
    switch (this.currentCellMode) {
      case cellMode.Yellow:
        return Coin(coinColor: Colors.yellow);
      case cellMode.RED:
        return Coin(coinColor: Colors.red);
      default:
        return Coin(coinColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        Positioned.fill(
          child: Align(alignment: Alignment.center, child: _buildCoin()),
        )
      ],
    );
  }
}
