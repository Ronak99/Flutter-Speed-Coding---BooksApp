import 'package:flutter/material.dart';
import 'models/book.dart';
import 'package:flutter_rating/flutter_rating.dart';

bool inCart;
bool isFav;

class Details extends StatefulWidget {
  final Book bookObject;

  Details(this.bookObject);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  void initState() {
    // TODO: implement initState
    inCart = false;
    isFav = false;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black87,
                size: 25,
              ),
            ),
            actions: <Widget>[
              Icon(
                Icons.file_upload,
                color: Colors.black87,
                size: 25,
              ),
              SizedBox(width: 25),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isFav = !isFav;

                  });
                },
                child: Icon(
                  isFav ? Icons.favorite : Icons.favorite_border,
                  color: isFav ? Colors.red : Colors.black87,
                  size: 25,
                ),
              ),
              SizedBox(width: 25),
            ],
          ),
        ),
      ),
      body: DetailsPageBody(widget.bookObject),
      bottomNavigationBar: BottomBar(widget.bookObject),
    );
  }
}

class DetailsPageBody extends StatefulWidget {
  final Book bookObject;

  DetailsPageBody(this.bookObject);

  @override
  _DetailsPageBodyState createState() => _DetailsPageBodyState();
}

class _DetailsPageBodyState extends State<DetailsPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  TopContainer(widget: widget),
                  AuthorContainer(widget: widget),
                  Padding(
                    padding: EdgeInsets.only(top: 43),
                    child: GenreContainer(widget: widget),
                  ),
                  TabBarContainer(widget: widget),
                ],
              ),
              Positioned(
                left: 25,
                top: 20,
                child: Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width / 2 - 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(widget.bookObject.cover,
                        fit: BoxFit.contain),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final DetailsPageBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 30, bottom: 30),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xfff8f8f8), Colors.white]),
          border:
              Border(bottom: BorderSide(color: Color(0xfff0f0f0), width: 2))),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                widget.bookObject.title,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                    fontSize: 25),
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AuthorContainer extends StatelessWidget {
  final DetailsPageBody widget;

  const AuthorContainer({
    @required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          top: 20,
          left: 10,
          right: 10,
          bottom: 0,
        ),
        width: MediaQuery.of(context).size.width / 2,
        height: 110,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(widget.bookObject.authorImg,
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        widget.bookObject.author,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      StarRating(
                        rating: widget.bookObject.rating,
                        size: 20,
                        color: Colors.yellow.shade700,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        widget.bookObject.rating.toString(),
                        style: TextStyle(color: Colors.black38, fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GenreContainer extends StatelessWidget {
  final DetailsPageBody widget;

  const GenreContainer({@required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 20),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryBox(
            category: "GENRE",
            categoryValue: widget.bookObject.genre,
            categoryIcon:
                "https://cdn3.vectorstock.com/i/thumb-large/93/62/psychology-icon-vector-15909362.jpg",
          ),
          SizedBox(
            width: 10,
          ),
          CategoryBox(
            category: "LANGUAGE",
            categoryValue: widget.bookObject.lanugage,
            categoryIcon:
                "https://cdn2.iconfinder.com/data/icons/translation-1/513/translation-translate-language-international-translating_2_copy_7-512.png",
          ),
          SizedBox(
            width: 10,
          ),
          CategoryBox(
            category: "AGE",
            categoryValue: widget.bookObject.age,
            categoryIcon:
                "https://image.flaticon.com/icons/png/512/31/31370.png",
          ),
        ],
      ),
    );
  }
}

class CategoryBox extends StatelessWidget {
  final String category;
  final String categoryValue;
  final String categoryIcon;

  const CategoryBox(
      {Key key, this.category, this.categoryValue, this.categoryIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12, width: 2)),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Image.network(categoryIcon, fit: BoxFit.contain),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                category,
                style: TextStyle(
                    letterSpacing: 1.5, color: Colors.black38, fontSize: 12),
              ),
              Text(
                categoryValue,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              )
            ],
          )
        ],
      ),
    );
  }
}

class TabBarContainer extends StatelessWidget {
  final DetailsPageBody widget;

  const TabBarContainer({
    @required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              color: Colors.transparent,
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(),
                    ),
                    TabBar(
                      labelPadding: EdgeInsets.only(bottom: 15, top: 15),
                      indicatorColor: Colors.yellow.shade700,
                      labelColor: Colors.black87,
                      unselectedLabelColor: Colors.black38,
                      tabs: <Widget>[
                        Text("Info"),
                        Text("Reviews"),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Text("Plot Summary",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.3)),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Text(
                          widget.bookObject.summary,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Text("NO REVIEWS",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.black54)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomBar extends StatefulWidget {
  final Book bookObject;

  BottomBar(this.bookObject);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0.0,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
              color: Colors.black12,
              width: 2,
            ))),
        child: Row(
          children: <Widget>[PriceWidget(widget: widget), AddButton()],
        ),
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  @override
  _AddButtonState createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  String _buttonText = "Add to cart";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 11),
        elevation: 1.0,
        onPressed: () {
          setState(() {
            _addToCart();
          });
        },
        child: Row(
          children: <Widget>[
            Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              _buttonText,
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        color: inCart ? Colors.red : Colors.black54,
      ),
    );
  }

  _addToCart() {
    inCart = !inCart;
    _buttonText = (inCart == false) ? "Add to cart" : "Remove from cart";
  }
}

class PriceWidget extends StatelessWidget {
  const PriceWidget({@required this.widget});

  final BottomBar widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
              text: "\$" + widget.bookObject.price.toString(),
              style: TextStyle(
                  color: Colors.black87,
                  fontFamily: "lovelo",
                  fontSize: 30,
                  fontWeight: FontWeight.w500)),
          TextSpan(text: "   "),
          TextSpan(
              text: "\$" + (widget.bookObject.price + 5.45).toString(),
              style: TextStyle(
                  color: Colors.black26,
                  fontSize: 15,
                  decoration: TextDecoration.lineThrough))
        ]),
      ),
    );
  }
}
