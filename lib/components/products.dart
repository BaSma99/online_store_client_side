import 'package:flutter/material.dart';
import 'package:online_store_client_side/components/single_product.dart';
import '../db.dart';

class Products extends StatefulWidget {
  static const String routeName = '/Products';

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
              product[index].productName,
              product[index].productPicture,
              product[index].oldPrice,
              product[index].price,
              product[index].ID,
              product[index].count,
              product[index].store);
        }
        );
    }
}
