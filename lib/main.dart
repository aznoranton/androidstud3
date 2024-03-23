import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int numb = 0;
  String infoText = 'Введите число:';
  TextEditingController control = TextEditingController();


  void _getStringLength() {
    setState(() {
      numb = int.parse(control.text);
      infoText = 'Число = ' + (numb).toString();
    });
  }

  void _clearText(){
    setState(() {
      control.text = '0';
      _getStringLength();
    });
  }

  void _squarenum(){
    setState(() {
      String res = (numb*numb).toString();
      control.text = res;
      _getStringLength();
    });
  }

  void _multiplybytwo(){
    setState(() {
      String res = (numb*2).toString();
      control.text = res;
      _getStringLength();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              infoText,
              style: const TextStyle(
                  fontFamily: 'Times New Roman',
                  fontSize: 32
              ),
            ),

            SizedBox(height: 150, width: 1000,
              child:
              TextField(

                textAlign: TextAlign.center,
                minLines: 1,
                maxLines: 2,
                style:const TextStyle(fontSize: 27, fontFamily: 'Times New Roman'),
                controller: control,
                onChanged: (text){_getStringLength();},
                decoration: const InputDecoration(
                  hintText: 'Введите число',
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: (){_clearText();},
                child: const Text('Очистить', style: TextStyle(color: Colors.red),)
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: (){_squarenum();},
                child: const Text('Возвести в квадрат')
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: (){_multiplybytwo();},
                child: const Text('Умножить на два')
            )
          ],
        ),
      ),
    );
  }
}