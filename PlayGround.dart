
Future<void> main() async {
  // var stream = countStream(10);
  // var sum = await sumStream1(stream);
  // print(sum); // 55
  // sumStream2(stream);
  firstRecurringCharacter();
}

void firstRecurringCharacter() {
  List<int> input = [5, 1, 2, 3, 4, 5, 7];
  String result = '';
  Map<int, int> map = {};
  for(var i = 0; i < input.length; i++) {
    if(map[input[i]] != null) {
      result = '${input[i]}';
      break;
    } else {
      map[input[i]] = i;
    }
  }
  print(result);
}

void sumStream2(Stream<int> stream) async {
  var sum = 0;
  stream.listen(
    (event) {
      sum += event;
      print(' Event: $event, Sum: $sum');
    },
    onError: (error) {
      print('Error: $error');
    },
    onDone: () {
      print('Ok!, I am done!');
    },
  );
}

Future<int> sumStream1(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    print(' value: $value');
    sum += value;
  }
  return sum;
}

Stream<int> countStream(int to) async* {
  for (var i = 1; i <= to; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    // if (i == 5) throw Exception('Nahhh!');
    if (i == 5) await Future.error(Exception('My Exception!'));
    yield i;
  }
}
