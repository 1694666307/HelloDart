import 'dart:math';

void dartcore_numbers_numbers_collections_strings_and_more() {
  print("\n /" + '-' * 20 + "数字、集合、字符串功能测试" + '-' * 20 + "/ \n");

  // 数字

  // 数字常用操作
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  // 数字进制设定
  assert(int.parse('42', radix: 16) == 66);

  // Convert an int to a string.
  assert(42.toString() == '42');

  // Convert a double to a string.
  assert(123.456.toString() == '123.456');

  // Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  // 字符串查找

  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // 字符串分割
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  assert('Never odd or even'[0] == 'N');

  for (final char in 'hello'.split('')) {
    print(char);
  }

  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  // 字符串修改
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');
  assert('  hello  '.trim() == 'hello');

  // 判断
  assert(''.isEmpty);
  assert('  '.isNotEmpty);

  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  assert(greeting != greetingTemplate);

  // 字符串构造

  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  // 正则表达式
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));
  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
}

void testLists(){
  // 构造列表
  var grains = <String>[];
  assert(grains.isEmpty);
  var fruits = ['apples', 'oranges'];

  // 增
  fruits.add('kiwis');
  fruits.addAll(['grapes', 'bananas']);

  assert(fruits.length == 5);

  // 删
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  fruits.clear();
  assert(fruits.isEmpty);


  //通过构造函数构造列表
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  fruits = ['bananas', 'apples', 'oranges'];
  // 查
  assert(fruits[1] == 'apples');
  assert(fruits.indexOf('apples') == 1);

  // 列表排序
  fruits.sort((a, b) => a.compareTo(b));
  assert(fruits[0] == 'apples');

  //限制类型
  fruits = <String>[];

  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);

  // fruits.add(5); 此句将报错

}

void testSets(){
  // set创建
  var ingredients = <String>{};

  // 添加元素
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  // 尝试添加重复元素
  ingredients.add('gold');
  assert(ingredients.length == 3);

  // 删除元素
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  //通过构造函数构造
  var atomicNumbers = Set.from([79, 22, 54]);

  ingredients.addAll(['gold', 'titanium', 'xenon']);

  // 检查包含
  assert(ingredients.contains('titanium'));
  assert(ingredients.containsAll(['titanium', 'xenon']));

  // 取交
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void testMaps(){
  // map构造
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  var searchTerms = Map();

  var nobleGases = Map<int, String>();

  nobleGases = {54: 'xenon'};

  //map元素增删改查
  assert(nobleGases[54] == 'xenon');
  assert(nobleGases.containsKey(54));
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));

  // 取全部关键字
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  //取全部键值
  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  //单关键字检查
  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  String pickToughestKid() {
    return "pickToughestKid";
  }
  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => pickToughestKid());
  assert(teamAssignments['Catcher'] != null);
}

void testPublicMethod(){
  // 包含检查
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  // 遍历集合
  teas.forEach((tea) => print('I drink $tea'));


  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  loudTeas = teas.map((tea) => tea.toUpperCase()).toList();
  print(loudTeas);

  // 集合元素检查
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  // 搜索元素
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));
  assert(teas.any(isDecaffeinated));
  assert(!teas.every(isDecaffeinated));
}

void collection(){
  print("\n /" + '-' * 20 + "集合测试" + '-' * 20 + "/ \n");

  testLists();

  testSets();

  testMaps();

  testPublicMethod();

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
}

void testTime(){
  print("\n /" + '-' * 20 + "日期和时间测试" + '-' * 20 + "/ \n");

  //时间构造
  var now = DateTime.now();
  var y2k = DateTime(2000);
  y2k = DateTime(2000, 1, 2);
  y2k = DateTime.utc(2000);
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  // 自Unix 纪元（January 1, 1970, UTC）以来的毫秒数
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);

  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  // 日期计算
  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  // 日期差计算
  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366);

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
}

void testMath(){
  print("\n /" + '-' * 20 + "数学和随机数" + '-' * 20 + "/ \n");

  // 三角函数
  assert(cos(pi) == -1.0);
  var degrees = 30;
  var radians = degrees * (pi / 180);
  var sinOf30degrees = sin(radians);
  assert((sinOf30degrees - 0.5).abs() < 0.01);

  // 极值
  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);

  // 数学常熟
  print("e: " + e.toString()); // 2.718281828459045
  print("pi: " + pi.toString()); // 3.141592653589793
  print("sqrt2: "+ sqrt2.toString()); // 1.4142135623730951

  //随机数生成
  var random = Random();
  print(random.nextDouble());
  print(random.nextInt(10)); // Between 0 and 9.
  print(random.nextBool()); // true or false

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
}

void main() {
  dartcore_numbers_numbers_collections_strings_and_more();

  collection();

  testTime();

  testMath();

}