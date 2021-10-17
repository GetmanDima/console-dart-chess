import 'bishop.dart';
import 'figure.dart';
import 'rook.dart';

class Queen extends Figure {
  final String symbol = 'q';

  Queen(String color) : super(color);

  @override
  bool checkMove(int fromRow, int fromCol, int toRow, int toCol) {
    var bishop = Bishop(color);
    var rook = Rook(color);
    var bishopCheck = bishop.checkMove(fromRow, fromCol, toRow, toCol);
    var rookCheck = rook.checkMove(fromRow, fromCol, toRow, toCol);
    print(bishopCheck);
    print(rookCheck);
    return bishopCheck || rookCheck;
  }
}