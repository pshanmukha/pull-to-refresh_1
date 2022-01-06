import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pull to Refresh',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> data = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pull to Refresh"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2));
          updateData();
        },
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(5),
          scrollDirection: Axis.vertical,
          itemExtent: 50,
          children: List.generate(data.length, (index) =>
          Card(
            child: Container(
              alignment: Alignment.center,
              child: Text(data[index]),
            ),
          ),
          ),
        ),
      ),
    );
  }

  void updateData() {
    int i = data.length+1;
    data.add("Item $i");
    setState(() {

    });
  }
}

