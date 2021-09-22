import 'package:flutter/material.dart';
import 'home_page.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Card(
                child: Padding(
                  padding: EdgeInsets.only(top: screenSize.height * 0.01),
                ),
                shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                color: Colors.grey[50],
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.folder),
                  title: Text('Folder', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: (){
                    Navigator.pushNamed(context, '/AQUI');
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('Chat', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: (){
                    Navigator.pushNamed(context, '/AQUI');
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.storage),
                  title: Text('Storage', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: (){
                    Navigator.pushNamed(context, '/AQUI');
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: (){
                    Navigator.pushNamed(context, '/AQUI');
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Info', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: (){
                    Navigator.pushNamed(context, '/AQUI');
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
            ],
          )
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
//
// class SettingsPage extends StatefulWidget {
//   const SettingsPage({Key? key}) : super(key: key);
//
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }
//
// class _SettingsPageState extends State<SettingsPage> {
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: SafeArea(
//           child: Center(
//               child: Padding(
//                   padding: EdgeInsets.only(top: screenSize.height * 0.12),
//                   child: Column(
//                     children: <Widget>[
//
//                       ElevatedButton(
//                           onPressed: (){
//
//                           },
//                           child: Text('Setting 1')
//                       ),
//
//                       ElevatedButton(
//                           onPressed: (){
//
//                           },
//                           child: Text('Setting 2')
//                       ),
//
//                       ElevatedButton(
//                           onPressed: (){
//
//                           },
//                           child: Text('Setting 3')
//                       ),
//
//                       ElevatedButton(
//                           onPressed: (){
//
//                           },
//                           child: Text('Setting 4')
//                       ),
//
//                       ElevatedButton(
//                           onPressed: (){
//
//                           },
//                           child: Text('Setting 5')
//                       ),
//
//                       ElevatedButton(
//                           onPressed: (){
//
//                           },
//                           child: Text('Setting 6')
//                       )
//
//                     ],
//                   )
//               )
//           )
//       ),
//     );
//   }
// }