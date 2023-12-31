import 'package:count_four/features/home_feature/presentations/widgets/coin.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        const Positioned.fill(
          child: Align(
            alignment: Alignment.center,
            child: Coin(
              coinColor: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
