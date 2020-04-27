import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_app/app/components/custom_button_form.dart';
import 'package:dart_week_app/app/components/custom_text_form_field.dart';
import 'package:dart_week_app/app/utils/size_utils.dart';
import 'package:dart_week_app/app/utils/theme_utils.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      height: (SizeUtils.heightScreen * .5) - SizeUtils.statusBarHeight,
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
            CustomTextFormField(
              label: 'Login', icon: Icons.lock,
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              label: 'Senha', icon: Icons.fingerprint,
              obscureText: true,
            ),
            SizedBox(height: 30),
            CustomButtonForm(
              label: 'Entrar',
              onPressed: () => Get.toNamed('/movimentacoes'),
            ),
            SizedBox(height: 30),
            FlatButton(
              onPressed: () => Get.toNamed('/login/cadastro'),
              child: Text(
                'Cadastre-se',
                style: TextStyle(color: ThemeUtils.primaryColor, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
