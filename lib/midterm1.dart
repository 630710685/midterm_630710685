import 'dart:math';

enum Result {
  correct,
  incorrect,
}

class Game {
  static const defaultMaxRandom = 100;
  int? Temp;
  int _guessCount = 0;

  static final List<int> guessCountList = [];



  int get guessCount {
    return _guessCount;
  }

  void addCountList() {
    guessCountList.add(_guessCount);
  }
  Result doGuess(int num) {
    _guessCount++;
    if (num >= 0) {

      Temp = ((num * (9/5)) + 32) as int? ;
      print('$num Celsius to $Temp Fahrenheit');

      return Result.correct;

    } else {
      return Result.incorrect;
    }
  }
}