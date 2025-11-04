import 'main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MaterialApp(
    title: "Decorações",
    home: const decoracoes(),
  ));
}

void onDecoracoesPressed(BuildContext context, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const decoracoes()),
    );
  }

void onVoltarPressed(BuildContext context, String title) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MainApp()),
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
                onDecoracoesPressed(context, "brinquedos");
                }, child: Text('Brinquedos', style: GoogleFonts.passionOne(fontSize: 24,color: Colors.white),),
              
                ),
                       TextButton(onPressed:() {
                onDecoracoesPressed(context, "roupas");
                }, child: Text('Roupas', style: GoogleFonts.passionOne(fontSize: 24,color: Colors.white),),
              
                ),
                       TextButton(onPressed:() {
                onDecoracoesPressed(context, "Leituras");
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
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    final produto = produtos[index];
                    return Card(
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
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  // Aqui você pode colocar a navegação futuramente:
                                  // Navigator.push(context, MaterialPageRoute(builder: (_) => DetalhesProduto()));
                                },
                                child: Image.asset(
                                  produto["imagem"]!,
                                  fit: BoxFit.contain,
                                ),
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

              // Logo Section

              CircleAvatar(

                backgroundColor: Colors.black,

                radius: 30,

                backgroundImage: AssetImage('assets/logo.png'), // Add your logo image here

              ),

              SizedBox(width: 15),

              // Text Description

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

              // Payment Methods Image (as single image)

              Image.asset(

                'assets/payments.png', // Your combined payment methods image here

                height: 50,

              ),

              SizedBox(width: 30),

              // Address Section

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

          // Bottom Footer Row

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

                'assets/techne.png', // 4TECHNE logo image here

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
