import 'dart:io';
import 'dart:math';

Random rnd = new Random();

void main() {
  int max_age = 100;
  int min_age = 1;
  int guessed = 0;

  int age = min_age + rnd.nextInt(max_age - min_age);

  while (guessed == 0) {
    print("Guess the age: ");
    var guess_age = stdin.readLineSync();
    var guess_age_int = int.tryParse(guess_age ?? "");

    if (guess_age_int == null) {
      print("input a number");
    } else if (guess_age_int > age) {
      print("Age is lower");
    } else if (guess_age_int < age) {
      print("Age is higher");
    } else {
      print("YOU GOT IT");
      guessed++;
    }
  }
}
