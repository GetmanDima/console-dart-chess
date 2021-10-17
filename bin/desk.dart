import 'dart:io';
import 'figure.dart';
import 'bishop.dart';
import 'king.dart';
import 'knight.dart';
import 'pawn.dart';
import 'queen.dart';
import 'rook.dart';

class Desk {
  static var position = List.generate(8, (i) => List<Figure?>.filled(8, null, growable: false), growable: false);

  static void initialize() {
    // Black
    position[0][0] = Rook('b');
    position[0][1] = Knight('b');
    position[0][2] = Bishop('b');
    position[0][3] = Queen('b');
    position[0][4] = King('b');
    position[0][5] = Bishop('b');
    position[0][6] = Knight('b');
    position[0][7] = Rook('b');

    // White
    position[7][0] = Rook('w');
    position[7][1] = Knight('w');
    position[7][2] = Bishop('w');
    position[7][3] = Queen('w');
    position[7][4] = King('w');
    position[7][5] = Bishop('w');
    position[7][6] = Knight('w');
    position[7][7] = Rook('w');

    for (int i = 0; i < 8; i++) {
      position[1][i] = Pawn('b');
      position[6][i] = Pawn('w');
    }
  }

  static bool move(String from, String to) {
    var columns = {'a': 0, 'b': 1, 'c': 2, 'd': 3, 'e': 4, 'f': 5, 'g': 6, 'h': 7};
    var fromRow = 8 - int.parse(from[1]);
    var fromCol = columns[from[0]] ?? 0;
    var toRow = 8 - int.parse(to[1]);
    var toCol = columns[to[0]] ?? 0;
    var figure = position[fromRow][fromCol];

    if (figure == null) {
      return false;
    }

    var check = figure.checkMove(fromRow, fromCol, toRow, toCol);

    if (check) {
      position[fromRow][fromCol] = null;
      position[toRow][toCol] = figure;
    }

    if (figure.symbol == 'p') {
      promotePawn();
    }

    if (figure.symbol == 'k') {
      castling(figure, fromRow, fromCol, toRow, toCol);
    }

    return check;
  }

  static void promotePawn() {
    for (int i = 0; i < 8; i++) {
      if (position[0][i] != null && position[0][i]!.symbol == 'p') {
        position[0][i] = Queen('w');
      }
      if (position[7][i] != null && position[7][i]!.symbol == 'p'){
        position[7][i] = Queen('b');
      }
    }
  }

  static void castling(figure, int fromRow, int fromCol , int toRow, int toCol) { // roque
    if (figure!.color == 'w' &&
        fromRow == 7 &&
        fromCol == 4 &&
        toRow == 7 &&
        toCol == 6
    ) {
      var rook = position[7][7];
      position[7][7] = null;
      position[7][5] = rook;
    }
  }

  static void render() {
    var blackFiguresSymbols = {
      'p': '\u{265F}',
      'r': '\u{265C}',
      'n': '\u{265E}',
      'b': '\u265D',
      'q': '\u{265B}',
      'k': '\u{265A}'
    };

    var whiteFiguresSymbols = {
      'p': '\u{2659}',
      'r': '\u{2656}',
      'n': '\u{2658}',
      'b': '\u{2657}',
      'q': '\u{2655}',
      'k': '\u{2654}'
    };

    for (int x = 0; x < 8; x++) {
      for (int y = 0; y < 8; y++) {
        if (position[x][y] != null) {
          var color = position[x][y]!.color == 'w' ? '\x1B[32m' : '\x1B[31m';
          var symbol = position[x][y]!.color == 'w' ? whiteFiguresSymbols[position[x][y]!.symbol] : blackFiguresSymbols[position[x][y]!.symbol];

          // if (position[x][y]!.color == 'w') {
          //   symbol = symbol.toString().toUpperCase();
          // }

          stdout.write(' ' + color + symbol! + '\x1B[0m');
        } else {
          stdout.write(' \u{25AD}');
        }
      }
      stdout.write('\n');
    }
  }
}