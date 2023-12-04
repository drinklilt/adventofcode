import 'dart:io';

void main() {
  // sum of all part numbers in the engine schamatic
  int sum = 0;

  // Open input.txt and read all the lines
  var lines = File('input.txt').readAsLinesSync();

  // Symbols:  * + & = $ / - % # @ -> (\*|\+|&|=|\$|\/|-|%|#|@)
  var symbols = RegExp(r'(\*|\+|&|=|\$|\/|-|%|#|@)');
  lines.asMap().forEach((index, line) {
    //print("Line: $index");
    //print(line);
    // Get all numbers in the line
    var numbersRegex = RegExp(r'(\d+)');
    var numbers = numbersRegex.allMatches(line);
    if (numbers.length == 0) return;

    numbers.forEach((match) {
      // match.start is the start index of the match
      // match.end is the end index of the match
      int answer = 0;

      // Check for symbols before the number
      if (match.start > 0) {
        var prev = line[match.start - 1];
        if (prev.contains(symbols)) {
          answer = int.parse(match.group(0)!);
        }
      }

      // Check for symbols after the number
      if (match.end < line.length) {
        int endIndex =
            (match.end) > line.length - 1 ? line.length - 1 : match.end;
        var next = line[endIndex];
        if (next.contains(symbols)) {
          answer = int.parse(match.group(0)!);
        }
      }

      // Check for symbols on the line above the number between match.start -1 and match.end + 2
      if (index > 0) {
        int startIndex = (match.start - 1) < 0 ? 0 : match.start - 1;
        int endIndex = (match.end + 1) > lines[index - 1].length
            ? lines[index - 1].length
            : match.end + 1;
        var prevLine = lines[index - 1].substring(startIndex, endIndex);
        if (prevLine.contains(symbols)) {
          answer = int.parse(match.group(0)!);
        }
      }

      // Check for symbols on the line below the number between match.start -1 and match.end + 2
      if (index < lines.length - 1) {
        int startIndex = (match.start - 1) < 0 ? 0 : match.start - 1;
        int endIndex = (match.end + 1) > lines[index + 1].length
            ? lines[index + 1].length
            : match.end + 1;
        var nextLine = lines[index + 1].substring(startIndex, endIndex);
        if (nextLine.contains(symbols)) {
          answer = int.parse(match.group(0)!);
        }
      }
      sum += answer;
    });
  });
  print(sum);
}
