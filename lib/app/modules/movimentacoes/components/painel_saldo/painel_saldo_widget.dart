import 'package:dart_week_app/app/core/store_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_app/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:dart_week_app/app/utils/size_utils.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PainelSaldoWidget extends StatefulWidget {
  final double appBarHeight;

  const PainelSaldoWidget({Key key, this.appBarHeight}) : super(key: key);

  @override
  _PainelSaldoWidgetState createState() => _PainelSaldoWidgetState();
}

class _PainelSaldoWidgetState
    extends ModularState<PainelSaldoWidget, PainelSaldoController> {
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    super.initState();
    disposers ??= [
      reaction(
          (_) => controller.data, (_) => controller.buscarTotalMovimentacoes())
    ];
    controller.buscarTotalMovimentacoes();
  }

  @override
  Widget build(BuildContext context) {
    return SlidingSheet(
      elevation: 10,
      cornerRadius: 20,
      snapSpec: SnapSpec(
        snap: true,
        snappings: [.1, .4],
        positioning: SnapPositioning.relativeToAvailableSpace,
      ),
      headerBuilder: (_, state) {
        return Container(
          width: 60,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
      builder: (_, state) {
        return Observer(builder: (_) {
          switch (controller.totalMovimentacaoState) {
            case StoreState.initial:
            case StoreState.loading:
              return Container(
                height: SizeUtils.heightScreen,
                alignment: Alignment.topCenter,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  child: CircularProgressIndicator(),
                ),
              );
            case StoreState.loaded:
              return _makeContent();
            case StoreState.error:
              Get.snackbar('Erro ao buscar dados.', controller.errorMessage,
                  backgroundColor: Colors.white);
              return Container();
          }
          return Container();
        });
      },
    );
  }

  Widget _makeContent() {
    var model = controller.movimentacaoTotalModel;
    var numberFormat = NumberFormat('###.00', 'pt_BR');

    return Container(
      width: SizeUtils.widthScreen,
      height: SizeUtils.heightScreen * .4 - widget.appBarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => controller.previousMonth(),
              ),
              Text(
                DateFormat('MMMM yyyy', 'pt_BR').format(controller.data),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: model.saldo < 0 ? Colors.red : Colors.green,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () => controller.nextMonth(),
              ),
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              Text('Saldo'),
              Text(
                'R\$ ${model.saldo != 0 ? numberFormat.format(model.saldo) : '0,00'}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: model.saldo < 0 ? Colors.red : Colors.green,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF4BCE97),
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_upward),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Receitas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4BCE97),
                          ),
                        ),
                        Text(
                          'R\$ ${model.receitas != 0 ? numberFormat.format(model.receitas) : '0,00'}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4BCE97),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Icon(Icons.arrow_downward),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Despesas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          'R\$ ${model.despesas != 0 ? numberFormat.format(model.despesas) : '0,00'}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
