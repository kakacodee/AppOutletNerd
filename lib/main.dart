import 'package:flutter/material.dart';
import 'roupas.dart';
import 'leituras.dart';
import 'decoracoes.dart';
import 'brinquedos.dart';
import 'package:google_fonts/google_fonts.dart';
import 'venda.dart';

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
  void onBrinquedosPressed(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const brinquedos()),
    );
  }

   void onLeiturasPressed(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const leituras()),
    );
  }

   void onRoupasPressed(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const leituras()),
    );
  }

void onVoltarPressed(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MainApp()),
  );
}



  class GridProdutos extends StatelessWidget {
  const GridProdutos({super.key});

  @override
  Widget build(BuildContext context) {
    final images = [{'path':
      'assets/Mario.jpg', 'page': const VendaPage()},
     {'path': 'assets/Pikachu.jpg','page': const VendaPage()},
    {'path':  'assets/zoro.jpg', 'page': const VendaPage()},
    {'path':  'assets/Mario.jpg', 'page': const VendaPage()},
    { 'path': 'assets/Pikachu.jpg','page': const VendaPage() },
    { 'path': 'assets/zoro.jpg','page': const VendaPage() },
  ];

    return GridView.builder(
      shrinkWrap: true,
      itemCount: images.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // 3 colunas
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final item = images[index];
        return InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => item['page'] as Widget),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.red, width: 3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image.asset(
                      item['path'] as String,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            });
 
  }
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
        body: SingleChildScrollView(child: Column(
          children: <Widget>[
            Container( 
              color: const Color.fromARGB(255, 0, 0, 0),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
           
                TextButton(onPressed:() {
                  onDecoracoesPressed(context, "Decorações");
                }, child: Text('Decorações', style: GoogleFonts.passionOne(fontSize: 24,color: Colors.white),),
             
                ),
                       TextButton(onPressed:() {
                onBrinquedosPressed(context, "brinquedos");
                }, child: Text('Brinquedos', style: GoogleFonts.passionOne(fontSize: 24,color: Colors.white),),
              
                ),
                       TextButton(onPressed:() {
                onRoupasPressed(context, "roupas");
                }, child: Text('Roupas', style: GoogleFonts.passionOne(fontSize: 24,color: Colors.white),),
              
                ),
                       TextButton(onPressed:() {
                onLeiturasPressed(context, "Leituras");
                }, child: Text('Leituras', style: GoogleFonts.passionOne(fontSize: 24,color: Colors.white),

                ),
              )],
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
                        style: GoogleFonts.passionOne(fontSize: 36, color:Colors.grey), 
                        

                        

        ) ), 
        
        Center(
          child: GridProdutos()),

          Container(

      color: Colors.black,

      padding: EdgeInsets.all(20),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Row(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

           

              CircleAvatar(

                backgroundColor: Colors.black,

                radius: 30,

                backgroundImage: AssetImage('assets/logo.png'), 

              ),

              SizedBox(width: 15),

             

              Expanded(

                child: Text(

                  'A Outletnerd é a sua primeira escolha para produtos nerd. Com produtos exclusivos buscamos espalhar a cultura geek para todo o Brasil.',

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 14,

                  ),

                ),

              ),

            ],

          ),

          SizedBox(height: 20),

          Row(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

      

              Image.asset(

                'assets/payments.png', 

                height: 50,

              ),

              SizedBox(width: 30),

             

              Expanded(

                child: Text(

                  'AV. DOUTOR ASSIS RIBEIRO, R. ENGENHEIRO GOULART, Nº14398, SP, SÃO PAULO',

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 12,

                  ),

                ),

              ),

            ],

          ),

          SizedBox(height: 30),

          SizedBox(height: 10),

     

          Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Text(

                '© Outletnerd . Todos os direitos reservados',

                style: TextStyle(

                  color: Colors.white,

                  fontSize: 12,

                  letterSpacing: 1.2,

                ),

              ),

              Image.asset(

                'assets/techne.png', 

                height: 40,

              ),

            ],

          ),

        ],

      ),
        
       
      
          )  ] ),
             
)));
}
}

