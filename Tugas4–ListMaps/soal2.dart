List<int> rangeWithStep(int num1, int num2, int step) {
  List<int> result = [];

  if (num1 > num2) {
    // Descending order
    for (int i = num1; i >= num2; i -= step) {
      result.add(i);
    }
  } else {
    // Ascending order
    for (int i = num1; i <= num2; i += step) {
      result.add(i);
    }
  }

  return result;
}

void main(List<String> args) {
  print(rangeWithStep(30, 23, 3)); // Output: [30, 27, 24]
}
