import 'figure.dart';

class Queen extends Figure {
  final String symbol = 'q';

  Queen(String color) : super(color);

  @override
  bool checkMove(int fromRow, int fromCol, int toRow, int toCol) {
    // TODO: implement checkMove
    throw UnimplementedError();
  }
}