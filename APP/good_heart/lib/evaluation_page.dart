// arrumando AQUI OPCAO 1
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:good_heart/communication_with_server.dart';
import 'package:good_heart/connection_page.dart';
import 'main.dart';

class Evaluation extends StatefulWidget {

  // Socket? client;
  Wrapper? socket;
  Evaluation({Key? key, this.socket}) : super(key: key);

  @override
  _EvaluationState createState() => _EvaluationState(socket: this.socket);
}

class _EvaluationState extends State<Evaluation> {

  Wrapper? socket;

  var listOfFiles = [];
  String? chosenFileName;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  final CommunicationWithServer _serverEval = CommunicationWithServer();

  _EvaluationState({this.socket});

  Future<void> askForFile(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return StatefulBuilder(builder: (context,setState){
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  // Create listview with cards 
                  // each card is a button (label: fileName, onTap: chosen = fileName)
                  child: Container (
                    height: 300.0, // Change as per your requirement
                    width: 300.0,
                    child: ListView.builder(
                    itemCount: listOfFiles.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(listOfFiles[index].ECGfile),
                        onTap: () {
                          chosenFileName = listOfFiles[index].ECGfile;
                          Navigator.of(context).pop();
                        },
                      );
                      },
                    )
                  )
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Back'),
                  onPressed: (){
                    if(_formKey.currentState!.validate()){
                      // Do something like updating SharedPreferences or User Settings etc.
                      chosenFileName = null;
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            );
          });
        });
  }

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

  Future<void> showServerEvaluation(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("Evaluation ready!"),
            actions: <Widget> [
              Text("ECG time: " + _serverEval.ECGTime),
              Text("Heart rate: " + _serverEval.FreqCard),
              Text("Good complex: " + _serverEval.GoodComplex),
              Text("Bad complex: " + _serverEval.BadComplex),
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

  Future<void> showAlertWifiNotConnected(BuildContext context) async {
    return await showDialog(context: context,
        builder: (context){
          return AlertDialog(
            content: Text("Looks like you are not conneted to a host."),
            actions: <Widget> [
              TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConnectionPage(socket: socket,)));

                  },
                  child: Text("Connect now."),
              )


            ]
          );
    });
  }

  jsonToList(String response) {

    listOfFiles = (json.decode(response) as List).map((i) => CommunicationWithServer.fromJson(i)).toList();

  }


  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluation'),
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
                              leading: Icon(Icons.add_circle, size: 40,),
                              title: Text('Capture new ECG', style: TextStyle(height: 1, fontSize: 20),),
                              subtitle: Text('Capture new ECG by placing sensors all over patients chest.'),
                              onTap: () async {
                                await showAlertNotDeveloped(context);
                                // var fileChoice = CommunicationWithServer(IdMsg: null, OpCode: 200, ECGfile: _textEditingController.text);
                                // client!.write(fileChoice.toJson());
                              },
                          ),
                          margin: EdgeInsets.only(left:20, right:20, top: 10),
                        ),
                        Card(
                            child: ListTile(
                              leading: Icon(Icons.add_circle, size: 40,),
                              title: Text('Patient captured ECG', style: TextStyle(height: 1, fontSize: 20),),
                              subtitle: Text('Evaluates an ECG already captured from the patient.'),
                              onTap: () async {
                                await showAlertNotDeveloped(context);
                                // var fileChoice = CommunicationWithServer(IdMsg: null, OpCode: 300, ECGfile: _textEditingController.text);
                                // client!.write(fileChoice.toJson());
                              },
                          ),
                          margin: EdgeInsets.only(left:20, right:20, top: 10),
                        ),
                        Card(
                          child: ListTile(
                            leading: FittedBox(
                              child: Icon(Icons.folder, size: 40,),
                              fit: BoxFit.fitHeight,
                            ),
                            title: Text('Find an ECG file', style: TextStyle(height: 1, fontSize: 20),),
                            subtitle: Text('Find a previously generated file with ECG info.'),
                            onTap: () async {
                              try {
                                // socket!.client!.write("[{\"ECGFile\": \"lol\"},{\"ECGFile\": \"lul\"}, {\"ECGFile\": \"lil\"}, {\"ECGFile\": \"lal\"}]");
                                socket!.client!.write("[{\"ECGfile\": \"file1\"}, {\"ECGfile\": \"file2\"}, {\"ECGfile\": \"file3\"}, {\"ECGfile\": \"file4\"}, {\"ECGfile\": \"file5\"}, {\"ECGfile\": \"file6\"}, {\"ECGfile\": \"file7\"}, {\"ECGfile\": \"file8\"}]");

                                // await socket!.client!.listen(dataHandler, 
                                //     onError: errorHandler, 
                                //     onDone: doneHandler, 
                                //     cancelOnError: false);
                                print("\n\n\n\nniceee\n\n\n\n\n");
                                // print(socket!.client!.isEmpty);

                                socket!.client!.asBroadcastStream().listen((List<int> bytes) {

                                  listOfFiles = jsonToList(new String.fromCharCodes(bytes).trim());
                                  print(listOfFiles[0].ECGfile);
                                  print(listOfFiles[1].ECGfile);

                                  }, 
                                  onError: (error, StackTrace trace) async {
                                    print(error);
                                  },

                                  cancelOnError: false
                                  
                                  
                                );

                                // listen((List<int> bytes) {

                                //   listOfFiles = jsonToList(new String.fromCharCodes(bytes).trim());
                                //   print(listOfFiles[0].ECGfile);
                                //   print(listOfFiles[1].ECGfile);

                                //   }, 
                                //   onError: (error, StackTrace trace) async {
                                //     print(error);
                                //   },

                                //   cancelOnError: false

                                
                                await askForFile(context);
                                print(chosenFileName);
                                // send to server in Json format
                                if (chosenFileName != null) {
                                  var fileChoice = CommunicationWithServer(IdMsg: null, OpCode: 100, ECGfile: chosenFileName);
                                  socket!.client!.write(fileChoice.toJson());
                                // pop loading dialog box
                                // listen for results 
                                // OpCode 400
                                /* 
                                  _serverEval = listen 
                                */
                                // pop dialog box with ECGTime, FreqCard, GoodComplex, BadComplex.
                                
                                // await showServerEvaluation(context);
                                }

                              }catch(_) {

                                print("\n\n\n\nnot niceee\n\n\n\n\n");
                                print(_);
                                await showAlertWifiNotConnected(context);

                              }
                              
                            },
                          ),
                          margin: EdgeInsets.only(left:20, right:20, top: 10),
                        ),
                      ],
              ),
            ),
    );
  }
}





