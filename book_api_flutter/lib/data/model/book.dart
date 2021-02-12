class Book {

  String _id;
  String _title;
  String _author;
  String _pages;

  Book(this._id, this._title, this._author, this._pages);

  Book.withoutId(this._title, this._author, this._pages);

  String get id => _id;

  String get title => _title;

  String get author => _author;

  String get pages => _pages;

  set title(String value) {
    _title = value;
  }

  set author(String value) {
    _author = value;
  }

  set pages(String value) {
    _pages = value;
  }
}