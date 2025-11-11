// venda.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main.dart';
import 'decoracoes.dart';
import 'brinquedos.dart';
import 'leituras.dart';
import 'roupas.dart';

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
              // MENU SUPERIOR
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

              // PRODUTO PRINCIPAL
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image.asset('assets/Pikachu.jpg', height: 180),
                    const SizedBox(height: 12),
                    Text(
                      "Pelúcia Pikachu Média 30cm - Murph™",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Por: R\$ 50,90\nOu 5x de 10,90 sem juros",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 16, color: Colors.black87),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.local_shipping_outlined, color: Colors.black),
                          const SizedBox(width: 8),
                          Text(
                            "FRETE GRÁTIS APENAS PARA A GRANDE SÃO PAULO",
                            style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(76, 175, 80, 1),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      ),
                      child: Text("Adicionar ao Carrinho",
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
                    ),
                  ],
                ),
              ),

              const Divider(thickness: 1, height: 32),

              // DESCRIÇÃO
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DESCRIÇÃO",
                        style: GoogleFonts.poppins(
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

              // ESPECIFICAÇÃO
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

              // "Você pode gostar também"
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
            ],
          ),
        ),
      ),
    );
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