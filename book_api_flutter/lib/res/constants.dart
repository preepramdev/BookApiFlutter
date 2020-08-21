import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// colors
const colorPrimary = Color(0xFF6200EE);
const colorPrimaryDark = Color(0xFF3700B3);
const colorAccent = Color(0xFF03DAC5);
const colorEditTextHint = Color(0xFFB2FFFFFF);
const colorIosButton = Color(0xFF469EFD);

// strings
const String stringAppName = "BookApiFlutter";
const String stringId = "id :";
const String stringTitle = "title :";
const String stringAuthor = "author :";
const String stringPage = "page :";
const String stringAddBook = "Add Book";
const String stringBookPageHolder = "book\'s page";
const String stringBookAuthorHolder = "book\'s author";
const String stringBookTitleHolder = "book\'s title";
const String stringBookIdHolder = "book\'s id";
const String stringCancel = "Cancel";
const String stringRemove = "Remove";
const String stringUpdate = "Update";

// styles
const styleTextHeader = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const styleTextHeaderDetail = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 20.0,
);

const styleTextNormal = TextStyle(
  color: Colors.white,
);

const styleTextNormalDetail = TextStyle(
    color: Colors.white,
    fontSize: 20.0
);

const styleTextFieldNormal = TextStyle(
  color: Colors.white,
  fontSize: 20.0,
);

const styleTextNormalDialog = TextStyle(
    color: colorPrimary,
    fontSize: 16.0
);

const styleTextFieldHint = TextStyle(
  color: colorEditTextHint,
  fontSize: 20.0,
);

const styleTextButtonIos = TextStyle(
  color: colorIosButton,
);

// dimens
const dimenItemListBookHeaderFlex = 2;
const dimenItemListBookContentFlex = 8;
const dimenDetailBookHeaderFlex = 3;
const dimenDetailBookContentFlex = 7;
