import 'dart:math';
import 'dart:io';
import 'dart:async';

class TestClass{
  var name = 'Voyager I';
  var year = 1977;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
}
TestClass testClass = TestClass();

int testVar(){
  print("\n /" + '-' * 20 + "变量" + '-' * 20 + "/ \n");
  print(
      'name is ' + testClass.name.toString() + '\n' +
      'year is ' + testClass.year.toString() + '\n' +
      'antennadiameter is ' + testClass.antennaDiameter.toString() + '\n' +
      'flybyObjects is '+ testClass.flybyObjects.toString() + '\n' +
      'image is ' + testClass.image.toString()
  );
  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

int testFlow(){
  print("\n /" + '-' * 20 + "流程控制" + '-' * 20 + "/ \n");

  var year = testClass.year;
  var flybyObjects= testClass.flybyObjects;

  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects.where((element) => element.contains('e'))) {
    print(object);
  }

  for (int month = 3; month <= 6; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

int testFunc(){
  print("\n /" + '-' * 20 + "函数" + '-' * 20 + "/ \n");

  var x = 30;
  print("fibonacci 30: " + fibonacci(x).toString() + '\n');

  var flybyObjects = testClass.flybyObjects;
  flybyObjects.where((name) => name.contains('t')).forEach(print);

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

int testCmt(){
  print("\n /" + '-' * 20 + "注释" + '-' * 20 + "/ \n");

  /// 这是一个文档注释。
  /// 文档注释用于为库、类以及类的成员添加注释。
  /// 像 IDE 和 dartdoc 这样的工具可以专门处理文档注释。

/* 也可以像这样使用单斜杠和星号的注释方式 */
  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}


int testIpt(){
  print("\n /" + '-' * 20 + "导入" + '-' * 20 + "/ \n");

  print('pi = $pi \n');

  var x = pi / 4;
  var y = sin(x);
  print('sin(pi/4) is $y\n');

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // TODO: init.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Methods.
  void describe() {
    print('Spacecraft: $name');

    // Type promotion dos not work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}


int testCls(){
  print("\n /" + '-' * 20 + "类" + '-' * 20 + "/ \n");

  var spacecraft = Spacecraft(testClass.name, DateTime.now());
  var spacecraft2 = Spacecraft.unlaunched(testClass.name + 'II');

  spacecraft.describe();
  spacecraft2.describe();

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

class Orbiter extends Spacecraft {
  double altitude = 0;

  Orbiter(String name, DateTime? launchDate) : super(name, launchDate);

}

int testInhe(){
  print("\n /" + '-' * 20 + "继承" + '-' * 20 + "/ \n");

  var spacecraft = Orbiter("Orbiter", DateTime(2022, 5, 30));

  spacecraft.describe();

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }

}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime? launchDate) : super(name, launchDate);
  // ···
}

int testMixins(){
  print("\n /" + '-' * 20 + "Mixin" + '-' * 20 + "/ \n");

  var craft = PilotedCraft("piloted",DateTime.now());

  craft.describe();
  craft.describeCrew();

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name = "Mock";

  @override
  void describe() {
    print('This is a mock spaceship');
  }

  @override
  // TODO: implement launchYear
  int? get launchYear => throw UnimplementedError();
  // ···
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class DescSpaceship extends Describable{
  @override
  void describe() {
    print("here is the description");
  }

}

int testItAndAbCls(){
  print("\n /" + '-' * 20 + "接口与抽象类" + '-' * 20 + "/ \n");

  var mock = MockSpaceship();
  mock.describe();

  var desc = DescSpaceship();
  desc.describeWithEmphasis();

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

const oneSecond = Duration(seconds: 1);
// ···
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print(
            'File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (final object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}

Future<void> testAsync() async {
  print("\n /" + '-' * 20 + "异步" + '-' * 20 + "/ \n");

  for(int i = 1 ; i <= 5 ; i ++){
    printWithDelay("async result: " + i.toString());
  }

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
}

Future<int> testEcp() async {
  print("\n /" + '-' * 20 + "异常" + '-' * 20 + "/ \n");

  try {
    for (final object in testClass.flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    testClass.flybyObjects.clear();
  }

  print("\n /" + '*' * 20 + "结束" + '*' * 20 + "/ \n");
  return 0;
}

void main() {
  testVar();//变量

  testFlow();//流程控制

  testFunc();//函数

  testCmt();//注释

  testIpt();//导入

  testCls();//类

  testInhe();//继承

  testMixins();//Mixin

  testItAndAbCls();//接口与抽象类

  testAsync();//异步

  testEcp();//异常
}