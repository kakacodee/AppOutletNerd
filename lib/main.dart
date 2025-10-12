import 'package:flutter/material.dart';
import 'roupas.dart';
import 'leituras.dart';
import 'decoracoes.dart';
import 'brinquedos.dart';

void main() {
  runApp(MaterialApp(title:"APP", home: MainApp()));
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
      icon: Image.asset('assets/logo.png'), onPressed: () { },
   
        )),
        body:  Column(
          children: <Widget>[
            Container( 
              color: const Color.fromARGB(255, 0, 0, 0),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
           
                TextButton(onPressed:() {
                  onDecoracoesPressed(context, "Decorações");
                }, child: Text('Decorações'),
                style: TextButton.styleFrom(foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20)
                ),
                ),
                       TextButton(onPressed:() {
                onDecoracoesPressed(context, "brinquedos");
                }, child: Text('Brinquedos'),
                style: TextButton.styleFrom(foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20, color: Colors.white)
                ),
                ),
                       TextButton(onPressed:() {
                onDecoracoesPressed(context, "roupas");
                }, child: Text('Roupas'),
                style: TextButton.styleFrom(foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20, color: Colors.white)
                ),
                ),
                       TextButton(onPressed:() {
                onDecoracoesPressed(context, "Leituras");
                }, child: Text('Leituras'),
                style: TextButton.styleFrom(foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20, color: Colors.white)
                ),
                ),
                ],
              ),  ),
              Container(child: Center(
            child: Column(
              children:<Widget>[ Container(
         
              width: MediaQuery.of(context).size.width,
              height: 235,
              decoration: BoxDecoration(
                color: Colors.white,
      
              ),
              child: ClipRRect(
        
                child: Image.asset(
                  'assets/banner.png', fit:BoxFit.fill
                )
                  ))    ] ),
      

   
    )
    ), Padding(padding: EdgeInsets.symmetric(vertical: 60),
                      child: Text(
                        'Mais Vendidos',
                        style: TextStyle(
                          fontSize: 24)

        ) ), Container(
                      color: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // logo e descrição
                              Container(
                                width: 72,
                                height: 72,
                                decoration: BoxDecoration(
                                  color: Colors.grey[900],
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage('assets/logo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'A Outletnerd é a sua primeira escolha para produtos nerd. Com produtos exclusivos buscamos espalhar a cultura geek para todo o Brasil.',
                                  style: TextStyle(color: Colors.white70, fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 14),

                          // pagamentos (ícones)
                      
                          SizedBox(height: 12),
                          Divider(color: Colors.white12),
                          SizedBox(height: 6),
                          Text(
                            '© Outletnerd . Todos os direitos reservados',
                            style: TextStyle(color: Colors.white38, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
     ); 
}
}

