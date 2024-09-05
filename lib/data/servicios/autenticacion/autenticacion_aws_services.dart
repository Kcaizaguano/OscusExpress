import 'dart:convert';

import 'package:flutter_application_2/data/models/modelos.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AutenticacionAwsServices {
  final String baseURL;
  final headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI5M1Z4X3JZRXFRZ1VUUklkLTZfak4xeThvaGYwRnF4S3pvMmNYbmxmQmxvIn0.eyJleHAiOjE3MjU1ODAzNzksImlhdCI6MTcyNTU0NDM3OSwianRpIjoiN2FhMjNhNjYtOWQ0NS00NGYwLTgwN2UtMWQ5NDE1NmRhZmM1IiwiaXNzIjoiaHR0cHM6Ly9xYS5vc2N1cy5jb29wL2F1dGgvcmVhbG1zL09zY3VzIiwiYXVkIjpbImNvbXVuLWFwaSIsImJhbGNvbi1hcGkiLCJzbWFydC10ZWFtcyIsImVsZWNjaW9uZXMtYXBpIiwiYnVzY2Fkb3ItYXBpIiwiY2FzaGllciIsInBhcmFtZXRyb3MiLCJncHMiLCJzZ2MtYXBpIiwiZmlybWEtZWxlY3Ryb25pY2EiLCJjYXB0YWNpb25lcyIsImZhY3R1cmFjaW9uLWVsZWN0cm9uaWNhIiwibm90aWZpY2FjaW9uIiwic2VydmljaW9zLWFwaSIsImRhdGFib29rIiwiY29zdGVvLWFwaSJdLCJzdWIiOiI1Nzc0ODY3OC0wNDQwLTQyNmEtOGZmMy05NWNhZWZjZDZhYWMiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzaWZpem9zIiwic2Vzc2lvbl9zdGF0ZSI6IjcwNjcyMDVhLWMzM2EtNDg5Ny04ZWIwLWNlMWZhNDlhZmY1YSIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJzZ2NfdGljIiwib2ZmbGluZV9hY2Nlc3MiLCJvc2N1c29mdF91c3VhcmlvIiwic2djX3VzdWFyaW8iLCJkYXRhYm9vayIsImJsY25fdXN1YXJpbyIsImNwdGNfY2F1c2FsIl19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUgZ3BzIiwic2lkIjoiNzA2NzIwNWEtYzMzYS00ODk3LThlYjAtY2UxZmE0OWFmZjVhIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwaHlzaWNhbERlbGl2ZXJ5T2ZmaWNlTmFtZSI6IkNPUlBPUkFUSVZPIiwicm9sZXMiOlsic2djX3RpYyIsIm9mZmxpbmVfYWNjZXNzIiwib3NjdXNvZnRfdXN1YXJpbyIsInNnY191c3VhcmlvIiwiZGF0YWJvb2siLCJibGNuX3VzdWFyaW8iLCJjcHRjX2NhdXNhbCJdLCJuYW1lIjoiS2V2aW4gQ2FpemFndWFubyBDaGljYWl6YSIsImRlc2NyaXB0aW9uIjoiQVNJU1RFTlRFIFBST0dSQU1BRE9SIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiZGNhaXphZ3Vhbm8iLCJnaXZlbl9uYW1lIjoiS2V2aW4iLCJmYW1pbHlfbmFtZSI6IkNhaXphZ3Vhbm8gQ2hpY2FpemEiLCJlbWFpbCI6ImRjYWl6YWd1YW5vQG9zY3VzLmNvb3AifQ.EBolsLiTR4rp90C1x1xzs0yIpXQXE2-_RA-JlnbXRrLbnSefyvBa3JMb5qtnrmPoVG6E4R8bjEtdMTpjjuXodhXP2nAkhK28M0NIi1NDUjIGUL0FN0W_p1Tdkge-lbRRO1xfBQwazILFe0VUom6nBTDHzpQZIAMZ-GKxamTy95LCf4bcCYegJIcLs7BDj6Z2lWIe4u-rn3pvbt5_ji7rbWvr967iX7Usp0Z89oovCv4uZj7_MxKgy6uNgEgGX7BKgAA4VHOXHK8CaNUZh9xw_R6kPtszRzStl0WtIDwu-EdSdxCrzMT4kHbVGgM0IPuJAwzL25g4IsOg6qbMtSdZcQ',
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
