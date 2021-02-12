import 'package:bookapiflutter/app/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;

import '../custom/custom_button_normal.dart';

class DialogDismissOneButton extends StatelessWidget {

  DialogDismissOneButton({
    this.titleMessage,
    this.submitMessage,
    this.onOneButtonClick
  });

  final String titleMessage;
  final String submitMessage;
  final Function onOneButtonClick;

  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;

    if (platform == TargetPlatform.android) {
      return AndroidDialog(
          titleMessage: titleMessage,
          submitMessage: submitMessage,
          onOneButtonClick: onOneButtonClick);
    } else {
      IosDialog(
          titleMessage: titleMessage,
          submitMessage: submitMessage,
          onOneButtonClick: onOneButtonClick);
    }
  }
}

class AndroidDialog extends StatelessWidget {
  const AndroidDialog({
    this.titleMessage,
    this.submitMessage,
    this.onOneButtonClick,
  });

  final String titleMessage;
  final String submitMessage;
  final Function onOneButtonClick;

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
          textTitle: submitMessage,
          onPressed: onOneButtonClick,
        )
      ],
    );
  }
}

class IosDialog extends StatelessWidget {
  const IosDialog({
    this.titleMessage,
    this.submitMessage,
    this.onOneButtonClick,
  });

  final String titleMessage;
  final String submitMessage;
  final Function onOneButtonClick;

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
          textTitle: submitMessage,
          onPressed: onOneButtonClick,
        )
      ],
    );
  }
}
