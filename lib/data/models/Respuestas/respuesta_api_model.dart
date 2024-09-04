class RespuestaApiModel {
  final String codigo;
  final bool correcto;
  final String informacion;
  final dynamic anexo;

  RespuestaApiModel({
    required this.codigo,
    required this.correcto,
    required this.informacion,
    required this.anexo,
  });

  factory RespuestaApiModel.fromJson(Map<String, dynamic> json) =>
      RespuestaApiModel(
        codigo: json["codigo"] ?? '',
        correcto: json["correcto"],
        informacion: json["informacion"] ?? '',
        anexo: json["anexo"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "codigo": codigo,
        "correcto": correcto,
        "informacion": informacion,
        "anexo": anexo.toJson(),
      };
}
