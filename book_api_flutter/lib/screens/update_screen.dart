import 'dart:ffi';

import 'package:bookapiflutter/api/book_api_controller.dart';
import 'package:bookapiflutter/models/book.dart';
import 'package:bookapiflutter/res/constants.dart';
import 'package:bookapiflutter/views/custom_button_normal.dart';
import 'package:bookapiflutter/views/custom_button_outline.dart';
import 'package:bookapiflutter/views/custom_textField.dart';
import 'package:bookapiflutter/views/dialog_one_button.dart';
import 'package:bookapiflutter/views/dialog_two_button.dart';
import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  static const String id = "update_screen";

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  BookApiController apiController = BookApiController();

  Future updateBook(BuildContext context, Book book) async {
    await apiController.updateBook(book).then((value) {
      print("updateBook respond: $value");
      callOneButtonDialog(
          context: context,
          title: "Done",
          submit: "Ok",
          onClick: () {
            Navigator.pop(context); // pop dialog
            Navigator.pop(context); // pop this screen
          });
    }).catchError((error) {
      print("updateBook error: $error");
    });
  }

  void callOneButtonDialog(
      {BuildContext context,
        String title,
        String submit,
        Function onClick,
        bool isBarrierDismissible = true}) {
    showDialog(
        context: context,
        builder: (context) => DialogOneButton(
            titleMessage: title,
            submitMessage: submit,
            onOneButtonClick: onClick),
        barrierDismissible: isBarrierDismissible);
  }

  void callTwoButtonDialog(
      {BuildContext context,
        String title,
        String positive,
        String negative,
        Function onPositiveClick,
        Function onNegativeClick,
        bool isBarrierDismissible = true}) {
    showDialog(
        context: context,
        builder: (context) => DialogTwoButton(
          titleMessage: title,
          positiveSubmitMessage: positive,
          negativeSubmitMessage: negative,
          onTwoButtonPositiveClick: onPositiveClick,
          onTwoButtonNegativeClick: onNegativeClick,
        ),
        barrierDismissible: isBarrierDismissible);
  }

  @override
  Widget build(BuildContext context) {
    UpdateScreenArguments args = ModalRoute.of(context).settings.arguments;
    print(args.book);

    Book book = args.book;

    return Scaffold(
      appBar: AppBar(
        title: Text(stringAppName),
      ),
      body: SingleChildScrollView(
        child: CardUpdateBook(
          id: book.id,
          title: book.title,
          author: book.author,
          pages: book.pages,
          onTitleChange: (newTitle) {
            print("newTitle $newTitle");
            book.title = newTitle;
          },
          onAuthorChange: (newAuthor) {
            print("newAuthor $newAuthor");
            book.author = newAuthor;
          },
          onPagesChange: (newPages) {
            print("newPages $newPages");
            book.pages = newPages;
          },
          onUpdateButtonClick: () {
            if (book.title.isNotEmpty && book.author.isNotEmpty && book.pages.isNotEmpty) {
              print("title ${book.title}");
              print("author ${book.author}");
              print("pages ${book.pages}");
              updateBook(context, book);
            } else {
            print("Some field is empty");
            }
          },
          onCancelButtonClick: () {
            callTwoButtonDialog(
                context: context,
                title: "Leave?",
                positive: "Ok",
                negative: "Cancel",
                onPositiveClick: () {
                  Navigator.pop(context); // pop dialog
                  Navigator.pop(context); // pop this screen
                },
                onNegativeClick: () {
                  Navigator.pop(context); // pop dialog
                });
          },
        ),
      ),
    );
  }
}

class CardUpdateBook extends StatelessWidget {
  const CardUpdateBook({
    this.id = "",
    this.title = "",
    this.author = "",
    this.pages = "",
    this.onTitleChange,
    this.onAuthorChange,
    this.onPagesChange,
    this.onUpdateButtonClick,
    this.onCancelButtonClick,
  });

  final String id;
  final String title;
  final String author;
  final String pages;
  final Function onTitleChange;
  final Function onAuthorChange;
  final Function onPagesChange;
  final Function onUpdateButtonClick;
  final Function onCancelButtonClick;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16.0),
          child: Material(
            elevation: 4.0,
            color: colorAccent,
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            stringId,
                            style: styleTextHeaderDetail,
                          ),
                          flex: dimenDetailBookHeaderFlex,
                        ),
                        Expanded(
                          child: Text(
                            id,
                            style: styleTextNormalDetail,
                          ),
                          flex: dimenDetailBookContentFlex,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            text: title,
                            onChanged: onTitleChange,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            text: author,
                            onChanged: onAuthorChange,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            text: pages,
                            onChanged: onPagesChange,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        CustomNormalButton(
          textTitle: stringUpdate,
          onPressed: onUpdateButtonClick,
        ),
        CustomButtonOutline(
          textTitle: stringCancel,
          onPressed: onCancelButtonClick,
        ),
      ],
    );
  }
}

class UpdateScreenArguments {
  final Book book;

  UpdateScreenArguments(this.book);
}
