import 'package:bookapiflutter/res/constants.dart';
import 'package:flutter/material.dart';

class CustomButtonOutline extends StatelessWidget {

  CustomButtonOutline({
    this.textTitle,
    this.onPressed,
    this.colorCustom = colorPrimary
  });

  final String textTitle;
  final Function onPressed;
  final Color colorCustom;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.white,
      child: Text(
        textTitle,
        style:
            TextStyle(color: colorCustom),
      ),
    );
  }
}
