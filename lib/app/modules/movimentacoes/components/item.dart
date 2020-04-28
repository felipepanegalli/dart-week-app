import 'package:dart_week_app/app/models/movimentacao_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MovimentacaoItem extends StatelessWidget {
  final MovimentacaoModel item;
  const MovimentacaoItem({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat('###.00', 'pt_BR');
    var dateFormat = DateFormat('dd/MM/yyyy');

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(dateFormat.format(item.dataMovimentacao)),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor:
                item.categoria.tipo == 'despesa' ? Colors.red : Colors.green,
            child: Icon(
                item.categoria.tipo == 'despesa'
                    ? Icons.money_off
                    : Icons.attach_money,
                color: Colors.white),
          ),
          title: Text(item.descricao),
          subtitle: Text(item.categoria.nome),
          trailing: Container(
            padding: EdgeInsets.only(right: 10),
            child: Text('R\$ ${numberFormat.format(item.valor)}',
                style: TextStyle(
                    color: item.categoria.tipo == 'despesa'
                        ? Colors.red
                        : Colors.green)),
          ),
        ),
      ],
    );
  }
}
