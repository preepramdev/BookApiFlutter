import 'package:bookapiflutter/app/res/string.dart';
import 'package:bookapiflutter/data/api/book_api_controller.dart';
import 'package:bookapiflutter/data/model/book.dart';
import 'package:bookapiflutter/ui/screen/add/add_screen.dart';
import 'package:bookapiflutter/ui/screen/main/widget_list/item_list_book.dart';
import 'package:flutter/material.dart';
import 'package:page_life_cycle/page_life_cycle.dart';

import '../detail/detail_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = "main_screen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with PageLifeCycle {
  BookApiController apiController = BookApiController();
  List<Book> models = List();

  @override
  void initState() {
    super.initState();
    print('MainScreen initState');

    fetchApi();
  }

  @override
  void onShow() {
    super.onShow();
    print('PageLifeCycle onShow');

    fetchApi();
  }

  @override
  void onHide() {
    super.onHide();
    print('PageLifeCycle onHide');
  }

  @override
  void onAppForeground() {
    super.onAppForeground();
    print('PageLifeCycle onAppForeground');
  }

  @override
  void onAppBackground() {
    super.onAppBackground();
    print('PageLifeCycle onAppBackground');
  }

  void fetchApi() async {
    dynamic objBody = await apiController.getBooks();
    print("getBooks respond: $objBody");

    if (objBody != null) {
      models.clear();
      var objBooks = objBody as List;

      objBooks.forEach((objBook) {
        var id = objBook['id'].toString();
        var title = objBook['title'].toString();
        var author = objBook['author'].toString();
        var pages = objBook['pages'].toString();

        print("id $id");
        print("title $title");
        print("author $author");
        print("pages $pages");

        Book book = Book(id, title, author, pages);

        setState(() {
          models.add(book);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stringAppName),
      ),
      body: Container(
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: models.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: BookItem(book: models[index]),
                      onTap: () {
                        Navigator.pushNamed(context, DetailScreen.id,
                            arguments: DetailScreenArguments(models[index].id));
                      });
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddScreen.id);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
