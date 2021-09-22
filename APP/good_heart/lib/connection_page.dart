import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:good_heart/colors.dart';

class ConnectionPage extends StatelessWidget {



  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  late final Socket client;

  // Dialog Structure
  Future<void> showIPDialog(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          // final TextEditingController _textEditingController = TextEditingController();
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
                      controller: _textEditingController,
                        validator: (value){
                          return value!.isNotEmpty ? null : "Invalid Field";
                        },
                        decoration: InputDecoration(hintText: "198.162.0.101"),
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
            content: Text("IP: " + _textEditingController.text, style: TextStyle(height: 1.2, fontSize: 20),),
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
  //const ConnectionPage({ Key? key }) : super(key: key);
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
                  height: 380.0,
                  width: 380.0,
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
                    client = await Socket.connect(_textEditingController.text, 3333);
                    //await Future.delayed(Duration(seconds: 5));
                    // client.close();

                    // AQUI
                    //Navigator.of(context).pop();
                    //Navigator.pushNamed(context, '/AQUI');
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
                    client.close();
                  },
                ),
                shadowColor: const Color.fromRGBO(255, 255, 255, 0),
                margin: EdgeInsets.only(left:20, right:20, top: 10),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.send,  size: 40,),
                  title: Text("Check connection to server", style: TextStyle(height: 1, fontSize: 20),),
                  subtitle: Text('Here is a second line'),
                  tileColor: MyColors.green[800], //AQUI
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onTap: () async {
                    var sendToServer = [
                      {'id': 40},
                      {'opcode': 300},
                    ];
                    var jsonText = jsonEncode(sendToServer);

                    client.write(jsonText);
                    client.listen(
                      // handle data from the client
                          (Uint8List data) async {
                            await Future.delayed(Duration(seconds: 1));
                            final message = String.fromCharCodes(data);
                            client.write(message);
                            print(message);
                            var jsonText = jsonDecode(message);
                            print(jsonText);
                          }
                    );

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