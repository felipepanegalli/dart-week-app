import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_app/app/components/custom_button_form.dart';
import 'package:dart_week_app/app/components/custom_text_form_field.dart';
import 'package:dart_week_app/app/utils/size_utils.dart';
import 'package:dart_week_app/app/utils/theme_utils.dart';
import 'cadastro_controller.dart';

class CadastroPage extends StatefulWidget {
  final String title;
  const CadastroPage({Key key, this.title = "Cadastro"}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState
    extends ModularState<CadastroPage, CadastroController> {
  //use 'controller' variable to access controller
  AppBar appBar = AppBar(
    elevation: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          children: <Widget>[
            _makeHeader(),
            SizedBox(
              height: 30,
            ),
            _makeForm(),
          ],
        ),
      ),
    );
  }

  Widget _makeHeader() {
    return Container(
      color: ThemeUtils.primaryColor,
      height: (SizeUtils.heightScreen * .5) -
          (SizeUtils.statusBarHeight + appBar.preferredSize.height + 30),
      width: SizeUtils.widthScreen,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            bottom: 20,
            child: Image.asset('lib/app/assets/images/logo.png'),
          ),
        ],
      ),
    );
  }

  Widget _makeForm() {
    return Form(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Text(
              'Cadastre-se',
              style: TextStyle(
                fontSize: 24,
                color: ThemeUtils.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              label: 'Login',
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              label: 'Senha',
              obscureText: true,
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              label: 'Confirmar Senha',
              obscureText: true,
            ),
            SizedBox(height: 30),
            CustomButtonForm(
              label: 'Cadastrar',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
