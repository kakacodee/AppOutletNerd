import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'roupas.dart';
import 'leituras.dart';
import 'decoracoes.dart';
import 'brinquedos.dart';
import 'package:google_fonts/google_fonts.dart';
import 'venda.dart';
import 'produto.dart';
import 'dart:math';


void main() {
  runApp(MaterialApp(title: "APP", home: MainApp()));
}

void onDecoracoesPressed(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const decoracoes()),
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
String searchQuery = "";

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(169, 7, 7, 1),
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
        
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                color: const Color.fromARGB(255, 0, 0, 0),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        onDecoracoesPressed(context, "Decorações");
                      },
                      child: Text(
                        'Decorações',
                        style: GoogleFonts.passionOne(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onBrinquedosPressed(context, "brinquedos");
                      },
                      child: Text(
                        'Brinquedos',
                        style: GoogleFonts.passionOne(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onRoupasPressed(context, "roupas");
                      },
                      child: Text(
                        'Roupas',
                        style: GoogleFonts.passionOne(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        onLeiturasPressed(context, "Leituras");
                      },
                      child: Text(
                        'Leituras',
                        style: GoogleFonts.passionOne(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 235,
                        decoration: BoxDecoration(color: Colors.white),
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/banner.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 60),
                child: Text(
                  'Mais Vendidos',
                  style: GoogleFonts.passionOne(
                    fontSize: 36,
                    color: Colors.grey,
                  ),
                ),
              ),

    Container( 
      child: GridView.builder(
      shrinkWrap: true,
      itemCount: min(produtos.length, 6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        final produto = produtos[index];
        return InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => VendaPage(produto: produto, produtos: produtos),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.red, width: 3),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(produto.imagemUrl, fit: BoxFit.cover),
            ),
          ),
        );
      },
    ),),

    const SizedBox(height: 100,),
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

                    SizedBox(height: 50),

                    

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
        )));
 
  }
}


