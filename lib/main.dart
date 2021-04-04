import 'package:flutter/material.dart';
import 'package:stopwatches/stopwatch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatches',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'All The Stopwatches!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> timers = [];

  void _addStopwatch() {
    setState(() {
      timers.add(StopwatchWidget());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: [...timers],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addStopwatch,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
