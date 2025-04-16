import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          textTheme: const TextTheme(
        bodyMedium: TextStyle(
            color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
        headlineMedium: TextStyle(
            color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 50),
      )),
      home: const MyHome(title: 'Flutter in 18 Minutes'),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key, required this.title});
  final String title;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _counter = 0;
  void increament() {
    setState(() {
      _counter++;
    });
  }

  void reset() {
    setState(() {
      _counter = 0;
    });
  }

  void decreament() {
    setState(() {
      _counter--;
    });
  }

  List<Color> _color = [Colors.pink, Colors.green, Colors.yellow];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color[_counter % _color.length],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text("$_counter",
                  style: Theme.of(context).textTheme.headlineMedium)),
          Text("Flutter", style: Theme.of(context).textTheme.bodyMedium)
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              increament();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              reset();
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              decreament();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
