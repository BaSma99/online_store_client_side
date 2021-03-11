import "package:flutter/material.dart";
import 'package:online_store_client_side/models/CartFunctions.dart';
import 'package:online_store_client_side/screens/CartItems.dart';
import 'package:online_store_client_side/screens/home_screen.dart';
import 'package:online_store_client_side/screens/product_details.dart';
import 'components/products.dart';
import 'screens/CartItems.dart';
import 'package:provider/provider.dart';
import 'models/CartFunctions.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartFunctions(),
    child: MyApp(),
  ));
}
//void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Store',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: HomePageScreen.routeName,
      routes: {
        HomePageScreen.routeName: (context) => HomePageScreen(),
        Products.routeName: (context) => Products(),
        CartItems.routeName: (context) => CartItems(),
      },
    );
  }
}
