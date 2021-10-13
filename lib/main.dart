import 'package:flutter/material.dart';
import 'package:group_check/my_radio_button.dart';

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
  final List<MyCardModel> _cardModel = [
    MyCardModel(dispValue: '単勝'),
    MyCardModel(dispValue: '複勝'),
    MyCardModel(dispValue: '枠連'),
    MyCardModel(dispValue: '馬連'),
    MyCardModel(dispValue: '馬単'),
    MyCardModel(dispValue: '3連複'),
    MyCardModel(dispValue: '3連単'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Row(
              children: _cardModel
                  .map((e) => MyCard(
                        cardModel: e,
                        onTap: () {
                          setState(() {
                            e.selected = !e.selected;
                          });
                        },
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
