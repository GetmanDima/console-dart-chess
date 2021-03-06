import 'dart:math';

import 'desk.dart';
import 'figure.dart';

class King extends Figure {
  final String symbol = 'k';

  King(String color) : super(color);

  @override
  bool checkMove(int fromRow, int fromCol, int toRow, int toCol) {
    var figureColor = Desk.position[fromRow][fromCol]!.color;

    if (Desk.position[toRow][toCol] != null &&
        Desk.position[toRow][toCol]!.color ==
            Desk.position[fromRow][fromCol]!.color) {
      return false;
    }

    if (figureColor == 'w') {
      if (fromRow == 7 &&
          fromCol == 4 &&
          toRow == 7 &&
          toCol == 6 &&
          Desk.position[7][5] == null &&
          Desk.position[7][7] != null &&
          Desk.position[7][7]!.symbol == 'r') {
        return true;
      }

      if (fromRow == 7 &&
          fromCol == 4 &&
          toRow == 7 &&
          toCol == 2 &&
          Desk.position[7][1] == null &&
          Desk.position[7][3] == null &&
          Desk.position[7][0] != null &&
          Desk.position[7][0]!.symbol == 'r') {
        return true;
      }
    }

    if (pow(toRow - fromRow, 2) + pow(toCol - fromCol, 2) > 2) {
      return false;
    }

    return true;
  }
}
