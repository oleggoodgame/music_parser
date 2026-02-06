int thirdLargest(List<int> arrays) {
  // [-5, 10, 12, -10, 0, 1, 20, 20]
  if (arrays.length < 3) {
    return 0;
  }
  //
  int first = arrays[0];
  int second = arrays[0];
  int third = arrays[0];

  for (int i in arrays) {
    if (i > first) {
      third = second;
      second = first;
      first = i;
    } else if (i > second && first > i) {
      third = second;
      second = i;
    } else if (i > third && second > i) {
      third = i;
    }
    // print("Third: $third");
  }
  return third;
}
