class Persona {
  String nombre;
  String correo;
  String totalHabitantes;
  String numPersonasVacunadas;
  String direccion;
  String codigoPostal;
  String fechaEntrevista;

  // Constructor
  Persona(
      this.nombre,
      this.correo,
      this.totalHabitantes,
      this.numPersonasVacunadas,
      this.direccion,
      this.codigoPostal,
      this.fechaEntrevista);

  Map<String, dynamic> toMap() {
    return {
      'nombre': nombre,
      'correo': correo,
      'totalHabitantes': totalHabitantes,
      'numPersonasVacunadas': numPersonasVacunadas,
      'direccion': direccion,
      'codigoPostal': codigoPostal,
      'fechaEntrevista': fechaEntrevista
    };
  }
}
