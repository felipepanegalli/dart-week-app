import 'package:dart_week_app/app/core/custom_dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsuarioRepository {
  Future<bool> islogged() async {
    final String token = await this.getToken();
    return token != null;
  }

  Future<bool> login(String login, String senha) {
    final dio = CustomDio().instance;
    return dio.post('/login/', data: {
      'username': login,
      'password': senha,
    }).then((res) async {
      final String token = res.data['access'];
      if (token != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);
        return true;
      }

      return false;
    });
  }

  Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> cadastrarUsuario(String login, String senha) async {
    final dio = CustomDio().instance;
    return dio.post('/users/', data: {
      'username': login,
      'password': senha,
      'is_active': false,
    });
  }
}
