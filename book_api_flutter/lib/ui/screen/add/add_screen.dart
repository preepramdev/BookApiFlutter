import 'package:bookapiflutter/app/res/color.dart';
import 'package:bookapiflutter/app/res/string.dart';
import 'package:bookapiflutter/data/api/book_api_controller.dart';
import 'package:bookapiflutter/data/model/book.dart';
import 'package:bookapiflutter/ui/widget/custom/custom_button_normal.dart';
import 'package:bookapiflutter/ui/widget/custom/custom_button_outline.dart';
import 'package:bookapiflutter/ui/widget/custom/custom_textField.dart';
import 'package:bookapiflutter/ui/widget/dialog/dialog_one_button.dart';
import 'package:bookapiflutter/ui/widget/dialog/dialog_two_button.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  static const String id = "add_screen";

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  BookApiController apiController = BookApiController();

  String title = "";
  String author = "";
  String pages = "";

  Future addBook(BuildContext context, Book book) async {
    await apiController.createBook(book).then((value) {
      print("createBook respond: $value");
      callOneButtonDialog(
          context: context,
          title: "Done",
          submit: "Ok",
          onClick: () {
            Navigator.pop(context); // pop dialog
            Navigator.pop(context); // pop this screen
          });
    }).catchError((error) {
      print("createBook error: $error");
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
    return Scaffold(
      appBar: AppBar(
        title: Text(stringAppName),
      ),
      body: CardAddBook(
        onTitleChange: (titleString) {
          print("titleString: $titleString");
          title = titleString;
        },
        onAuthorChange: (authorString) {
          print("authorString: $authorString");
          author = authorString;
        },
        onPagesChange: (pagesString) {
          print("pagesString: $pagesString");
          pages = pagesString;
        },
        onAddButtonClick: () {
          if (title.isNotEmpty && author.isNotEmpty && pages.isNotEmpty) {
            Book book = Book.withoutId(title, author, pages);
            print("title ${book.title}");
            print("author ${book.author}");
            print("pages ${book.pages}");
            addBook(context, book);
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
    );
  }
}

class CardAddBook extends StatelessWidget {
  const CardAddBook({
    this.onTitleChange,
    this.onAuthorChange,
    this.onPagesChange,
    this.onAddButtonClick,
    this.onCancelButtonClick,
  });

  final Function onTitleChange;
  final Function onAuthorChange;
  final Function onPagesChange;
  final Function onAddButtonClick;
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
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CustomTextField(
                      hintText: stringBookTitleHolder,
                      onChanged: onTitleChange,
                    ),
                    CustomTextField(
                      hintText: stringBookAuthorHolder,
                      onChanged: onAuthorChange,
                    ),
                    CustomTextField(
                      hintText: stringBookPageHolder,
                      onChanged: onPagesChange,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        CustomNormalButton(
          textTitle: stringAddBook,
          onPressed: onAddButtonClick,
        ),
        CustomButtonOutline(
          textTitle: stringCancel,
          onPressed: onCancelButtonClick,
        ),
      ],
    );
  }
}
