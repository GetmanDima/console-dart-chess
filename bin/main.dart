import 'dart:io';
import 'desk.dart';

bool appIsWorking = true;

void main(List<String> arguments) {
  Desk.initialize();

  while (appIsWorking) {
    Desk.render();

    // Ввод
    stdout.write("Введите начальное поле: ");
    String? from = stdin.readLineSync();
    stdout.write("Введите конечное поле: ");
    String? to = stdin.readLineSync();

    if (from != '' && to != '') {
      var moveStatus = Desk.move(from!, to!);
      if (!moveStatus) {
        print('Invalid move');
      }
    } else {
      appIsWorking = false;
    }
  }
}