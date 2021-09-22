// arrumando AQUI OPCAO 1
import 'package:flutter/material.dart';

class Evaluation extends StatefulWidget {
  const Evaluation({Key? key}) : super(key: key);

  @override
  _EvaluationState createState() => _EvaluationState();
}

class _EvaluationState extends State<Evaluation> {
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
                              subtitle: Text('Here is a second line'),
                              onTap: (){
                                Navigator.pushNamed(context, '/AQUI');
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
                            subtitle: Text('Here is a second line'),
                            onTap: (){
                              Navigator.pushNamed(context, '/AQUI');
                            },
                          ),
                          margin: EdgeInsets.only(left:20, right:20, top: 10),
                        ),
                      ],
              ),
            ),
    );
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
}

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