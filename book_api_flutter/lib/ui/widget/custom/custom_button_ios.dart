import 'package:bookapiflutter/app/res/style.dart';
import 'package:flutter/material.dart';

class CustomButtonIos extends StatelessWidget {

  CustomButtonIos({this.textTitle, this.onPressed});

  final String textTitle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        textTitle,
        style: styleTextButtonIos,
      ),
      onPressed: onPressed,
    );
  }
}
