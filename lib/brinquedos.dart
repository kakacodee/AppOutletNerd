import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'venda.dart';
import 'produto.dart';
import 'dart:math';
import 'dart:convert';
import 'roupas.dart';
import 'leituras.dart';



import 'package:flutter/services.dart';


void main() {
  runApp(MaterialApp(
    title: "Brinquedos",
    home: const brinquedos(),
  ));
}

void onDecoracoesPressed(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const brinquedos()),
    );
  }
  void onBrinquedosPressed(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const brinquedos()),
  );
}

void onLeiturasPressed(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const leituras()),
  );
}

void onRoupasPressed(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const roupas()),
  );
}

void onVoltarPressed(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MainApp()),
  );
}

class brinquedos extends StatefulWidget {
  const brinquedos({super.key});
   @override
  State<brinquedos> createState() => _Brinquedos();
}

class _Brinquedos extends State<brinquedos> {
  List<Produto> produtos = [];
  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }

  Future<void> carregarProdutos() async {
    final String response = await rootBundle.loadString('assets/produtos.json');
    final data = json.decode(response);

    setState(() {
      produtos = (data as List).map((e) => Produto.fromJson(e)).toList();
    });
  }
  

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(169, 7, 7, 1),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset('assets/logo.png'),
            onPressed: () {
              onVoltarPressed(context, "MainApp");
            },
          ),    
           title: SizedBox(
           height: 35,
    width: 208,
    child: TextField(
      onChanged: (value) {
        setState(() {
          searchQuery = value.toLowerCase();
        });
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  ),
        ),
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
     ),
                ),
             
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: min(produtos.length, 9),
                  itemBuilder: (context, index) {
                    final produto = produtos[index];
                    return Card(
                    color: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                 Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => VendaPage(produto: produto, produtos: [],)
            ));
                                },
                                child: Image.asset(
                                  produto.imagemUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            produto.nome,
                            style: GoogleFonts.instrumentSans(
                              fontSize: 15,
                              
                          
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                             'Por:R\$ ${produto.preco}', 
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        
                        ],
                      ), 
                    );
                  },
                ),),   Container(

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
        
            
          ),
    ])  ),
    ));
  }

}
