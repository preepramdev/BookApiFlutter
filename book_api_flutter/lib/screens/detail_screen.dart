import 'package:bookapiflutter/api/book_api_controller.dart';
import 'package:bookapiflutter/models/book.dart';
import 'package:bookapiflutter/res/constants.dart';
import 'package:bookapiflutter/screens/update_screen.dart';
import 'package:bookapiflutter/views/custom_button_normal.dart';
import 'package:bookapiflutter/views/custom_button_outline.dart';
import 'package:bookapiflutter/views/dialog_one_button.dart';
import 'package:bookapiflutter/views/dialog_two_button.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const String id = "detail_screen";

  DetailScreen({Key key}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  BookApiController apiController = BookApiController();

  Future<Book> fetchDetail(String bookId) async {
    /*dynamic objBody = await apiController.getBook(bookId);
    print("getBook respond: $objBody");

    if (objBody != null) {
      var objBook = objBody;

      var id = objBook['id'].toString();
      var title = objBook['title'].toString();
      var author = objBook['author'].toString();
      var pages = objBook['pages'].toString();

      return Book(id, title, author, pages);
    } else {
      return null;
    }*/

    Book book;

    await apiController.getBook(bookId).then((value) {
      print("getBook respond: $value");
      if (value != null) {
        var objBook = value;

        var id = objBook['id'].toString();
        var title = objBook['title'].toString();
        var author = objBook['author'].toString();
        var pages = objBook['pages'].toString();

        book = Book(id, title, author, pages);
      } else {
        book = null;
      }
    }).catchError((error) {
      print("getBook error: $error");
    });

    return book;
  }

  Future<void> removeBook(String bookId, BuildContext context) async {
    await apiController.removeBook(bookId).then((value) {
      callOneButtonDialog(
          context: context,
          title: "Removed",
          submit: "Ok",
          onClick: () {
            Navigator.pop(context); // pop prev dialog
            Navigator.pop(context); // pop dialog
            Navigator.pop(context); // pop this screen
          });
    }).catchError((error) {
      print("removeBook error: $error");
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
    DetailScreenArguments args = ModalRoute.of(context).settings.arguments;
    print(args.bookId);

    Future<Book> futureBook = fetchDetail(args.bookId);

    return Scaffold(
      appBar: AppBar(
        title: Text(stringAppName),
      ),
      body: FutureBuilder<Book>(
        future: futureBook,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CardBookDetail(
              id: snapshot.data.id,
              title: snapshot.data.title,
              author: snapshot.data.author,
              pages: snapshot.data.pages,
              onUpdateButtonClick: () {
                // get to update page
                futureBook.then((book) {
                  Navigator.pushNamed(context, UpdateScreen.id,
                      arguments: UpdateScreenArguments(book));
                }).catchError((error) {
                  print("futureBook error $error");
                });
              },
              onRemoveButtonClick: () {
                callTwoButtonDialog(
                    context: context,
                    title: "Remove?",
                    positive: "Ok",
                    negative: "Cancel",
                    onPositiveClick: () {
                      removeBook(args.bookId, context);
                    },
                    onNegativeClick: () {
                      Navigator.pop(context); // pop dialog
                    });
              },
            );
          }
          return CardBookDetail(
            onUpdateButtonClick: () {},
            onRemoveButtonClick: () {},
          );
        },
      ),
    );
  }
}

class CardBookDetail extends StatelessWidget {
  const CardBookDetail({
    this.id = "",
    this.title = "",
    this.author = "",
    this.pages = "",
    this.onUpdateButtonClick,
    this.onRemoveButtonClick,
  });

  final String id;
  final String title;
  final String author;
  final String pages;
  final Function onUpdateButtonClick;
  final Function onRemoveButtonClick;

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
                          child: Text(
                            stringTitle,
                            style: styleTextHeaderDetail,
                          ),
                          flex: dimenDetailBookHeaderFlex,
                        ),
                        Expanded(
                          child: Text(
                            title,
                            style: styleTextNormalDetail,
                          ),
                          flex: dimenDetailBookContentFlex,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            stringAuthor,
                            style: styleTextHeaderDetail,
                          ),
                          flex: dimenDetailBookHeaderFlex,
                        ),
                        Expanded(
                          child: Text(
                            author,
                            style: styleTextNormalDetail,
                          ),
                          flex: dimenDetailBookContentFlex,
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            stringPage,
                            style: styleTextHeaderDetail,
                          ),
                          flex: dimenDetailBookHeaderFlex,
                        ),
                        Expanded(
                          child: Text(
                            pages,
                            style: styleTextNormalDetail,
                          ),
                          flex: dimenDetailBookContentFlex,
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
          textTitle: stringRemove,
          colorCustom: Color(0xFFffff4444),
          onPressed: onRemoveButtonClick,
        ),
      ],
    );
  }
}

class DetailScreenArguments {
  final String bookId;

  DetailScreenArguments(this.bookId);
}
