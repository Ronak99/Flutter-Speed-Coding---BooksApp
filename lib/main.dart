import 'package:flutter/material.dart';
import 'models/book.dart';

void main() => runApp(BooksApp());

class BooksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "BooksApp",
      home: BooksHome(),
    );
  }
}

class BooksHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            CustomTitleBar(),
            HorizontalListView(),
            HotList(),
          ],
        ),
      ),
    );
  }
}

class CustomTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.book,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text("BooksApp",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "lovelo",
                )),
          )
        ],
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xfff8f8f8), Colors.white],
        ),
        border: Border(bottom: BorderSide(color: Color(0xfff0f0f0), width: 2)),
      ),
      padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: booklist.books.length,
              itemBuilder: (BuildContext context, int i) {
                if (booklist.books[i].franchise) {
                  return ShowCase(
                    wideImage: booklist.books[i].wideImage,
                    bookObject: booklist.books[i],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Text(
            "BEST SELLERS",
            style: TextStyle(letterSpacing: 1.5, color: Colors.black54),
          ),
          Divider(
            color: Colors.black54,
          ),
          Text(
            "Novels with a popular franchise",
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
                fontSize: 30),
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

class ShowCase extends StatelessWidget {
  const ShowCase({
    @required this.wideImage,
    @required this.bookObject,
  });

  final String wideImage;
  final Book bookObject;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        /* /* leaving this null, checkout the master branch to get its code */ */
      },
      child: Row(
        children: <Widget>[
          Container(
            height: 250,
            width: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(wideImage, fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}

class HotList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xfff8f8f8), Colors.white],
          ),
          border:
              Border(bottom: BorderSide(color: Color(0xfff0f0f0), width: 2))),
      padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "New Book Hot List",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 320,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: booklist.books.length,
              itemBuilder: (BuildContext context, int i) {
                String title = booklist.books[i].title.length > 17
                    ? booklist.books[i].title.substring(0, 15) + "..."
                    : booklist.books[i].title;

                if (booklist.books[i].franchise) {
                  return Container();
                } else {
                  return ShowBooks(
                    bookCoverImg: booklist.books[i].cover,
                    price: booklist.books[i].price,
                    author: booklist.books[i].author,
                    title: title,
                    bookObject: booklist.books[i],
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class ShowBooks extends StatelessWidget {
  const ShowBooks(
      {@required this.bookCoverImg,
      @required this.title,
      @required this.author,
      @required this.price,
      @required this.bookObject});

  final String bookCoverImg;
  final String author;
  final String title;
  final double price;
  final Book bookObject;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       /* leaving this null, checkout the master branch to get its code */
      },
      child: Row(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 220,
                width: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(
                      bookCoverImg,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                author,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black45,
                  fontWeight: FontWeight.w300,
                ),
                softWrap: true,
              ),
              SizedBox(
                height: 12,
              ),
              Text("\$$price",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500))
            ],
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
    );
  }
}
