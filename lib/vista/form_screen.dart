import 'package:flutter/material.dart';
import 'package:proyecto_final/modelo/persona.dart';
import 'package:proyecto_final/sql/database.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  final nombreController = TextEditingController();
  final correoController = TextEditingController();
  final totalHabitanteController = TextEditingController();
  final numPersonasVacunadasController = TextEditingController();
  final direccionController = TextEditingController();
  final codigoPostalController = TextEditingController();
  final fechaEntrevistaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Container(
                margin: new EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextFormField(
                        restorationId: 'nombre',
                        controller: nombreController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Nombre completo',
                        ),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu nombre';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextFormField(
                        restorationId: 'email',
                        controller: correoController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Correo electrónico'),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu correo electrónico';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextFormField(
                        restorationId: 'total_habitantes',
                        controller: totalHabitanteController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Total habitantes'),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa el número de habitantes';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextFormField(
                        restorationId: 'num_personas_vacunadas',
                        controller: numPersonasVacunadasController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Personas vacunadas'),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa el número de personas vacunadas';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextFormField(
                        restorationId: 'direccion',
                        controller: direccionController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Dirección'),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu dirección';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextFormField(
                        restorationId: 'codigo_postal',
                        controller: codigoPostalController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Código postal'),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa tu código postal';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: TextFormField(
                        restorationId: 'fecha_entrevista',
                        controller: fechaEntrevistaController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Fecha Entrevista'),
                        maxLines: 1,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingresa fecha de entrevista';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 15),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(45),
                        ),
                        icon: const Icon(Icons.save_alt, size: 30),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String nombre = nombreController.text;
                            String correo = correoController.text;
                            String totalHabitantes =
                                totalHabitanteController.text;
                            String numPersonasVacunadas =
                                numPersonasVacunadasController.text;
                            String direccion = direccionController.text;
                            String codigoPostal = codigoPostalController.text;
                            String fechaEntrevista =
                                fechaEntrevistaController.text;

                            Persona persona = Persona(
                                nombre,
                                correo,
                                totalHabitantes,
                                numPersonasVacunadas,
                                direccion,
                                codigoPostal,
                                fechaEntrevista);

                            DB.insert(persona);

                            nombreController.text = "";
                            correoController.text = "";
                            totalHabitanteController.text = "";
                            numPersonasVacunadasController.text = "";
                            direccionController.text = "";
                            codigoPostalController.text = "";
                            fechaEntrevistaController.text = "";

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Registro guardado')),
                            );
                          }
                        },
                        label: const Text('Registrar'),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
