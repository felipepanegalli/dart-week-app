import 'package:dart_week_app/app/core/custom_dio.dart';
import 'package:dart_week_app/app/models/categoria_model.dart';

class CategoryRepository {
  Future<List<CategoriaModel>> getCategoria(String tipo) {
    final dio = CustomDio.withAuthentication().instance;
    return dio.get('/categorias/$tipo').then((res) => res.data
        .map<CategoriaModel>((c) => CategoriaModel.fromMap(c))
        .toList());
  }
}
