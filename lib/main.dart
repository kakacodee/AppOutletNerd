import 'package:flutter/material.dart';
import 'roupas.dart';
import 'leituras.dart';
import 'decoracoes.dart';
import 'brinquedos.dart';

void main() {
  runApp(MainApp());
}
void onDecoracoesPressed(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const decoracoes()),
    );
  }
  
 
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor:Color.fromRGBO(169, 7, 7, 1),
       leading: 
    IconButton(
      icon: Image.asset('assets/logo.png',), onPressed: () {  }, // For local assets
   
        )),
        body:  Column(
          children: <Widget>[
            Container( 
              color: const Color.fromARGB(255, 0, 0, 0),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                ElevatedButton(onPressed:() {
                onDecoracoesPressed(context, "decoracoes");
                }, child: Text('oieeee'),
                )
                
                ],
              ),
            ),
  
        ]),

    ));
  }
}
