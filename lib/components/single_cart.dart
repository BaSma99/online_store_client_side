// import 'package:flutter/material.dart';

// class SingleCart extends StatelessWidget {

//   final productName;
//   final productPicture;
//   final size;
//   final price;
//   final ID;
//   final color;
//   final store;

//   SingleCart(this.productName, this.productPicture, this.size, this.price,
//       this.ID, this.color, this.store);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: new Image.asset(productPicture, width: 80.0, height: 80.0),
//         title: new Text(productName),
//         subtitle: new Column(
//           children: <Widget>[
//             new Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: new Text(
//                     "Size:",
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: new Text(
//                     size,
//                     style: TextStyle(color: Colors.deepPurple[900]),
//                   ),
//                 ),
//                 new Padding(
//                   padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
//                   child: new Text("Color:"),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: new Text(
//                     color,
//                     style: TextStyle(color: Colors.deepPurple),
//                   ),
//                 ),
//               ],
//             ),
//             new Container(
//               alignment: Alignment.topLeft,
//               child: new Text(
//                 "\$$price",
//                 style: TextStyle(
//                   fontSize: 17.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple[900],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
