import 'dart:convert';

import 'package:flutter_application_2/data/models/modelos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AutenticacionAwsServices {
  final String baseURL;
  final headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI5M1Z4X3JZRXFRZ1VUUklkLTZfak4xeThvaGYwRnF4S3pvMmNYbmxmQmxvIn0.eyJleHAiOjE3MjU0OTkwNzUsImlhdCI6MTcyNTQ2MzA3NSwianRpIjoiN2U3MjY4NzktODY0Zi00YzEwLWFjMTgtOWQ0NTE5MjVmOTEwIiwiaXNzIjoiaHR0cHM6Ly9xYS5vc2N1cy5jb29wL2F1dGgvcmVhbG1zL09zY3VzIiwiYXVkIjpbImNvbXVuLWFwaSIsImJhbGNvbi1hcGkiLCJzbWFydC10ZWFtcyIsImVsZWNjaW9uZXMtYXBpIiwiYnVzY2Fkb3ItYXBpIiwiY2FzaGllciIsInBhcmFtZXRyb3MiLCJncHMiLCJzZ2MtYXBpIiwiZmlybWEtZWxlY3Ryb25pY2EiLCJjYXB0YWNpb25lcyIsImZhY3R1cmFjaW9uLWVsZWN0cm9uaWNhIiwibm90aWZpY2FjaW9uIiwic2VydmljaW9zLWFwaSIsImRhdGFib29rIiwiY29zdGVvLWFwaSJdLCJzdWIiOiI1Nzc0ODY3OC0wNDQwLTQyNmEtOGZmMy05NWNhZWZjZDZhYWMiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzaWZpem9zIiwic2Vzc2lvbl9zdGF0ZSI6IjdhZGE3ZDZhLWExYWMtNDA2Zi1iOGI0LTU5NGI2Mjg3MTc3ZiIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJzZ2NfdGljIiwib2ZmbGluZV9hY2Nlc3MiLCJvc2N1c29mdF91c3VhcmlvIiwic2djX3VzdWFyaW8iLCJkYXRhYm9vayIsImJsY25fdXN1YXJpbyIsImNwdGNfY2F1c2FsIl19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUgZ3BzIiwic2lkIjoiN2FkYTdkNmEtYTFhYy00MDZmLWI4YjQtNTk0YjYyODcxNzdmIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwaHlzaWNhbERlbGl2ZXJ5T2ZmaWNlTmFtZSI6IkNPUlBPUkFUSVZPIiwicm9sZXMiOlsic2djX3RpYyIsIm9mZmxpbmVfYWNjZXNzIiwib3NjdXNvZnRfdXN1YXJpbyIsInNnY191c3VhcmlvIiwiZGF0YWJvb2siLCJibGNuX3VzdWFyaW8iLCJjcHRjX2NhdXNhbCJdLCJuYW1lIjoiS2V2aW4gQ2FpemFndWFubyBDaGljYWl6YSIsImRlc2NyaXB0aW9uIjoiQVNJU1RFTlRFIFBST0dSQU1BRE9SIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiZGNhaXphZ3Vhbm8iLCJnaXZlbl9uYW1lIjoiS2V2aW4iLCJmYW1pbHlfbmFtZSI6IkNhaXphZ3Vhbm8gQ2hpY2FpemEiLCJlbWFpbCI6ImRjYWl6YWd1YW5vQG9zY3VzLmNvb3AifQ.T9reOMkA-BeDf6ddpemp84PskxErj8ZLfH-gCrDRGkRmy7TnQ5tBuN4nagrAZzyhHZQ2YYuT7IKTCxbKE2LW0263mMZVZa7ZlA27VKHLRM1KD8bPL3oxra0bbJBfRdPIlh5KVTABDjmlsDKmewRTKkdAJOvgpw7SxLoBSfdBLJ6rtQL8zaocRiskMS632NKhma-ObR4TD0M9aeuYmOSA42oeNIjwiGWkvXKckolTUqzpor0lBXihHlE6IbBBin4IfFfTTLYFXoCT3cP3VevhzEW2zDb3OyBrXuAldwOEO6maS5lzQe15lv75UjISDiPmsPSAAnQTlDZxYiqsBWSu9A',
  };

  AutenticacionAwsServices()
      : baseURL = '${dotenv.env['URL_API_BALCON_SERVICIOS']}/aws-rekognition';

  Future<http.Response> getSessionID() async {
    final url = Uri.parse('$baseURL/crear-sesion-prueba-vida');
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<http.Response> getResultadosSessionID(String sessionID) async {
    final url = Uri.parse('$baseURL/resultado-sesion-prueba-vida/$sessionID');
    final response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  Future<http.Response> comparacionRostros(
      ComparacionRostroDto comparacionRostroDto) async {
    final url = Uri.parse('$baseURL/comparacion-rostros');
    final response = await http.post(url,
        headers: headers, body: json.encode(comparacionRostroDto));
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception(
          'FALLO AL REALIZAR LA PETICION DE COMPARACION DE ROSTROS');
    }
  }
}
