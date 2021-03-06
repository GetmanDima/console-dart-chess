import 'dart:math';
import 'desk.dart';
import 'figure.dart';

class Knight extends Figure {
  final String symbol = 'n';

  Knight(String color) : super(color);

  @override
  bool checkMove(int fromRow, int fromCol, int toRow, int toCol) {
    if (Desk.position[toRow][toCol] != null
        && Desk.position[toRow][toCol]!.color == Desk.position[fromRow][fromCol]!.color
    ) {
      return false;
    }

    if (pow(toRow - fromRow, 2) + pow(toCol - fromCol, 2) != 5) {
      return false;
    }

    return true;
  }
}