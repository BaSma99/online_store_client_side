import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:online_store_client_side/screens/contact_us.dart';
import 'package:online_store_client_side/screens/my_account.dart';
import 'package:online_store_client_side/screens/setting_screen.dart';
import 'package:online_store_client_side/screens/home_screen.dart';
import 'package:online_store_client_side/screens/CartItems.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:online_store_client_side/screens/CheckOutPage.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
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
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(
              'Basma Reda',
              style: TextStyle(color: Color(fC), fontSize: fS),
            ),
            accountEmail: Text('rbasma319@gmail.com',
                style: TextStyle(color: Color(fC), fontSize: fS)),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/basma.jpg'),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageScreen()));
            },
            child: ListTile(
              title: Text('Home Page',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
              leading: Icon(
                Icons.home,
                color: Colors.deepPurple,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccount()));
            },
            child: ListTile(
              title: Text('My Account',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
              leading: Icon(Icons.person, color: Colors.deepPurple),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CheckOut()));
            },
            child: ListTile(
              title: Text('My Orders',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
              leading: Icon(Icons.shopping_basket, color: Colors.deepPurple),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CartItems()));
            },
            child: ListTile(
              title: Text('Shopping Cart',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.deepPurple,
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingPage()));
            },
            child: ListTile(
              title: Text('Settings',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
              leading: Icon(
                Icons.settings,
                color: Colors.blueGrey[600],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
            child: ListTile(
              title: Text('About',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
              leading: Icon(Icons.help, color: Colors.blueGrey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
