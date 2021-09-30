import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:good_heart/colors.dart';
import 'package:good_heart/main.dart';

import 'communication_with_server.dart';

class ConnectionPage extends StatefulWidget {

  Wrapper? socket;
  ConnectionPage({Key? key, this.socket}) : super(key: key);

  @override
  _ConnectionPage createState() => _ConnectionPage(socket: this.socket);
}

class _ConnectionPage extends State<ConnectionPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingControllerIP = TextEditingController();
  final TextEditingController _textEditingControllerConnectionTest = TextEditingController();
  Wrapper? socket;

  _ConnectionPage({this.socket});

  // Dialog Structure
  Future<void> showIPDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          // final TextEditingController _textEditingControllerIP = TextEditingController();
          bool isChecked = false;
          return StatefulBuilder(builder: (context,setState){
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Enter your host IP: ", style: TextStyle(height: 1.2, fontSize: 20),),
                      TextFormField(
                      controller: _textEditingControllerIP,
                        validator: (value){
                          return value!.isNotEmpty ? null : "Invalid Field";
                        },
                        decoration: InputDecoration(hintText: "192.168.0.101"),
                      ),
                    ],
                  )
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Ok'),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

  Future<void> getIPDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("IP: " + _textEditingControllerIP.text, style: TextStyle(height: 1.2, fontSize: 20),),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
              )


            ]
          );
    });
  }

  Future<void> showAlertUnnableToConnect(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("\"" + _textEditingControllerIP.text + "\" doesn't seem to be a valid IP."),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
              )


            ]
          );
    });
  }

  Future<void> showAlertServerAnswer(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("Server sent: \"" + _textEditingControllerConnectionTest.text + "\"."),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
              )


            ]
          );
    });
  }

  Future<void> showAlertErrorSocket(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("Socket ERROR."),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok"),
              )


            ]
          );
    });
  }

  // Connection Page Structure
  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wi-Fi connection'),
      ),
      body: SafeArea(
        child: ListView(
            children: <Widget>[
              Card( //AQUI não sei se esse align faz sentido dentro de um listview, já que ele não faz nada
                child: Image.asset(
                  "assets/images/Gifs/HeartBeatBranco.gif",
                  height: 300.0,
                  width: 300.0,
                ),
                shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                color: Colors.grey[50],
                margin: EdgeInsets.all(20),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.wifi,  size: 40,),
                  title: Text("Connect to Wi-Fi", style: TextStyle(height: 1, fontSize: 20),),
                  subtitle: Text('Here is a second line'),
                  tileColor: MyColors.green[800], //AQUI
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () async {
                    await showIPDialog(context);
                    try {
                      socket!.setClient(await Socket.connect(_textEditingControllerIP.text, 3333));
                    } catch(_) {
                      await showAlertUnnableToConnect(context);
                    }

                  },
                ),
                shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.wifi_off,  size: 40,),
                  title: Text("Disconnect from Wi-Fi", style: TextStyle(height: 1, fontSize: 20),),
                  subtitle: Text('Here is a second line'),
                  tileColor: MyColors.green[800], //AQUI
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () async {
                    socket!.client!.close();
                    // socket = Wrapper(null);
                  },
                ),
                shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.send,  size: 40,),
                  title: Text("Check connection with server", style: TextStyle(height: 1, fontSize: 20),),
                  subtitle: Text('Here is a second line'),
                  tileColor: MyColors.green[800], //AQUI
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () async {
                    var sendToServer = CommunicationWithServer(IdMsg: "Testing connection", OpCode: 100);
                    socket!.client!.write(sendToServer.toJson());

                    try {
                      socket!.client!.listen((List<int> bytes) {
                        // print(new String.fromCharCodes(bytes).trim());
                        _textEditingControllerConnectionTest.text = (new String.fromCharCodes(bytes).trim());
                      }, 
                    
                      onError: (error, StackTrace trace) async {
                        await showAlertErrorSocket(context);
                      },

                      cancelOnError: false
                      );
                      await showAlertServerAnswer(context);

                    }catch(_) {
                      print(_);
                    }

                  },
                ),
                shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.scatter_plot,  size: 40,),
                  title: Text("Show IP", style: TextStyle(height: 1, fontSize: 20),),
                  subtitle: Text('Here is a second line'),
                  tileColor: MyColors.green[800], //AQUI
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () async {
                    await getIPDialog(context);
                  },
                ),
                shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
            ]
        ),

      ),

    );
  }
}