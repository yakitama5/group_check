import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRadioButton extends StatefulWidget {
  final List<MyCardModel> _models;

  const MyRadioButton({Key? key, required List<MyCardModel> models})
      : _models = models,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<MyRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget._models
          .map((e) => MyCard(
                cardModel: e,
                onTap: () {
                  setState(() {
                    // TODO 他の選択肢をクリアしないとダメかな？ラジオにするなら
                    e.selected = !e.selected;
                  });
                },
              ))
          .toList(),
    );
  }
}

class MyCard extends StatelessWidget {
  final MyCardModel _model;
  final void Function()? _onTap;

  const MyCard({
    Key? key,
    required MyCardModel cardModel,
    void Function()? onTap,
  })  : _model = cardModel,
        _onTap = onTap,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Card(
      // Card
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: const BorderSide(
            color: Colors.blue,
            width: 1,
          )),
      color: _model.selected == true ? Colors.blue : Colors.white,
      child: InkWell(
        onTap: () {
          if (_onTap != null) {
            _onTap!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(_model.dispValue),
          ),
        ),
      ),
    ));
  }
}

class MyCardModel {
  bool selected;
  String dispValue;
  double flex;

  MyCardModel({
    required this.dispValue,
    this.selected = false,
    this.flex = 1,
  });
}
