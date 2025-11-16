// venda.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'produto.dart';
import 'main.dart';
import 'decoracoes.dart';
import 'brinquedos.dart';
import 'leituras.dart';
import 'roupas.dart';

void onDecoracoesPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => const decoracoes()));
}

void onBrinquedosPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => const brinquedos()));
}

void onLeiturasPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => const leituras()));
}

void onRoupasPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => const roupas()));
}

void onVoltarPressed(BuildContext context, String title) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => const MainApp()));
}



class VendaPage extends StatelessWidget {
  final Produto produto;
   final List<Produto> produtos;
   

  const VendaPage({super.key, required this.produto, required this.produtos});

List<Produto> sugestoes() {
  return produtos.where((p) => p != produto).take(4).toList();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(169, 7, 7, 1),
        centerTitle: true,
        leading: IconButton(
          icon: Image.asset('assets/logo.png'),
          onPressed: () => onVoltarPressed(context, "MainApp"),
      
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

        

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    elevation: 2,
                    child: Image.asset(
                      produto.imagemUrl,
                      width: 150,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(produto.nome,
                            style: GoogleFonts.jockeyOne(
                                fontSize: 18, color: Color.fromRGBO(69, 69, 69, 1) )),
 const Divider(color: Colors.black, thickness: 2,  endIndent: 30,),
                    

                        Text(
                          'Por:R\$ ${produto.preco}',
                          style: GoogleFonts.jockeyOne(fontSize: 18,    color: Color.fromRGBO(69, 69, 69,1),
                            ),
                     
                         
                       
                        ),
                        Text(produto.parcelamento, style:GoogleFonts.jockeyOne(fontSize: 18,color: Color.fromRGBO(69, 69, 69,1) )),

                 
                        const Divider(color: Colors.black, thickness: 2,  endIndent: 30,),
                        Row(
 children: const [
 Icon(Icons.local_shipping, color: Colors.black54, size: 18),
 SizedBox(width: 8),
 Expanded(
 child: Text(
 'FRETE GRÁTIS APENAS PARA A GRANDE SÃO PAULO',
 style: TextStyle(
 fontSize: 12,
 color: Colors.black54,
 fontWeight: FontWeight.bold,
 ),
 ),
 ),
 ],
 ),

                        const SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromRGBO(58, 208, 121, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Adicionar ao Carrinho',
                              style: TextStyle(
                                fontSize: 15,
                                color:  Color.fromRGBO(69, 69, 69,1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        
                      ],
                    ),
                  )
                ],
              ),
            ),

            const Divider(color: Colors.black, thickness: 2, indent: 30, endIndent: 30,),

          
            
             Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, children: [ Text(
                "DESCRIÇÃO",
                style: GoogleFonts.jockeyOne(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromRGBO(69, 69, 69, 1))),
                const SizedBox(height: 8),
                Text(produto.descricao, style: GoogleFonts.jockeyOne(color: Color.fromRGBO(69, 69, 69, 1), fontSize: 15),)
          
              
           ] ),
            ),

            const SizedBox(height: 20),
             const Divider(color: Colors.black, thickness: 2, indent: 30, endIndent: 30,),

 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    Text("ESPECIFICAÇÃO",
                        style: GoogleFonts.jockeyOne(
                            fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromRGBO(69, 69, 69,1))),
                    const SizedBox(height: 12),

                    Table( 
                      columnWidths: const {
                        0: FlexColumnWidth(2),
                        1: FlexColumnWidth(2),
                      },
                      children: [
                        TableRow(children: [
                          Text("Conteúdo da embalagem",
                              style: GoogleFonts.jockeyOne()),
                          Text(produto.conteudo, style: GoogleFonts.jockeyOne()),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Referência do fornecedor",
                                style: GoogleFonts.jockeyOne()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(produto.ref, style: GoogleFonts.jockeyOne()),
                          ),
                        ]),
                        TableRow(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text("Idade Sugerida",
                                style: GoogleFonts.jockeyOne()),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(produto.idade, style: GoogleFonts.jockeyOne()),
                          ),
                        ]),
                      ],
                    ),
                    ],
                ),
              ),

 const Divider(color: Colors.black, thickness: 2, indent: 30, endIndent: 30,),

            Center(
              child: Text(
                "Você pode gostar também",
                style: GoogleFonts.jockeyOne(
                    fontWeight: FontWeight.bold, fontSize: 20, color: Color.fromRGBO(69, 69, 69, 1)),
              ),
            ),
            

     
       SizedBox(
        height: 120,
       
      
  child: ListView.builder(
      shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: sugestoes().length,
    itemBuilder: (_, index) {
      final produto= sugestoes()[index];

      return InkWell(
      
       onTap:() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => VendaPage(
                produto: produto,
                produtos: produtos,
              ),
            ),
          );
        },
        child: imagenes(produto.imagemUrl),
      );
    },
  ),
),


           const SizedBox(height: 20),

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

                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Image.asset('assets/payments.png', height: 50),

                        SizedBox(width: 30),

                        Expanded(
                          child: Text(
                            'AV. DOUTOR ASSIS RIBEIRO, R. ENGENHEIRO GOULART, Nº14398, SP, SÃO PAULO',

                            style: TextStyle(color: Colors.white, fontSize: 12),
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

                        Image.asset('assets/techne.png', height: 40),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
  


         
    
    );
  }

  Widget imagenes(String img) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.red, width: 3),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image.asset(img, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
