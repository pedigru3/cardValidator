void main() {
  String numCard1 = '4916 6418 5936 9080';
  String numCard2 = '5419 8250 0346 1210';

  isvalid(numCard1);
  isvalid(numCard2);
}

isvalid(String numCard) {
  List<String> digits = toDigits(numCard);
  String lastDigit = digits.removeLast();
  var products = <int>[];
  for (var i = 0; i < digits.length; i++) {
    products.add(multiply(digits[i], i));
  }
  var sumOfAllProducts = products.reduce((value, element) => value + element);
  var rest = sumOfAllProducts % 10;
  var isValidCard = (rest.toString() == lastDigit);

  if (isValidCard) {
    print('---------------------------------------');
    print('O Cartão $numCard é válido');
    print('---------------------------------------');
  } else {
    print('---------------------------------------');
    print('Cartão $numCard é inválido');
    print('---------------------------------------');
  }
}

List<String> toDigits(String numCard) =>
    numCard.replaceAll(' ', '').split('').toList();

int multiply(String value, int index) {
  var digit = int.parse(value);
  if (index % 2 == 0) {
    return sumIfTwoDigits(digit * 2);
  } else {
    return sumIfTwoDigits(digit * 1);
  }
}

int sumIfTwoDigits(int value) {
  if (value > 9) {
    var result = value.toString().split('');
    return int.parse(result[0]) + int.parse(result[1]);
  } else {
    return value;
  }
}
