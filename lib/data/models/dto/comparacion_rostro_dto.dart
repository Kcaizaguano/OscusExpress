class ComparacionRostroDto {
  final String cedula;
  final String dactilar;
  final String foto;

  ComparacionRostroDto(
      {required this.cedula, required this.dactilar, required this.foto});

  // Método para crear una instancia de ComparacionRostrosDto a partir de un JSON
  factory ComparacionRostroDto.fromJson(Map<String, dynamic> json) {
    return ComparacionRostroDto(
      foto: json['foto'],
      cedula: json['cedula'],
      dactilar: json['dactilar'],
    );
  }

  // Método para convertir una instancia de ComparacionRostrosDto a JSON
  Map<String, dynamic> toJson() {
    return {
      'foto': foto,
      'cedula': cedula,
      'dactilar': dactilar,
    };
  }
}
