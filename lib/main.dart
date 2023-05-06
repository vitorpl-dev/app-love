import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Mozão',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  String _contentText = '';

  void _checkValue() {
    int? value = int.tryParse(_controller.text) ?? 0;

    if (value == 0) {
      _contentText = 'Então você não me ama né. Bom saber.';
    } else if (value < 10) {
      _contentText = 'É só isso? Que decepção.';
    } else if (value < 50) {
      _contentText = 'Ainda está muito baixo.';
    } else if (value < 100) {
      _contentText = 'Meu bem, sério isso? Você não me ama mesmo.';
    } else if (value < 1000) {
      _contentText = 'Mais ou menos, mas ainda não é suficiente.';
    } else {
      _contentText = 'Boa tentativa, mas eu ainda te amo infinitamente mais';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('EU NÃO ACREDITO!'),
        content: Text(_contentText),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK, ENTENDI'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -100,
            right: -100,
            child: SvgPicture.asset(
              './assets/blob.svg',
              alignment: Alignment.center,
              width: 300,
              height: 300,
            ),
          ),
          Positioned(
            top: 100,
            left: 70,
            child: SvgPicture.asset(
              './assets/heart.svg',
              alignment: Alignment.center,
              width: 150,
              height: 150,
            ),
          ),
          Positioned(
            top: 150,
            left: 150,
            child: SvgPicture.asset(
              './assets/heart.svg',
              alignment: Alignment.center,
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
            bottom: 100,
            right: 70,
            child: SvgPicture.asset(
              './assets/heart.svg',
              alignment: Alignment.center,
              width: 100,
              height: 100,
            ),
          ),
          Positioned(
            bottom: -100,
            left: -100,
            child: SvgPicture.asset(
              './assets/blob.svg',
              alignment: Alignment.center,
              width: 300,
              height: 300,
            ),
          ),
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 163, 194),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Olá Meirida vulgo gostosa cansada',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          ),
                        ),
                        prefixIcon: const Icon(Icons.favorite),
                        labelText: 'Quanto vc ama seu mozão?',
                        labelStyle: const TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: _controller,
                    ),
                  ],
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _checkValue,
        child: const Icon(Icons.all_inclusive),
      ),
    );
  }
}
