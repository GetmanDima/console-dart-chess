import 'figure.dart';

class Rook extends Figure {
  final String symbol = 'r';

  Rook(String color) : super(color);

  @override
  bool checkMove(int fromRow, int fromCol, int toRow, int toCol) {
    // TODO: implement checkMove
    throw UnimplementedError();
  }
}