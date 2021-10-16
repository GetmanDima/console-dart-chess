import 'dart:io';
import 'Figure.dart';
import 'bishop.dart';
import 'king.dart';
import 'knight.dart';
import 'pawn.dart';
import 'queen.dart';
import 'rook.dart';
import 'square_interface.dart';

var desk = List.generate(8, (i) => List<SquareInterface?>.filled(8, null, growable: false), growable: false);
bool appIsWorking = true;

void initialize() {
  // Black
  desk[0][0] = Rook('b');
  desk[0][1] = Knight('b');
  desk[0][2] = Bishop('b');
  desk[0][3] = Queen('b');
  desk[0][4] = King('b');
  desk[0][5] = Bishop('b');
  desk[0][6] = Knight('b');
  desk[0][7] = Rook('b');

  // White
  desk[7][0] = Rook('w');
  desk[7][1] = Knight('w');
  desk[7][2] = Bishop('w');
  desk[7][3] = Queen('w');
  desk[7][4] = King('w');
  desk[7][5] = Bishop('w');
  desk[7][6] = Knight('w');
  desk[7][7] = Rook('w');

  for (int i = 0; i < 8; i++) {
    desk[1][i] = Pawn('b');
    desk[6][i] = Pawn('w');
  }
}

void move(String from, String to) {
  var columns = {'a': 0, 'b': 1, 'c': 2, 'd': 3, 'e': 4, 'f': 5, 'g': 6, 'h': 7};
  var fromRow = 8 - int.parse(from[1]);
  var fromCol = columns[from[0]] ?? 0;
  var toRow = 8 - int.parse(to[1]);
  var toCol = columns[to[0]] ?? 0;
  var figure = desk[fromRow][fromCol];

  desk[fromRow][fromCol] = null;
  desk[toRow][toCol] = figure;
}

void render() {
  for (int x = 0; x < 8; x++) {
    for (int y = 0; y < 8; y++) {
      if (desk[x][y] != null) {
        var color = desk[x][y]!.color == 'w' ? '\x1B[32m' : '\x1B[31m';
        var symbol = desk[x][y]!.symbol;

        if (desk[x][y]!.color == 'w') {
          symbol = symbol.toString().toUpperCase();
        }

        stdout.write(' ' + color + symbol + '\x1B[0m');
      } else {
        stdout.write(' 0');
      }
    }
    stdout.write('\n');
  }
}

void main(List<String> arguments) {
  initialize();
  print(desk);
  while (appIsWorking){
    render();
    stdout.write("Введите начальное поле: ");
    String? from = stdin.readLineSync();
    stdout.write("Введите конечное поле: ");
    String? to = stdin.readLineSync();

    if (from != '' && to != '') {
      move(from!, to!);
    } else {
      appIsWorking = false;
    }
  }
}

