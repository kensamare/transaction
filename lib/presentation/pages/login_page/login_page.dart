import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transaction/presentation/pages/login_page/widgets/login_test_field.dart';
import 'package:transaction/presentation/widgets/pj_button.dart';

const String login = 'test';

const String pass = 'test';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('TransactionAPP', style: TextStyle(
                    fontSize: 30.w,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 40.h,),
                  LoginTextField(controller: _loginController, hint: 'Введите логин', validator: (val) => val!.isEmpty
                    ? 'Поле не может быть пустым'
                    : null,),
                  SizedBox(height: 20.h,),
                  LoginTextField(controller: _passwordController, hint: 'Введите пароль', validator: (val) {
                    if (val?.isEmpty == true) {
                      return 'Поле не может быть пустым';
                    } else if (val != pass || _loginController.text != login) {
                      return 'Неверный логин/пароль';
                    }
                    return '';
                  }),
                  SizedBox(height: 40.h,),
                  PjButton(
                    text: 'Вход',
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                        FocusScope.of(context).unfocus();
                      }
                    },
                  ),
                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}
