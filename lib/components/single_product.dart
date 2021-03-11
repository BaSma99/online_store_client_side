import 'package:flutter/material.dart';
import 'package:online_store_client_side/screens/product_details.dart';


class SingleProduct extends StatelessWidget {

  final productName;
  final productPicture;
  final oldPrice;
  final price;
  final ID;
  final count;
  final store;


  SingleProduct(this.productName, this.productPicture, this.oldPrice,
      this.price, this.ID, this.count, this.store);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("hero1"),
        child: Material(
          child: InkWell(
            onTap: () =>
              Navigator.of(context).push(new MaterialPageRoute(
                //passing values of the product to the product details
                  builder: (context) =>  ProductDetails(
                   productName,
                   productPicture,
                   oldPrice,
                   price,
                   ID,
                   count,
                   store,
                  )
               )
              ),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(
                      productName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text(
                      '\$$price',
                      style: TextStyle(
                          color: Colors.deepPurple[900],
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      "\$$oldPrice",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ),
                child: Image.asset(
                  productPicture,
                  fit: BoxFit.cover,
                )
            ),
          ),
        ),
      ),
    );
  }
}
