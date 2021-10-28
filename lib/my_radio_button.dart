import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRadioButton extends StatelessWidget {
  final String _value;
  final bool isSelected;
  final void Function()? _onTap;

  const MyRadioButton({
    Key? key,
    required String value,
    this.isSelected = false,
    void Function()? onTap,
  })  : _value = value,
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
      color: isSelected ? Colors.blue : Colors.white,
      child: InkWell(
        onTap: () {
          if (_onTap != null) {
            _onTap!();
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: Text(_value),
          ),
        ),
      ),
    ));
  }
}
