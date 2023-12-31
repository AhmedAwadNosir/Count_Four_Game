import 'package:count_four/features/home_feature/presentations/widgets/cell.dart';
import 'package:flutter/material.dart';

class BoardColumn extends StatelessWidget {
  const BoardColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Cell(),
        Cell(),
        Cell(),
        Cell(),
        Cell(),
        Cell(),
      ],
    );
  }
}
