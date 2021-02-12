import 'package:bookapiflutter/app/res/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

import '../custom/custom_button_ios.dart';
import '../custom/custom_button_normal.dart';
import '../custom/custom_button_outline.dart';

class DialogDismissTwoButton extends StatelessWidget {

  DialogDismissTwoButton({
    this.titleMessage,
    this.positiveSubmitMessage,
    this.negativeSubmitMessage,
    this.onTwoButtonPositiveClick,
    this.onTwoButtonNegativeClick
  });

  final String titleMessage;
  final String positiveSubmitMessage;
  final String negativeSubmitMessage;
  final Function onTwoButtonPositiveClick;
  final Function onTwoButtonNegativeClick;

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    if (platform == TargetPlatform.android) {
      return AndroidDialog(
          titleMessage: titleMessage,
          positiveSubmitMessage: positiveSubmitMessage,
          onTwoButtonPositiveClick: onTwoButtonPositiveClick,
          negativeSubmitMessage: negativeSubmitMessage,
          onTwoButtonNegativeClick: onTwoButtonNegativeClick);
    } else {
      return IosDialog(
          titleMessage: titleMessage,
          positiveSubmitMessage: positiveSubmitMessage,
          onTwoButtonPositiveClick: onTwoButtonPositiveClick,
          negativeSubmitMessage: negativeSubmitMessage,
          onTwoButtonNegativeClick: onTwoButtonNegativeClick);
    }
  }
}

class AndroidDialog extends StatelessWidget {
  const AndroidDialog({
    this.titleMessage,
    this.positiveSubmitMessage,
    this.onTwoButtonPositiveClick,
    this.negativeSubmitMessage,
    this.onTwoButtonNegativeClick,
  });

  final String titleMessage;
  final String positiveSubmitMessage;
  final Function onTwoButtonPositiveClick;
  final String negativeSubmitMessage;
  final Function onTwoButtonNegativeClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        titleMessage,
        style: styleTextNormalDialog,
      ),
      content: null,
      actions: <Widget>[
        CustomNormalButton(
          textTitle: positiveSubmitMessage,
          onPressed: onTwoButtonPositiveClick,
        ),
        CustomButtonOutline(
          textTitle: negativeSubmitMessage,
          onPressed: onTwoButtonNegativeClick,
        ),
      ],
    );
  }
}

class IosDialog extends StatelessWidget {
  const IosDialog({
    this.titleMessage,
    this.positiveSubmitMessage,
    this.onTwoButtonPositiveClick,
    this.negativeSubmitMessage,
    this.onTwoButtonNegativeClick,
  });

  final String titleMessage;
  final String positiveSubmitMessage;
  final Function onTwoButtonPositiveClick;
  final String negativeSubmitMessage;
  final Function onTwoButtonNegativeClick;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        titleMessage,
      ),
      content: null,
      actions: <Widget>[
        CustomButtonIos(
          textTitle: positiveSubmitMessage,
          onPressed: onTwoButtonPositiveClick,
        ),
        CustomButtonIos(
          textTitle: negativeSubmitMessage,
          onPressed: onTwoButtonNegativeClick,
        ),
      ],
    );
  }
}
