import 'package:flutter/material.dart';
import 'package:online_store_client_side/screens/cartItems.dart';
import 'drawer.dart';

class EditName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        // backgroundColor: Colors.deepPurple,
        title: Text('Edit Name'),
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  //margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'New Name',
                          hintText: 'Enter your New Name',
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Your Password',
                          hintText: 'Enter your Password',
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text('Save'),
                    onPressed: () {},
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                  ),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
