import 'package:flutter/material.dart';
import 'package:online_store_client_side/components/drawer.dart';
import 'package:online_store_client_side/screens/CartItems.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  SharedPreferences pref;
  double fontSize = 16;
  int fontColor = Colors.black.value;

  saveSize(double size) async {
    pref = await SharedPreferences.getInstance();
    pref.setDouble('fsize', size);
  }

  saveColor(int color) async {
    pref = await SharedPreferences.getInstance();
    pref.setInt('fcolor', color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepPurple,
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartItems()));
              })
        ],
      ),
      drawer: DrawerComponent(),
      body: Column(
        children: <Widget>[
          Text(
            'Select the font size',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          RadioListTile(
            title: Text('20'),
            value: 20.0,
            groupValue: fontSize,
            onChanged: (value) {
              setState(() {
                fontSize = value;
              });
              saveSize(value);
            },
          ),
          RadioListTile(
            title: Text('30'),
            value: 30.0,
            groupValue: fontSize,
            onChanged: (value) {
              setState(() {
                fontSize = value;
              });
              saveSize(value);
            },
          ),
          Text(
            'Select the font Color',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          RadioListTile(
            title: Text('Grey'),
            value: Colors.grey.value,
            groupValue: fontColor,
            onChanged: (value) {
              setState(() {
                fontColor = value;
              });
              saveColor(value);
            },
          ),
          RadioListTile(
            title: Text('Black'),
            value: Colors.black.value,
            groupValue: fontColor,
            onChanged: (value) {
              setState(() {
                fontColor = value;
              });
              saveColor(value);
            },
          ),
          Text(
            'Notification Settings',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SwitchListTile(
            dense: true,
            activeColor: Colors.deepPurple,
            contentPadding: const EdgeInsets.all(8.0),
            value: true,
            title:
                Text("Recive Notification", style: (TextStyle(fontSize: 16))),
            onChanged: (val) {},
          ),
          SwitchListTile(
            dense: true,
            activeColor: Colors.deepPurple,
            contentPadding: const EdgeInsets.all(8.0),
            value: true,
            title: Text("Recive Offers Notification",
                style: (TextStyle(fontSize: 16))),
            onChanged: null,
          ),
          SwitchListTile(
            dense: true,
            activeColor: Colors.deepPurple,
            contentPadding: const EdgeInsets.all(8.0),
            value: true,
            title: Text("Recive Updates Notification",
                style: (TextStyle(fontSize: 16))),
            onChanged: (val) {},
          ),
        ],
      ),
    );
  }
}

// class SettingPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.1,
//         // backgroundColor: Colors.deepPurple,
//         title: Text('Settings'),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
//           IconButton(
//               icon: Icon(Icons.shopping_cart, color: Colors.white),
//               onPressed: () {
//                 Navigator.pushNamed(
//                   context,
//                   Cart.routeName,
//                 );
//               })
//         ],
//       ),
//       drawer: DrawerComponent(),
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           SingleChildScrollView(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Card(
//                   elevation: 8.0,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   margin: const EdgeInsets.all(8.0),
//                   color: Colors.deepPurple,
//                   child: ListTile(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => EditName()));
//                     },
//                     title: Text("Basma Reda"),
//                     leading: CircleAvatar(
//                       backgroundColor: Colors.grey,
//                     ),
//                     trailing: Icon(Icons.edit),
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Card(
//                   elevation: 4.0,
//                   margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0)),
//                   child: Column(
//                     children: <Widget>[
//                       ListTile(
//                         leading: Icon(
//                           Icons.lock_outline,
//                           color: Colors.deepPurple,
//                         ),
//                         title: Text('Change Passwod'),
//                         trailing: Icon(Icons.keyboard_arrow_right),
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ChangePassword()));
//                         },
//                       ),
//                       Divider(
//                         height: 2.0,
//                       ),
//                       ListTile(
//                         leading: Icon(
//                           Icons.language,
//                           color: Colors.deepPurple,
//                         ),
//                         title: Text('Change Language'),
//                         trailing: Icon(Icons.keyboard_arrow_right),
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ChangeLanguage()));
//                         },
//                       ),
//                       Divider(
//                         height: 2.0,
//                       ),
//                       ListTile(
//                         leading: Icon(
//                           Icons.location_city,
//                           color: Colors.deepPurple,
//                         ),
//                         title: Text('Change Location'),
//                         trailing: Icon(Icons.keyboard_arrow_right),
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => ChangeLocation()));
//                         },
//                       ),
//                       Divider(
//                         height: 2.0,
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),

//         ],
//       ),
//     );
//   }

//   Container _buildDivider() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 0.0),
//       width: double.infinity,
//       height: 1.0,
//     );
//   }
// }
