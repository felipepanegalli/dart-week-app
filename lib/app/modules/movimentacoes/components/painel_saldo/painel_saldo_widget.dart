import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_app/app/modules/movimentacoes/components/painel_saldo/painel_saldo_controller.dart';
import 'package:dart_week_app/app/utils/size_utils.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class PainelSaldoWidget extends StatefulWidget {
  final double appBarHeight;

  const PainelSaldoWidget({Key key, this.appBarHeight}) : super(key: key);

  @override
  _PainelSaldoWidgetState createState() => _PainelSaldoWidgetState();
}

class _PainelSaldoWidgetState
    extends ModularState<PainelSaldoWidget, PainelSaldoController> {
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
        return _makeContent();
      },
    );
  }

  Widget _makeContent() {
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
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
              Text(
                'Janeiro/2020',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: () {}),
            ],
          ),
          SizedBox(height: 20),
          Column(
            children: <Widget>[
              Text('Saldo'),
              Text(
                'R\$ 2000.00',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
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
                          'R\$ 200,00',
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
                          'R\$ 180,00',
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
