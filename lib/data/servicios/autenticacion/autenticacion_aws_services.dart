import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class AutenticacionAwsServices {
  final String baseURL;
  final headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICI5M1Z4X3JZRXFRZ1VUUklkLTZfak4xeThvaGYwRnF4S3pvMmNYbmxmQmxvIn0.eyJleHAiOjE3MjU0MDk2ODksImlhdCI6MTcyNTM3MzY4OSwianRpIjoiMmRkN2Y3NmUtOTdiMC00NDM2LTk5Y2QtZjNhN2IxMmQ1NDY4IiwiaXNzIjoiaHR0cHM6Ly9xYS5vc2N1cy5jb29wL2F1dGgvcmVhbG1zL09zY3VzIiwiYXVkIjpbImNvbXVuLWFwaSIsImJhbGNvbi1hcGkiLCJzbWFydC10ZWFtcyIsImVsZWNjaW9uZXMtYXBpIiwiYnVzY2Fkb3ItYXBpIiwiY2FzaGllciIsInBhcmFtZXRyb3MiLCJncHMiLCJzZ2MtYXBpIiwiZmlybWEtZWxlY3Ryb25pY2EiLCJjYXB0YWNpb25lcyIsImZhY3R1cmFjaW9uLWVsZWN0cm9uaWNhIiwibm90aWZpY2FjaW9uIiwic2VydmljaW9zLWFwaSIsImRhdGFib29rIiwiY29zdGVvLWFwaSJdLCJzdWIiOiI1Nzc0ODY3OC0wNDQwLTQyNmEtOGZmMy05NWNhZWZjZDZhYWMiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJzaWZpem9zIiwic2Vzc2lvbl9zdGF0ZSI6IjA3MzcyMmE0LTIwZWEtNGRiZi04MzNmLWQyYWMyZWYwMzZmZiIsInJlYWxtX2FjY2VzcyI6eyJyb2xlcyI6WyJzZ2NfdGljIiwib2ZmbGluZV9hY2Nlc3MiLCJvc2N1c29mdF91c3VhcmlvIiwic2djX3VzdWFyaW8iLCJkYXRhYm9vayIsImJsY25fdXN1YXJpbyIsImNwdGNfY2F1c2FsIl19LCJzY29wZSI6ImVtYWlsIHByb2ZpbGUgZ3BzIiwic2lkIjoiMDczNzIyYTQtMjBlYS00ZGJmLTgzM2YtZDJhYzJlZjAzNmZmIiwiZW1haWxfdmVyaWZpZWQiOmZhbHNlLCJwaHlzaWNhbERlbGl2ZXJ5T2ZmaWNlTmFtZSI6IkNPUlBPUkFUSVZPIiwicm9sZXMiOlsic2djX3RpYyIsIm9mZmxpbmVfYWNjZXNzIiwib3NjdXNvZnRfdXN1YXJpbyIsInNnY191c3VhcmlvIiwiZGF0YWJvb2siLCJibGNuX3VzdWFyaW8iLCJjcHRjX2NhdXNhbCJdLCJuYW1lIjoiS2V2aW4gQ2FpemFndWFubyBDaGljYWl6YSIsImRlc2NyaXB0aW9uIjoiQVNJU1RFTlRFIFBST0dSQU1BRE9SIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiZGNhaXphZ3Vhbm8iLCJnaXZlbl9uYW1lIjoiS2V2aW4iLCJmYW1pbHlfbmFtZSI6IkNhaXphZ3Vhbm8gQ2hpY2FpemEiLCJlbWFpbCI6ImRjYWl6YWd1YW5vQG9zY3VzLmNvb3AifQ.RaUfWeF6XmfzxgYxZw4bNXVAn8zZLnsiERtKs5gS7txBPW-1LZ8GsZ3_vIlEw3sHILEOM62OODl63V-7DNoIq8epsDJ4agF5ustqzNdvwrNh1mBzBPuPvbAQ3EPwNWYcB41_rbJoTuiHRy5wq1T8CBWBCl71itQJLUIWJb-QAWLGwNiE1cgFhtL--ZKDyLGD2tK0YsofJ5ateMoELoMMYdtH_dNjQc_gMeyeSTORLg7wz67ECm5Q49eSwwOnoSch0DOVTqfm1fzDtTPK6_7KVOl_ejLZBW83an4tHrQuU3d3wqK8SNenWY9jKNC_KO-zBRf44hDGp_2qawArs23Afw',
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
}
