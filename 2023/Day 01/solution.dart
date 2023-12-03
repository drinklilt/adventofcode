import 'dart:io';

void main() {
  // The sum of all calibration values
  int sum = 0;
  // open day01-input.txt and read the contents as lines
  List<String> lines = File('input.txt').readAsLinesSync();

  // For each line, find the first and last character that is a digit
  lines.forEach((element) {
    RegExp digit = RegExp(r'\d');
    int firstDigit = element.indexOf(digit);
    int lastDigit = element.lastIndexOf(digit);

    // Make the digit string from the first and last match
    String digitString = element[firstDigit] + element[lastDigit];

    // Convert the digit string to an integer
    int digitInt = int.parse(digitString);

    // Add to sum
    sum += digitInt;
  });

  // Print the sum
  print(sum);
}
