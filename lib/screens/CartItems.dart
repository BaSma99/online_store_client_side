import 'package:flutter/material.dart';
import 'package:online_store_client_side/models/CartFunctions.dart';
import 'package:online_store_client_side/models/item.dart';
import 'package:online_store_client_side/components/drawer.dart';
import 'package:online_store_client_side/screens/CheckOutPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItems extends StatefulWidget {
  static const String routeName = '/CartItems';
  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
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

  final List<Item> items = [
    Item('Bag', 'assets/images/products/bag1.jpeg', 'xxx', 10, 0, 'black',
        'Bag store'),
    Item('HandMade dress', 'assets/images/products/dress1.jpeg', 'x', 10, 2,
        'red', 'Dressing store'),
    Item('Ring', 'assets/images/products/accessory1.jpeg', 'M', 10, 4, 'white',
        'Valleria store'),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CartFunctions>(builder: (context, CartFunctions, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          // backgroundColor: Colors.deepPurple,
          title: Text('Shopping Cart',
              style: TextStyle(color: Color(fC), fontSize: fS)),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.credit_card, color: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOut()));
                      }),
                  Text(CartFunctions.count.toString(),
                      style: TextStyle(color: Color(fC), fontSize: fS)),
                ],
              ),
            ),
          ],
        ),
        drawer: DrawerComponent(),
        body: Card(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(items[index].productPicture,
                    width: 80.0, height: 80.0),
                trailing: Icon(Icons.add),
                title: Text(items[index].productName),
                subtitle: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Size:",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            items[index].size,
                            style: TextStyle(color: Colors.deepPurple[900]),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                          child: Text("Color:"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            items[index].color,
                            style: TextStyle(color: Colors.deepPurple),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "\$${items[index].price}",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple[900],
                        ),
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  CartFunctions.add(items[index]);
                },
              );
            },
          ),
        ),
      );
    });
  }
}
