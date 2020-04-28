import 'package:dart_week_app/app/repositories/usuario_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_app/app/modules/movimentacoes/components/painel_saldo/painel_saldo_widget.dart';
import 'package:dart_week_app/app/utils/size_utils.dart';
import 'package:get/get.dart';
import 'components/item.dart';
import 'movimentacoes_controller.dart';

class MovimentacoesPage extends StatefulWidget {
  final String title;
  const MovimentacoesPage({Key key, this.title = "Movimentacoes"})
      : super(key: key);

  @override
  _MovimentacoesPageState createState() => _MovimentacoesPageState();
}

class _MovimentacoesPageState
    extends ModularState<MovimentacoesPage, MovimentacoesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text(widget.title),
      centerTitle: true,
      actions: <Widget>[
        PopupMenuButton<String>(
          icon: Icon(Icons.add),
          itemBuilder: (_) {
            return [
              PopupMenuItem<String>(value: 'receita', child: Text('Receita')),
              PopupMenuItem<String>(value: 'despesa', child: Text('Despesa')),
            ];
          },
        ),
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: (){
            Modular.get<UsuarioRepository>().logout();
             Get.offAllNamed('/');
          },
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: Container(
        height: SizeUtils.heightScreen,
        child: Stack(
          children: <Widget>[
            _makeContent(),
            PainelSaldoWidget(
              appBarHeight: appBar.preferredSize.height,
            ),
          ],
        ),
      ),
    );
  }

  Widget _makeContent() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            itemBuilder: (_, index) => MovimentacaoItem(),
            separatorBuilder: (_, index) => Divider(color: Colors.black),
            itemCount: 15,
          ),
        ),
        SizedBox(height: 80),
      ],
    );
  }
}
