import 'package:dart_week_app/app/core/custom_dio.dart';
import 'package:dart_week_app/app/models/movimentacao_model.dart';
import 'package:dart_week_app/app/models/movimentacao_total_model.dart';

class MovimentacoesRepository {
  Future<List<MovimentacaoModel>> getMovimentacoes(String mes, String ano) {
    var dio = CustomDio.withAuthentication().instance;
    return dio.get('/movimentacoes/$mes/$ano/').then((res) => res.data
        .map<MovimentacaoModel>((m) => MovimentacaoModel.fromMap(m))
        .toList());
  }

  Future<MovimentacaoTotalModel> getTotalMovimentacoes(String mes, String ano) {
    var dio = CustomDio.withAuthentication().instance;
    return dio
        .get('/movimentacoes/total/$mes/$ano/')
        .then((res) => MovimentacaoTotalModel.fromMap(res.data));
  }

  Future<void> salvarMovimentacao(int categoria, DateTime dataMovimentacao,
      String descricao, double valor) {
    var dio = CustomDio.withAuthentication().instance;
    return dio.post('/movimentacoes/', data: {
      'valor': valor,
      'descricao': descricao,
      'datamovimentacao': dataMovimentacao.toIso8601String(),
      'categoria_id': categoria,
    });
  }
}

// movimentacoes/<str:tipo>/ [name='movimentacoes-by-tipo']
