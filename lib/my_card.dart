import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final MyCardModel _model;

  const MyCard({
    Key? key,
    required MyCardModel cardModel,
  })  : _model = cardModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: _model.selected == true ? Colors.blue : Colors.white,
      child: Center(
        child: Text(_model.dispValue),
      ),
    );
  }
}

class MyCardModel {
  bool? selected;
  String dispValue;

  MyCardModel({
    required this.dispValue,
    this.selected,
  });
}
