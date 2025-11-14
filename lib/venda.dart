// venda.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'decoracoes.dart';
import 'brinquedos.dart';
import 'leituras.dart';
import 'roupas.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

void onDecoracoesPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const decoracoes()));
}

void onBrinquedosPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const brinquedos()));
}

void onLeiturasPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const leituras()));
}

void onRoupasPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const roupas()));
}

void onVoltarPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => const MainApp()));
}



class ProdutoCard extends StatelessWidget {
  const ProdutoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Card(
             elevation: 2,
              child: Image.asset(
                'assets/Pikachu.jpg', 
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pelúcia Pikachu Média 30cm - Murph™',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Por: R\$ 50,90',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'Ou 5x de 10,90 sem juros',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: const [
                      Icon(Icons.local_shipping, color: Colors.black54, size: 18),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          'FRETE GRÁTIS APENAS PARA A GRANDE SÃO PAULO',
                          style: TextStyle(
                            fontSize: 11.5,
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

               
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2ECC71),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                  
                      },
                      child: const Text(
                        'Adicionar ao Carrinho',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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

class VendaPage extends StatelessWidget {
  const VendaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(169, 7, 7, 1),
          leading: IconButton(
            icon: Image.asset('assets/logo.png'),
            onPressed: () => onVoltarPressed(context, "MainApp"),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
            
              Container(
                color: Colors.black,
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => onDecoracoesPressed(context, "Decorações"),
                      child: Text('Decorações',
                          style: GoogleFonts.passionOne(fontSize: 24, color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () => onBrinquedosPressed(context, "Brinquedos"),
                      child: Text('Brinquedos',
                          style: GoogleFonts.passionOne(fontSize: 24, color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () => onRoupasPressed(context, "Roupas"),
                      child: Text('Roupas',
                          style: GoogleFonts.passionOne(fontSize: 24, color: Colors.white)),
                    ),
                    TextButton(
                      onPressed: () => onLeiturasPressed(context, "Leituras"),
                      child: Text('Leituras',
                          style: GoogleFonts.passionOne(fontSize: 24, color: Colors.white)),
                    ),
                  ],
                ),
              ),
              
 Container(
  child: const ProdutoCard()
 )
     
    

              ,const Divider(thickness: 1, height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DESCRIÇÃO",
                        style: GoogleFonts.passionOne(
                            fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1)),
                    const SizedBox(height: 8),
                    Text(
                      "Pelúcia do Pikachu 30 cm da Murph™ muito fofinho e bacana!",
                      style: GoogleFonts.poppins(fontSize: 15),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Divider(thickness: 1),

         
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text("ESPECIFICAÇÃO",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 18, letterSpacing: 1)),
                    const SizedBox(height: 12),
                    Table(
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(children: [
                          Text("Conteúdo da embalagem",
                              style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                          Text("Pikachu Pelúcia 30 cm", style: GoogleFonts.poppins()),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Referência do fornecedor",
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("M4500-Z7", style: GoogleFonts.poppins()),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Idade Sugerida",
                                style: GoogleFonts.poppins(fontWeight: FontWeight.w500)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("A partir de 2 anos", style: GoogleFonts.poppins()),
                          ),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Divider(thickness: 1),

             
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Você pode gostar também",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          images('assets/mario.jpg'),
                          images('assets/Pikachu.jpg'),
                          images('assets/zoro.jpg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
        
       
      
          )  ] ), )));

  }

  Widget images(String imgpath) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 3),
          borderRadius: BorderRadius.circular(16),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(imgpath, fit: BoxFit.cover),
        ),
      ),
    );
  }}