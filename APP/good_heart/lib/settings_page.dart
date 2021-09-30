import 'package:flutter/material.dart';
import 'package:good_heart/main.dart';
import 'dart:io';
import 'home_page.dart';

class SettingsPage extends StatefulWidget {

  // Socket? client;
  Wrapper? socket;
  SettingsPage({Key? key, this.socket}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState(client: this.socket!.client);
}

class _SettingsPageState extends State<SettingsPage> {

  Socket? client;
  _SettingsPageState({this.client});

  Future<void> showAlertNotDeveloped(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("Hold on!\nUnfortunately this feature is not yet implemented..."),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Maybe next time."),
              )


            ]
          );
    });
  }

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
                  onTap: () async {
                    // Navigator.pushNamed(context, '/AQUI');
                    await showAlertNotDeveloped(context);
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.chat),
                  title: Text('Chat', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: () async {
                    // Navigator.pushNamed(context, '/AQUI');
                    await showAlertNotDeveloped(context);
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.storage),
                  title: Text('Storage', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: () async {
                    // Navigator.pushNamed(context, '/AQUI');
                    await showAlertNotDeveloped(context);
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Help', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: () async {
                    // Navigator.pushNamed(context, '/AQUI');
                    await showAlertNotDeveloped(context);
                  },
                ),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Info', style: TextStyle(fontSize: 18),),
                  dense: true,
                  onTap: () async {
                    // Navigator.pushNamed(context, '/AQUI');
                    await showAlertNotDeveloped(context);
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