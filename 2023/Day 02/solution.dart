import 'dart:io';

void main() {
  // sum of all game ids
  int sum = 0;

  // open input.txt and read the contents as lines
  List<String> lines = File('input.txt').readAsLinesSync();

  lines.forEach((element) {
    // We need to get the game ID, then figure out if the game is possible
    int gameId = int.parse(element.split(":")[0].split(" ")[1]);

    // the game is split into rounds (semicolon delimited)
    List<String> rounds = element.split(":")[1].split(";");
    bool isPossible = rounds.every((element) => isRoundPossible(element));

    if (isPossible) {
      sum += gameId;
    }
  });

  print(sum);
}

bool isRoundPossible(String round) {
  bool isPossible = true;

  // round looks like: 5 red, 3 blue, 6 green
  // get the number of red, blue, and green balls
  var redComponent = RegExp(r'(\d+) red');
  var blueComponent = RegExp(r'(\d+) blue');
  var greenComponent = RegExp(r'(\d+) green');

  if (redComponent.hasMatch(round)) {
    int redCubes = int.parse(redComponent.firstMatch(round)!.group(1)!);
    if (redCubes > 12) {
      isPossible = false;
    }
  }

  if (blueComponent.hasMatch(round)) {
    int blueCubes = int.parse(blueComponent.firstMatch(round)!.group(1)!);
    if (blueCubes > 14) {
      isPossible = false;
    }
  }

  if (greenComponent.hasMatch(round)) {
    int greenCubes = int.parse(greenComponent.firstMatch(round)!.group(1)!);
    if (greenCubes > 13) {
      isPossible = false;
    }
  }

  return isPossible;
}
