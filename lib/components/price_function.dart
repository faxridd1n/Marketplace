String addSpaceEveryThreeCharacters(String numberString) {
  StringBuffer spacedNumber = StringBuffer();
  StringBuffer result = StringBuffer();
  for (int i = numberString.length - 1; i >= 0; i--) {
    spacedNumber.write(numberString[i]);

    // Add a space after every 3rd character, except for the last group
   
  }
  for (int i = spacedNumber.length - 1; i >= 0; i--) {
    String a = spacedNumber.toString();
    result.write(a[i]);
     if ((i) % 3 == 0) {
      result.write(' ');
    }
  }

  return result.toString();
}

// void main() {
//   String number = "123456789";
//   String spacedNumber = addSpaceEveryThreeCharacters(number);
//   print(spacedNumber);  // Output: 123 456 789
// }