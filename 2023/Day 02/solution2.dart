import 'dart:io';

void main() {
  // sum of all powers of fewest cubes
  int sum = 0;

  // open input.txt and read the contents as lines
  List<String> lines = File('input.txt').readAsLinesSync();

  lines.forEach((element) {
    // the game is split into rounds (semicolon delimited)
    String game = element.split(":")[1].trim();

    var redComponent = RegExp(r'(\d+) red');
    var blueComponent = RegExp(r'(\d+) blue');
    var greenComponent = RegExp(r'(\d+) green');

    int redCubes = 0;
    int blueCubes = 0;
    int greenCubes = 0;

    // Get every match then get the largest number in group 1
    if (redComponent.hasMatch(game)) {
      redCubes = int.parse(redComponent
          .allMatches(game)
          .map((e) => e.group(1))
          .reduce((value, element) =>
              int.parse(value!) > int.parse(element!) ? value : element)!);
    }

    if (blueComponent.hasMatch(game)) {
      blueCubes = int.parse(blueComponent
          .allMatches(game)
          .map((e) => e.group(1))
          .reduce((value, element) =>
              int.parse(value!) > int.parse(element!) ? value : element)!);
    }

    if (greenComponent.hasMatch(game)) {
      greenCubes = int.parse(greenComponent
          .allMatches(game)
          .map((e) => e.group(1))
          .reduce((value, element) =>
              int.parse(value!) > int.parse(element!) ? value : element)!);
    }

    int power = redCubes * greenCubes * blueCubes;
    sum += power;
  });

  print(sum);
}
