// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'painel_saldo_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PainelSaldoController on _PainelSaldoControllerBase, Store {
  Computed<String> _$anoComputed;

  @override
  String get ano => (_$anoComputed ??= Computed<String>(() => super.ano)).value;
  Computed<String> _$mesComputed;

  @override
  String get mes => (_$mesComputed ??= Computed<String>(() => super.mes)).value;
  Computed<StoreState> _$totalMovimentacaoStateComputed;

  @override
  StoreState get totalMovimentacaoState => (_$totalMovimentacaoStateComputed ??=
          Computed<StoreState>(() => super.totalMovimentacaoState))
      .value;

  final _$dataAtom = Atom(name: '_PainelSaldoControllerBase.data');

  @override
  DateTime get data {
    _$dataAtom.context.enforceReadPolicy(_$dataAtom);
    _$dataAtom.reportObserved();
    return super.data;
  }

  @override
  set data(DateTime value) {
    _$dataAtom.context.conditionallyRunInAction(() {
      super.data = value;
      _$dataAtom.reportChanged();
    }, _$dataAtom, name: '${_$dataAtom.name}_set');
  }

  final _$errorMessageAtom =
      Atom(name: '_PainelSaldoControllerBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$_totalMovimentacoesAtom =
      Atom(name: '_PainelSaldoControllerBase._totalMovimentacoes');

  @override
  ObservableFuture<MovimentacaoTotalModel> get _totalMovimentacoes {
    _$_totalMovimentacoesAtom.context
        .enforceReadPolicy(_$_totalMovimentacoesAtom);
    _$_totalMovimentacoesAtom.reportObserved();
    return super._totalMovimentacoes;
  }

  @override
  set _totalMovimentacoes(ObservableFuture<MovimentacaoTotalModel> value) {
    _$_totalMovimentacoesAtom.context.conditionallyRunInAction(() {
      super._totalMovimentacoes = value;
      _$_totalMovimentacoesAtom.reportChanged();
    }, _$_totalMovimentacoesAtom,
        name: '${_$_totalMovimentacoesAtom.name}_set');
  }

  final _$movimentacaoTotalModelAtom =
      Atom(name: '_PainelSaldoControllerBase.movimentacaoTotalModel');

  @override
  MovimentacaoTotalModel get movimentacaoTotalModel {
    _$movimentacaoTotalModelAtom.context
        .enforceReadPolicy(_$movimentacaoTotalModelAtom);
    _$movimentacaoTotalModelAtom.reportObserved();
    return super.movimentacaoTotalModel;
  }

  @override
  set movimentacaoTotalModel(MovimentacaoTotalModel value) {
    _$movimentacaoTotalModelAtom.context.conditionallyRunInAction(() {
      super.movimentacaoTotalModel = value;
      _$movimentacaoTotalModelAtom.reportChanged();
    }, _$movimentacaoTotalModelAtom,
        name: '${_$movimentacaoTotalModelAtom.name}_set');
  }

  final _$buscarTotalMovimentacoesAsyncAction =
      AsyncAction('buscarTotalMovimentacoes');

  @override
  Future buscarTotalMovimentacoes() {
    return _$buscarTotalMovimentacoesAsyncAction
        .run(() => super.buscarTotalMovimentacoes());
  }

  final _$_PainelSaldoControllerBaseActionController =
      ActionController(name: '_PainelSaldoControllerBase');

  @override
  dynamic nextMonth() {
    final _$actionInfo =
        _$_PainelSaldoControllerBaseActionController.startAction();
    try {
      return super.nextMonth();
    } finally {
      _$_PainelSaldoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic previousMonth() {
    final _$actionInfo =
        _$_PainelSaldoControllerBaseActionController.startAction();
    try {
      return super.previousMonth();
    } finally {
      _$_PainelSaldoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'data: ${data.toString()},errorMessage: ${errorMessage.toString()},movimentacaoTotalModel: ${movimentacaoTotalModel.toString()},ano: ${ano.toString()},mes: ${mes.toString()},totalMovimentacaoState: ${totalMovimentacaoState.toString()}';
    return '{$string}';
  }
}
