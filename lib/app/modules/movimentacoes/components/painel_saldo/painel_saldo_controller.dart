import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'painel_saldo_controller.g.dart';

class PainelSaldoController = _PainelSaldoControllerBase
    with _$PainelSaldoController;

abstract class _PainelSaldoControllerBase with Store {
  @observable
  DateTime data = DateTime.now();

  @computed
  String get ano => DateFormat('yyyy').format(data);
  
  @computed
  String get mes => DateFormat('MM').format(data);
}
