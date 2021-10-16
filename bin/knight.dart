import 'figure.dart';

class Knight extends Figure {
  final String symbol = 'n';

  Knight(String color) : super(color);

  @override
  bool checkMove(int fromRow, int fromCol, int toRow, int toCol) {
    // TODO: implement checkMove
    throw UnimplementedError();
  }
}