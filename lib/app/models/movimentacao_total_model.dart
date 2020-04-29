import 'dart:convert';

class MovimentacaoTotalModel {
  double receitas;
  double despesas;
  double total;
  double saldo;

  MovimentacaoTotalModel({
    this.receitas,
    this.despesas,
    this.total,
    this.saldo,
  });

  Map<String, dynamic> toMap() {
    return {
      'receitas': receitas,
      'despesas': despesas,
      'total': total,
      'saldo': saldo,
    };
  }

  static MovimentacaoTotalModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MovimentacaoTotalModel(
      receitas: map['receitas'],
      despesas: map['despesas'],
      total: map['total'],
      saldo: map['saldo'],
    );
  }

  String toJson() => json.encode(toMap());

  static MovimentacaoTotalModel fromJson(String source) =>
      fromMap(json.decode(source));
}


//45