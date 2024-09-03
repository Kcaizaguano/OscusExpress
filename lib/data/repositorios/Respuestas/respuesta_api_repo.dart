import 'dart:convert';

import 'package:flutter_application_2/data/models/Respuestas/respuesta_api_model.dart';
import 'package:flutter_application_2/data/servicios/autenticacion/autenticacion_aws_services.dart';

class RespuestaApiRepo {
  final AutenticacionAwsServices autenticacionAwsServices;

  RespuestaApiRepo({required this.autenticacionAwsServices});

  Future<RespuestaApiModel> getSessionID() async {
    final data = await autenticacionAwsServices.getSessionID();
    return RespuestaApiModel.fromJson(jsonDecode(data.body));
  }
}
