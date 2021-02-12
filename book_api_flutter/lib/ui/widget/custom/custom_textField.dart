import 'package:bookapiflutter/app/res/style.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({
    this.text = "",
    this.hintText,
    this.onChanged,
    this.color = Colors.white
  });

  final String text;
  final String hintText;
  final Function onChanged;
  final Color color;

  @override
  Widget build(BuildContext context) {

    TextEditingController controller = TextEditingController(text: text);

    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: styleTextFieldNormal,
      cursorColor: color,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: styleTextFieldHint,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
    );
  }
}
