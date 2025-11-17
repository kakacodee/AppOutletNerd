import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'produto.dart';
import 'main.dart';
import 'decoracoes.dart';
import 'brinquedos.dart';
import 'leituras.dart';
import 'roupas.dart';

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

class VendaPage extends StatefulWidget {
  final Produto produto;
  final List<Produto> produtos;

  const VendaPage({super.key, required this.produto, required this.produtos});

  @override
  State<VendaPage> createState() => _VendaPageState();
}

class _VendaPageState extends State<VendaPage> {
  String searchQuery = "";
  List<Produto> sugestoesp = [];
  final FocusNode searchFocus = FocusNode();

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

        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 38,
              width: 250,
              child: TextField(
                focusNode: searchFocus,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();

                    sugestoesp = widget.produtos
                        .where((p) {
                          final nome = p.nome.toLowerCase();
                          return nome.contains(searchQuery);
                        })
                        .take(5)
                        .toList(); 
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: const Icon(Icons.search),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
             
                Container(
                  color: Colors.black,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () =>
                            onDecoracoesPressed(context, "Decorações"),
                        child: Text(
                          "Decorações",
                          style: GoogleFonts.passionOne(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            onBrinquedosPressed(context, "Brinquedos"),
                        child: Text(
                          "Brinquedos",
                          style: GoogleFonts.passionOne(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => onRoupasPressed(context, "Roupas"),
                        child: Text(
                          "Roupas",
                          style: GoogleFonts.passionOne(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => onLeiturasPressed(context, "Leituras"),
                        child: Text(
                          "Leituras",
                          style: GoogleFonts.passionOne(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (sugestoesp.isNotEmpty && searchQuery.isNotEmpty)
                  Positioned(
                    left: MediaQuery.of(context).size.width / 2 - 125,
                    top: 0,
                    width: 250,
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(12),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: sugestoesp.length,
                        itemBuilder: (context, index) {
                          final produto = sugestoesp[index];
                          return ListTile(
                            title: Text(produto.nome),
                            onTap: () {
                              FocusScope.of(context).unfocus();

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => VendaPage(
                                    produto: produto,
                                    produtos: widget.produtos,
                                  ),
                                ),
                              );

                              setState(() => sugestoesp = []);
                            },
                          );
                        },
                      ),
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
                          widget.produto.imagemUrl,
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
                            Text(
                              widget.produto.nome,
                              style: GoogleFonts.jockeyOne(
                                fontSize: 18,
                                color: Color.fromRGBO(69, 69, 69, 1),
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 2,
                              endIndent: 30,
                            ),
                            Text(
                              'Por:R\$ ${widget.produto.preco}',
                              style: GoogleFonts.jockeyOne(
                                fontSize: 18,
                                color: Color.fromRGBO(69, 69, 69, 1),
                              ),
                            ),
                            Text(
                              widget.produto.parcelamento,
                              style: GoogleFonts.jockeyOne(
                                fontSize: 18,
                                color: Color.fromRGBO(69, 69, 69, 1),
                              ),
                            ),
                            const Divider(
                              color: Colors.black,
                              thickness: 2,
                              endIndent: 30,
                            ),
                            SizedBox(height: 12,),
                            Row(
                              children: const [
                                Icon(
                                  Icons.local_shipping,
                                  color: Colors.black54,
                                  size: 18,
                                ),

                                SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    'FRETE GRÁTIS APENAS PARA A GRANDE SÃO PAULO',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                         
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),

                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "DESCRIÇÃO",
                        style: GoogleFonts.jockeyOne(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(69, 69, 69, 1),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.produto.descricao,
                        style: GoogleFonts.jockeyOne(
                          color: Color.fromRGBO(69, 69, 69, 1),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "ESPECIFICAÇÃO",
                        style: GoogleFonts.jockeyOne(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color.fromRGBO(69, 69, 69, 1),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Center(child:
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(2),
                        },
                        children: [
                          TableRow(
                            children: [
                              Text(
                                "    Conteúdo da embalagem",
                                style: GoogleFonts.jockeyOne(),
                              ),
                              Text(
                                widget.produto.conteudo,
                                style: GoogleFonts.jockeyOne(),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "     Referência do fornecedor",
                                  style: GoogleFonts.jockeyOne(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  widget.produto.ref,
                                  style: GoogleFonts.jockeyOne(),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "     Idade Sugerida",
                                  style: GoogleFonts.jockeyOne(),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  widget.produto.idade,
                                  style: GoogleFonts.jockeyOne(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),  ],
                  ),
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),

         
                Center(
                  child: Text(
                    "Você pode gostar também",
                    style: GoogleFonts.jockeyOne(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(69, 69, 69, 1),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.produtos
                        .where((p) => p != widget.produto)
                        .take(4)
                        .length,
                    itemBuilder: (_, index) {
                      final lista = widget.produtos
                          .where((p) => p != widget.produto)
                          .take(4)
                          .toList();
                      final p = lista[index];

                      return InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VendaPage(
                                produto: p,
                                produtos: widget.produtos,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.red, width: 3),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: Image.asset(
                                p.imagemUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 30),

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
                          Image.asset('assets/payments.png', height: 50),
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
                          Image.asset('assets/techne.png', height: 40),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
