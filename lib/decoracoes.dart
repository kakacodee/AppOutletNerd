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

  class decoracoes extends StatelessWidget {
  const decoracoes({super.key});

  @override
  Widget build(BuildContext context) {
    final produtos = [
      {"imagem": "assets/lego_marvel.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
      {"imagem": "assets/lego_sonic.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
      {"imagem": "assets/miles_mask.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
      {"imagem": "assets/arqueira.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
      {"imagem": "assets/batmovel.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
      {"imagem": "assets/jogos.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
      {"imagem": "assets/capitao.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
      {"imagem": "assets/stitch1.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
      {"imagem": "assets/stitch2.png", "titulo": "Brinquedo", "preco": "de 99,99 R\$ por 79,99 R\$"},
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(169, 7, 7, 1),
          leading: IconButton(
            icon: Image.asset('assets/logo.png'),
            onPressed: () {
              onVoltarPressed(context, "MainApp");
            },
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
                    menuButton(context, "Decorações"),
                    menuButton(context, "Brinquedos"),
                    menuButton(context, "Roupas"),
                    menuButton(context, "Leituras"),
                  ],
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
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    final produto = produtos[index];
                    return GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Clicou em ${produto["titulo"]}")),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  produto["imagem"]!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Text(
                              produto["titulo"]!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                produto["preco"]!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
        

            Container(
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
                                  style: TextStyle(color: Colors.white70, fontSize: 13), textAlign: TextAlign.center,
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


    ] ) )));

  }

  TextButton menuButton(BuildContext context, String label) {
    return TextButton(
      onPressed: () {
        onDecoracoesPressed(context, label);
      },
      child: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        textStyle: const TextStyle(fontSize: 18),
      ),
    );
  }
}

// Função placeholder — substitua pela sua real
void onDecoracoesPressed(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Clicou em $title')),
  );
}