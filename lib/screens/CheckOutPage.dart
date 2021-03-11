import 'package:flutter/material.dart';
import 'package:online_store_client_side/components/drawer.dart';
import 'package:online_store_client_side/models/CartFunctions.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
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
    return Consumer<CartFunctions>(
      builder: (context, CartFunctions, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0.1,
              // backgroundColor: Colors.deepPurple,
              title: Text(
                  'Check Out [\Total Price ${CartFunctions.totalPrice} \$]',
                  style: TextStyle(color: Color(fC), fontSize: fS)),
            ),
            drawer: DrawerComponent(),
            body: CartFunctions.basketItems.length == 0
                ? Text('No Items In The Cart',
                    style: TextStyle(color: Color(fC), fontSize: fS))
                : ListView.builder(
                    itemCount: CartFunctions.basketItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          title: Text(
                              CartFunctions.basketItems[index].productName),
                          subtitle: Text(
                              CartFunctions.basketItems[index].price.toString(),
                              style: TextStyle(color: Color(fC), fontSize: fS)),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              CartFunctions.remove(
                                  CartFunctions.basketItems[index]);
                            },
                          ),
                        ),
                      );
                    },
                  ));
      },
    );
  }
}
