import 'package:flutter/material.dart';
import 'package:online_store_client_side/components/drawer.dart';
import 'package:online_store_client_side/screens/CheckOutPage.dart';
import 'package:online_store_client_side/screens/CartItems.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'About Us',
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
      body: Column(
        children: <Widget>[
          ListTile(
            leading: Image(image: AssetImage('assets/images/basma.jpg')),
            title: Text('Basma Reda',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            subtitle: Text('rbasma319@gmail.com',
                style: TextStyle(color: Colors.deepPurple)),
          ),
          ListTile(
            leading: Icon(Icons.phone_callback),
            title: Text('Phone Number',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            subtitle: Text('+201093808655',
                style: TextStyle(color: Colors.deepPurple)),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Email',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            subtitle: Text('rbasma319@gmail.com',
                style: TextStyle(color: Colors.deepPurple)),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('GitHub',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            subtitle:
                Text('BaSma99', style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}
