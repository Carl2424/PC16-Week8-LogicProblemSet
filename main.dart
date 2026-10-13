void main() {
  List<String> validInputs = ['88','75', '85', '90', '70', '60', '95', 'abc'] ;
  print('TEST');
  String report1 = evaluateScores(validInputs);
  print(report1);

}

String evaluateScores(List<String> rawScores) {
  int validCount = 0;
  int passCount = 0;
  int failCount = 0;
  double scoreSum = 0;

  for (int i = 0; i < rawScores.length; i++) {
    print('Score ${i + 1} of ${rawScores.length}: "${rawScores[i]}"');

    try {
      int score = int.parse(rawScores[i]);

      if (score < 0 || score > 100) {
        print('  -> Warning: $score is out of range (0-100). Skipping.');
        continue;
      }

      validCount++;
      scoreSum += score;

      if (score >= 75) {
        print('  -> Result: $score - PASSED');
        passCount++;
      } else {
        print('  -> Result: $score - FAILED (Needs Remedial)');
        failCount++;
      }
    } catch (e) {
      print('  -> [Error Handled] Invalid input "${rawScores[i]}": Cannot parse to integer.');
    }
  }

  double average = validCount > 0 ? scoreSum / validCount : 0.0;
  return '''

SUMMARY REPORT:
Total Inputs Processed: ${rawScores.length}
Valid Scores Count: $validCount
Passed: $passCount
Failed: $failCount
Class Average: ${average.toStringAsFixed(2)}% ''';
}
