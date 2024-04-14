import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static initEnviroment() async {
    await dotenv.load(fileName: '.env');
  }

  static String apiUrl =
      dotenv.env['API_URL'] ?? 'no esta configurafo el A{I_URL}';
}
