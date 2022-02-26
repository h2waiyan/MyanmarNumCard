import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Learn Myanmar Number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var engNum = 0;
  var imageNum = [];
  var score = 0;
  var picOne = "1", picTwo = "2", picThree = "3";
  var ans = "";

  @override
  void initState() {
    super.initState();
    playAgain();
  }

  void playAgain() {
    var allNum = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9];
    setState(() {
      imageNum = allNum..shuffle();
      imageNum = imageNum.sublist(0, 3);

      debugPrint(imageNum.toString());

      picOne = imageNum[0].toString();
      picTwo = imageNum[1].toString();
      picThree = imageNum[2].toString();

      imageNum = imageNum..shuffle();
      engNum = imageNum[0];
    });
  }

  void checkAns(picNum) {
    setState(() {
      if (picNum == engNum.toString()) {
        ans = "correct.";
        score = score + 10;
      } else {
        ans = "incorrect.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Please select $engNum"),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      checkAns(picOne);
                    });
                  }, // Handle your callback.
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(width: 1.0, color: Colors.purple),
                        left: BorderSide(width: 1.0, color: Colors.purple),
                        right: BorderSide(width: 1.0, color: Colors.purple),
                        bottom: BorderSide(width: 1.0, color: Colors.purple),
                      ),
                      image: DecorationImage(
                        image: AssetImage("images/$picOne.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    checkAns(picTwo);
                  }, // Handle your callback.
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(width: 1.0, color: Colors.purple),
                        left: BorderSide(width: 1.0, color: Colors.purple),
                        right: BorderSide(width: 1.0, color: Colors.purple),
                        bottom: BorderSide(width: 1.0, color: Colors.purple),
                      ),
                      image: DecorationImage(
                        image: AssetImage('images/$picTwo.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    checkAns(picThree);
                  }, // Handle your callback.
                  child: Ink(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(width: 1.0, color: Colors.purple),
                        left: BorderSide(width: 1.0, color: Colors.purple),
                        right: BorderSide(width: 1.0, color: Colors.purple),
                        bottom: BorderSide(width: 1.0, color: Colors.purple),
                      ),
                      image: DecorationImage(
                        image: AssetImage('images/$picThree.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text("Your answer is $ans"),
            SizedBox(
              width: 100,
              child: TextButton(
                  // ignore: prefer_const_constructors
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                  ),
                  onPressed: playAgain,
                  child: const Text("Next")),
            ),
            Text("Score :  $score"),
          ],
        ),
      ),
    );
  }
}
