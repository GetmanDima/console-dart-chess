abstract class Figure {
  late String symbol;
  String color;
  Figure(this.color);

  bool checkMove(int fromRow, int fromCol, int toRow, int toCol);
}