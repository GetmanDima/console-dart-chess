import 'square_interface.dart';

abstract class Figure implements SquareInterface {
  late String symbol;
  String color;
  Figure(this.color);

  bool checkMove();
}