import 'package:bookapiflutter/models/book.dart';
import 'package:bookapiflutter/res/constants.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {

  BookItem({this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Material(
        elevation: 4.0,
        color: colorAccent,
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: MaterialButton(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        stringId,
                        style: styleTextHeader,
                      ),
                      flex: dimenItemListBookHeaderFlex,
                    ),
                    Expanded(
                      child: Text(
                        book.id,
                        style: styleTextNormal,
                      ),
                      flex: dimenItemListBookContentFlex,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        stringTitle,
                        style: styleTextHeader,
                      ),
                      flex: dimenItemListBookHeaderFlex,
                    ),
                    Expanded(
                      child: Text(
                        book.title,
                        style: styleTextNormal,
                      ),
                      flex: dimenItemListBookContentFlex,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        stringAuthor,
                        style: styleTextHeader,
                      ),
                      flex: dimenItemListBookHeaderFlex,
                    ),
                    Expanded(
                      child: Text(
                        book.author,
                        style: styleTextNormal,
                      ),
                      flex: dimenItemListBookContentFlex,
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        stringPage,
                        style: styleTextHeader,
                      ),
                      flex: dimenItemListBookHeaderFlex,
                    ),
                    Expanded(
                      child: Text(
                        book.pages,
                        style: styleTextNormal,
                      ),
                      flex: dimenItemListBookContentFlex,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
