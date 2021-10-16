import 'figure.dart';

class Bishop extends Figure {
  final String symbol = 'b';

  Bishop(String color) : super(color);

  @override
  bool checkMove(int fromRow, int fromCol, int toRow, int toCol) {
    // TODO: implement checkMove
    throw UnimplementedError();
  }
}