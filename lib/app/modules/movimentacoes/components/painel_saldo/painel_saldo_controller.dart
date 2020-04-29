import 'package:dart_week_app/app/core/store_state.dart';
import 'package:dart_week_app/app/models/movimentacao_total_model.dart';
import 'package:dart_week_app/app/repositories/movimentacoes_repository.dart';
import 'package:dart_week_app/app/utils/store_utils.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'painel_saldo_controller.g.dart';

class PainelSaldoController = _PainelSaldoControllerBase
    with _$PainelSaldoController;

abstract class _PainelSaldoControllerBase with Store {
  final MovimentacoesRepository movimentacoesRepository;
  _PainelSaldoControllerBase(this.movimentacoesRepository);

  @observable
  DateTime data = DateTime.now();

  @computed
  String get ano => DateFormat('yyyy').format(data);

  @computed
  String get mes => DateFormat('MM').format(data);

  @action
  nextMonth() {
    data = DateTime(data.year, data.month + 1, 1);
  }

  @action
  previousMonth() {
    data = DateTime(data.year, data.month - 1, 1);
  }

  @observable
  String errorMessage;

  @observable
  ObservableFuture<MovimentacaoTotalModel> _totalMovimentacoes;

  @computed
  StoreState get totalMovimentacaoState => StoreUtils.statusCheck(_totalMovimentacoes);

  @observable
  MovimentacaoTotalModel movimentacaoTotalModel;

  @action
  buscarTotalMovimentacoes() async {
    try {
      errorMessage = '';
      _totalMovimentacoes = ObservableFuture(movimentacoesRepository.getTotalMovimentacoes(mes, ano));
      movimentacaoTotalModel = await _totalMovimentacoes;
    } catch (e) {
      print(e);
      errorMessage = 'Erro ao buscar todas as movimentações';
    }
  }
}
