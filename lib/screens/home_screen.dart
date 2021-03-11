import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:online_store_client_side/components/categories_list.dart';
import 'package:online_store_client_side/components/drawer.dart';
import 'package:online_store_client_side/components/products.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_store_client_side/screens/CartItems.dart';
import 'package:online_store_client_side/screens/CheckOutPage.dart';

import 'cart.dart';

class HomePageScreen extends StatefulWidget {
  static const String routeName = '/MainScreen';

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

final sliderImages = [
  AssetImage('assets/images/slider/slider1.jpeg'),
  AssetImage('assets/images/slider/slider2.jpeg'),
  AssetImage('assets/images/slider/slider3.jpeg'),
  AssetImage('assets/images/slider/slider4.jpeg'),
  AssetImage('assets/images/slider/slider5.jpeg'),
];

class _HomePageScreenState extends State<HomePageScreen> {
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

  Widget imageSlider = Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: sliderImages,
      autoplay: true,
      dotSize: 4.0,
      indicatorBgPadding: 2.0,
      dotBgColor: Colors.transparent,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: Duration(milliseconds: 1000),
    ),
  );

  @override
  Widget build(BuildContext context) {
    getSize();
    getColor();

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Online Store',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.credit_card),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckOut()));
              }),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartItems()));
              })
        ],
      ),
      drawer: DrawerComponent(),
      body: ListView(
        children: <Widget>[
          imageSlider,
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Categories',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
            ),
          ),
          CategoriesList(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Recent Products',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
            ),
          ),
          Container(
            height: 320.0,
            child: Products(),
          ),
        ],
      ),
    );
  }
}
