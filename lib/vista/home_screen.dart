import 'package:flutter/material.dart';
import 'package:proyecto_final/vista/form_screen.dart';
import 'package:proyecto_final/vista/table_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        children: [
          Padding(
            padding: const EdgeInsets.all(40),
            child: FlatButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyFormPage(title: 'Registro')))
              },
              color: Colors.black,
              textColor: Colors.white,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  Icon(Icons.add_chart),
                  Text("Registrar datos")
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: FlatButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const MyTablePage(title: 'Registros')))
              },
              color: Colors.black,
              textColor: Colors.white,
              padding: EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  Icon(Icons.visibility),
                  Text("Visualizar datos")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
