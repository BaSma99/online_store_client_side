import 'package:flutter/material.dart';
import 'package:online_store_client_side/components/single_category.dart';

class CategoriesList extends StatelessWidget {

  final categories = [
    {
      'image': 'assets/images/category/bags.png',
      'caption': 'Bags'
    },
    {
      'image': 'assets/images/category/phoneaccessories.png',
      'caption': 'Phone Accessories'
    },
    {
      'image': 'assets/images/category/womanaccessories.png',
      'caption': 'Women Accessories'
    },
    {
      'image': 'assets/images/category/dress.png',
      'caption': 'Dress'
    },
    {
      'image': 'assets/images/category/shoes.png',
      'caption': 'Shoes'
    },
    {
      'image': 'assets/images/category/gift.jpg',
      'caption': 'Gifts'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Category(
                  imageLocation: categories[index]['image'],
                  imageCaption: categories[index]['caption'],
            );
          }
      ),
    );
  }
}


