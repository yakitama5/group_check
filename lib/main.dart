import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CustomRadioButton(
              buttonLables: const [
                '単勝',
                '複勝',
                '応援馬券',
                '枠連',
                '馬連',
                '馬単',
                'ワイド',
                '3連複',
                '3連単',
                'WIN5',
              ],
              buttonValues: const [
                '単勝',
                '複勝',
                '応援馬券',
                '枠連',
                '馬連',
                '馬単',
                'ワイド',
                '3連複',
                '3連単',
                'WIN5',
              ],
              radioButtonValue: (value) {
                debugPrint("${value ?? ''}");
              },
              unSelectedColor: Colors.white,
              selectedColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
