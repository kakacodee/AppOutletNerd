 import 'main.dart';
 import 'package:flutter/material.dart';
 


void main() {
  runApp(MaterialApp (title: "Decorações",
  home: decoracoes(),));
}

void onVoltarPressed(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainApp()),
    );
  }

 class decoracoes extends StatelessWidget{
  const decoracoes({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(backgroundColor:Color.fromRGBO(64, 54, 151, 0.308),
       leading: 
    IconButton(
      icon: Image.asset('assets/logo.png'), onPressed: () { onVoltarPressed(context, "MainApp"); {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MainApp()),
    );
  } 
  }, 
   
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
                }, child: null,
                )
                
                ],
              ),
            ),
  
        ]),

    ));
  }
}



