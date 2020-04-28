import 'package:dart_week_app/app/core/store_state.dart';
import 'package:dart_week_app/app/mixins/loader_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dart_week_app/app/components/custom_button_form.dart';
import 'package:dart_week_app/app/components/custom_text_form_field.dart';
import 'package:dart_week_app/app/utils/size_utils.dart';
import 'package:dart_week_app/app/utils/theme_utils.dart';
import 'package:get/get.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> with LoaderMixin{
  List<ReactionDisposer> _disposer;

  @override
  void initState() {
    super.initState();
    _disposer ??= [
      reaction((_) => controller.state, (StoreState state) {
        if (state == StoreState.loading) {
          showLoader();
        } else if (state == StoreState.loaded) {
          hideLoader();
        }
      }),
      reaction((_) => controller.loginSuccess, (success) {
        if (success != null) {
          if (success) {
            Get.toNamed('/movimentacoes');
          } else {
            Get.snackbar('Erro ao realizar login', 'Login ou senha inválidos',
                backgroundColor: Colors.white);
          }
        }
      }),
      reaction((_) => controller.errorMessage, (String errorMessage) {
        if (errorMessage.isNotEmpty) {
          hideLoader();
          Get.snackbar('Erro ao realizar login', errorMessage,
              backgroundColor: Colors.white);
        }
      }),
    ];
  }

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
      key: controller.globalKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            CustomTextFormField(
              label: 'Login',
              icon: Icons.lock,
              onChanged: (String valor) => controller.changeLogin(valor),
              validator: (String valor) {
                if (valor.isEmpty) {
                  return 'Login Obrigatório';
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            CustomTextFormField(
              label: 'Senha',
              icon: Icons.fingerprint,
              obscureText: true,
              onChanged: (String valor) => controller.changeSenha(valor),
              validator: (String valor) {
                if (valor.isEmpty) {
                  return 'Senha Obrigatória';
                }
                return null;
              },
            ),
            SizedBox(height: 30),
            CustomButtonForm(
              label: 'Entrar',
              onPressed: () => controller.requestLogin(),
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
