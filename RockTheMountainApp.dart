import 'package:flutter/material.dart';

void main() {
  runApp(RockTheMountainApp());
}

class Artist {
  final String name;
  bool isFavorite;

  Artist(this.name, {this.isFavorite = false});
}

class RockTheMountainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rock The Mountain',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _content = 'description';
  List<Artist> _artists = [
    Artist('Buchecha'),
    Artist('CPM22'),
    Artist('DJ Marlboro'),
    Artist('Ed Motta'),
    Artist('Joelma'),
    Artist('Matuê'),
    Artist('Nando Reis'),
    Artist('Pabllo Vittar'),
    Artist('Preta Gil'),
    Artist('Seu Jorge'),
    Artist('Zeca Pagodinho'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00377A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // GIF
            SizedBox(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.network(
                  'https://static.wixstatic.com/media/ec091c_896a9ffedb204be1a52e6407824d6b50~mv2.gif',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Menu fixo
            Container(
              padding: EdgeInsets.all(16),
              color: Color(0xFF001229),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _content = 'description';
                      });
                    },
                    child: Text(
                      'Descrição',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _content = 'schedule';
                      });
                    },
                    child: Text(
                      'Programação',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _content = 'address';
                      });
                    },
                    child: Text(
                      'Endereço',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            // Corpo do aplicativo
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 25), // Espaçamento antes do conteúdo
                  // Conteúdo dinâmico
                  if (_content == 'description') ...[
                    // Descrição do evento
                    Text(
                      'O Rock The Mountain:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'O Rock the Mountain é um festival de música e arte que acontece em Itaipava, Petrópolis no Rio de Janeiro. A proposta é simples: Promover uma experiência única com muito astral para um público especial, na charmosa serra fluminense!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'O RTM reúne, em meio à natureza, juventude, modernidade, sustentabilidade, liberdade, estilo, diversão, gastronomia e claro, MUITA música num dia que promete ser inesquecível!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25), // Espaçamento após a Descrição
                  ],
                  if (_content == 'schedule') ...[
                    // Programação principal
                    Text(
                      'Artistas Confirmados:',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    // Lista de artistas
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: _buildArtistsList(),
                    ),
                    SizedBox(height: 25), // Espaçamento após a Programação
                  ],
                  // Endereço do local
                  if (_content == 'address') ...[
                    Text(
                      'Como Chegar?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Parque de Exposições de Petrópolis\nEstr. União e Indústria, 10.000\nItaipava, Petrópolis/RJ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 25), // Espaçamento após o Endereço
                  ],
                ],
              ),
            ),
            SizedBox(height: 25), // Espaçamento após o conteúdo
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        color: Color(0xFF001229),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Desenvolvido por Vinícius Mussel',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Treinamento de DART/Flutter com o Prof. Elias Santos.',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildArtistsList() {
    return _artists.map((artist) {
      return Column(
        children: [
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  artist.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    artist.isFavorite = !artist.isFavorite;
                  });
                },
              ),
              SizedBox(width: 8),
              Text(
                artist.name,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ],
      );
    }).toList();
  }
}