//
// AQUI OPCAO 1
// import 'package:flutter/material.dart';
//
// class Evaluation extends StatefulWidget {
//   const Evaluation({Key? key}) : super(key: key);
//
//   @override
//   _EvaluationState createState() => _EvaluationState();
// }
//
// class _EvaluationState extends State<Evaluation> {
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Evaluation'),
//       ),
//       body: SafeArea(
//           child: Center(
//               child: Padding(
//                   padding: EdgeInsets.only(top: screenSize.height * 0.12),
//                     child: ListView(
//                       children: <Widget>[
//                         Card(
//                           child: ListTile(
//                             leading: Icon(Icons.add_circle, size: 40,),
//                             title: Text('Capture new ECG', style: TextStyle(height: 1, fontSize: 20),),
//                             subtitle: Text('Here is a second line'),
//                             onTap: (){
//                               Navigator.pushNamed(context, '/AQUI');
//                             },
//                           ),
//                         ),
//                         Card(
//                           child: ListTile(
//                             leading: FittedBox(
//                               child: Icon(Icons.folder, size: 40,),
//                               fit: BoxFit.fitHeight,
//                             ),
//                             title: Text('Find an ECG file', style: TextStyle(height: 1, fontSize: 20),),
//                             subtitle: Text('Here is a second line'),
//                             onTap: (){
//                               Navigator.pushNamed(context, '/AQUI');
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//               ),
//           ),
//       ),
//     );
//   }

//AQUI OPCAO 2
//
// import 'package:flutter/material.dart';
//
// class Evaluation extends StatefulWidget {
//   const Evaluation({Key? key}) : super(key: key);
//
//   @override
//   _EvaluationState createState() => _EvaluationState();
// }
//
// class _EvaluationState extends State<Evaluation> {
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Evaluation'),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Padding(
//               padding: EdgeInsets.only(top: screenSize.height * 0.12),
//               child: Column(
//                 children: <Widget>[
//
//                   ElevatedButton.icon(
//                       icon: Icon(Icons.folder, size: 20,),
//                       label: Text('Find an ECG file', style: TextStyle(height: 1, fontSize: 20),),
//
//                       onPressed: (){
//                         Navigator.pushNamed(context, '/placeSensors');
//                       },
//                   ),
//
//                   ElevatedButton.icon(
//                       icon: Icon(Icons.add_circle, size: 20,),
//                       label: Text('Capture new ECG', style: TextStyle(height: 1, fontSize: 20),),
//
//                       onPressed: (){
//                         Navigator.pushNamed(context, '/placeSensors');
//                       },
//                   )
//
//                 ],
//               )
//           ),
//         ),
//       ),
//     );
//   }
// }