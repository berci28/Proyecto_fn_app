import 'package:flutter/material.dart';
import 'package:proyecto_final/modelo/persona.dart';
import 'package:proyecto_final/sql/database.dart';

class MyTablePage extends StatefulWidget {
  const MyTablePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyTablePage> createState() => _MyTablePageState();
}

class _MyTablePageState extends State<MyTablePage> {
  List<Persona> personas = [];

  @override
  void initState() {
    cargaPersonas();
    super.initState();
  }

  cargaPersonas() async {
    List<Persona> auxPersonas = await DB.personas();

    setState(() {
      personas = auxPersonas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: personas.length,
          itemBuilder: (context, i) => Dismissible(
            key: Key(i.toString()),
            child: Column(
              children: [
                ListTile(
                  title: Text('Nombre: '),
                  subtitle: Text('' + personas[i].nombre),
                  leading: Icon(Icons.account_circle),
                ),
                ListTile(
                  title: Text('Correo electrónico:'),
                  subtitle: Text('' + personas[i].correo),
                  leading: Icon(Icons.mail),
                ),
                ListTile(
                  title: Text('Habitantes: '),
                  subtitle:
                      Text('' + personas[i].totalHabitantes + ' personas'),
                  leading: Icon(Icons.home),
                ),
                ListTile(
                  title: Text('Integrantes vacunadas: '),
                  subtitle:
                      Text('' + personas[i].numPersonasVacunadas + ' personas'),
                  leading: Icon(Icons.home_filled),
                ),
                ListTile(
                    title: Text('Dirección: '),
                    subtitle: Text('' + personas[i].direccion),
                    leading: Icon(Icons.fmd_good_sharp)),
                ListTile(
                    title: Text('Código postal:'),
                    subtitle: Text('' + personas[i].codigoPostal),
                    leading: Icon(Icons.fmd_good)),
                ListTile(
                  title: Text('Fecha de entrevista: '),
                  subtitle: Text('' + personas[i].fechaEntrevista),
                  leading: Icon(Icons.calendar_today),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton(
                        onPressed: () => {},
                        child: Text(
                            "------------------------------------------------------------------------------------------")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
