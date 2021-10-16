import 'figure.dart';

class King extends Figure {
  final String symbol = 'k';

  King(String color) : super(color);

  @override
  bool checkMove(int fromRow, int fromCol, int toRow, int toCol) {
    // TODO: implement checkMove
    throw UnimplementedError();
  }
}