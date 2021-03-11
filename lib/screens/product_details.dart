import 'package:flutter/material.dart';
import 'package:online_store_client_side/components/similar_products.dart';
import 'package:online_store_client_side/db.dart';
import 'package:online_store_client_side/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'package:online_store_client_side/screens/CartItems.dart';
import 'package:online_store_client_side/screens/CheckOutPage.dart';

class ProductDetails extends StatefulWidget {
  static const String routeName = '/ProductDetails';

  final productName;
  final productPicture;
  final oldPrice;
  final price;
  final ID;
  final count;
  final store;

  List<Product> similarProduct;

  ProductDetails(this.productName, this.productPicture, this.oldPrice,
      this.price, this.ID, this.count, this.store);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  SharedPreferences pref;
  double fS = 16;
  int fC = Colors.black.value;
  getSize() async {
    pref = await SharedPreferences.getInstance();
    if (pref.get('fsize') != null) {
      setState(() {
        fS = pref.get('fsize');
      });
    }
  }

  getColor() async {
    pref = await SharedPreferences.getInstance();
    if (pref.get('fcolor') != null) {
      setState(() {
        fC = pref.get('fcolor');
      });
    }
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    for (int i = 0; i < product.length; i++) {
      if (product[i] == widget.store) {
        widget.similarProduct.add(product[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepPurple,
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageScreen()));
          },
          child: Text('Online Store'),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.credit_card, color: Color(fC)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckOut()));
              }),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Color(fC)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartItems()));
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.productPicture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.productName,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: fS,
                        color: Color(fC)),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("\$${widget.oldPrice}",
                            style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              fontSize: fS,
                            )),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.price}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: fS,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Id:${widget.ID}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: fS,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "count:${widget.count}",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: fS,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                //size button
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Size'),
                            content: Text(
                              'choose the size',
                              style: TextStyle(color: Color(fC), fontSize: fS),
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close",
                                    style: TextStyle(
                                        color: Color(fC), fontSize: fS)),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Size",
                          style: TextStyle(color: Color(fC), fontSize: fS),
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                //color button
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Colors',
                              style: TextStyle(color: Color(fC), fontSize: fS),
                            ),
                            content: Text('choose the color',
                                style:
                                    TextStyle(color: Color(fC), fontSize: fS)),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text("close",
                                    style: TextStyle(
                                        color: Color(fC), fontSize: fS)),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Color",
                          style: TextStyle(color: Color(fC), fontSize: fS),
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                //quantity button
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              'Quantity',
                              style: TextStyle(color: Color(fC), fontSize: fS),
                            ),
                            content: Text(
                              'choose the quantity',
                              style: TextStyle(color: Color(fC), fontSize: fS),
                            ),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text(
                                  "close",
                                  style:
                                      TextStyle(color: Color(fC), fontSize: fS),
                                ),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "Qty",
                          style: TextStyle(color: Color(fC), fontSize: fS),
                        ),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),

          //buy now
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.deepPurpleAccent,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text(
                    "Buy now",
                    style: TextStyle(color: Color(fC), fontSize: fS),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.deepPurpleAccent,
                ),
                onPressed: () {},
              )
            ],
          ),
          Divider(
            color: Colors.deepPurpleAccent,
          ),
          ListTile(
            title: Text(
              "Product Details",
              style: TextStyle(color: Color(fC), fontSize: fS),
            ),
            subtitle: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: TextStyle(color: Color(fC), fontSize: fS)),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product Name",
                  style: TextStyle(color: Color(fC), fontSize: fS),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  widget.productName,
                  style: TextStyle(color: Color(fC), fontSize: fS),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product Brand",
                  style: TextStyle(color: Color(fC), fontSize: fS),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  widget.store,
                  style: TextStyle(color: Color(fC), fontSize: fS),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product Condition",
                  style: TextStyle(color: Color(fC), fontSize: fS),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "New",
                  style: TextStyle(color: Color(fC), fontSize: fS),
                ),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(
              8.0,
            ),
            child: Text(
              "Similar Products",
              style: TextStyle(color: Color(fC), fontSize: fS),
            ),
          ),
          //similar products section
          Container(
            height: 360.0,
            child: SimilarProducts(widget.similarProduct),
          ),
        ],
      ),
    );
  }
}
