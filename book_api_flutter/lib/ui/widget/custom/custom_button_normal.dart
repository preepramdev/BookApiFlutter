import 'package:bookapiflutter/app/res/color.dart';
import 'package:flutter/material.dart';

class CustomNormalButton extends StatelessWidget {

  CustomNormalButton({this.textTitle, this.onPressed});

  final String textTitle;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: colorPrimary,
      child: Text(
        textTitle,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
