void main(List<String> args) {
  List result = fibonacci(10);
  print(result);
  print(result.firstWhere((element) => element > 50));
  print(result.every((element) => element < 90));
  var novaLista = [1, 3, 80];
  print([result, novaLista].expand((element) => element).toList());
  result.fillRange(4, 5);
  print(result);
}

List fibonacci(int limit) {
  var numbers = [0, 1];
  for (var i = 0; i < limit; i++) {
    var penultimate = numbers.elementAt(numbers.length - 2);
    var newValue = numbers.last + penultimate;
    numbers.add(newValue);
  }
  return numbers;
}
