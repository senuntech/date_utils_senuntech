import 'package:date_utils_senuntech/date_utils_senuntech.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<DateTime> listDates = [];

  void _getDates() {
    setState(() {
      listDates = DateUtilsSenuntech().month(
        dueDate: DateTime(2022, 1, 5),
        interval: 1,
        amountOfDate: 10,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: listDates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listDates.elementAt(index).toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getDates,
        child: const Icon(Icons.add),
      ),
    );
  }
}
