import 'package:flutter/material.dart';
import 'package:online_store_client_side/screens/CartItems.dart';
import 'drawer.dart';

class ChangeLanguage extends StatefulWidget {
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  bool arabic = false;
  bool english = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        // backgroundColor: Colors.deepPurple,
        title: Text('Change Language'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  CartItems.routeName,
                );
              })
        ],
      ),
      drawer: DrawerComponent(),
      body: Container(
        padding: EdgeInsets.all(16.0),
        //margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Choose Language',
              style: TextStyle(fontSize: 20.0),
            ),
            CheckboxListTile(
              title: Text('Set English Language'),
              value: this.english,
              onChanged: (bool value) {
                setState(() {
                  this.english = value;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Set Arabic Language'),
              value: this.arabic,
              onChanged: (bool value) {
                setState(() {
                  this.arabic = value;
                });
              },
            ),
            SizedBox(
              width: 300.0,
              //height: 100.0,
              child: RaisedButton(
                child: Text('Save Language'),
                color: Colors.deepPurple,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
