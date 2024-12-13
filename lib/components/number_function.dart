String numberFunction(String value) {
  String number = '';
  for (var i = 0; i <= 11; i++) {
    if (i == 0) {
      number += '+${value.substring(0, 3)}';
    } else if (i == 3) {
      number += ' (${value.substring(3, 5)}) ';
    } else if (i == 5) {
      number +=
          '${value.substring(5, 8)}-${value.substring(8, 10)}-${value.substring(10, 12)}';
    }
  }
  return number;
}
