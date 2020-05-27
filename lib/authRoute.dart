import 'package:auth_demo/AuthEventBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:auth_demo/AuthBloc.dart';
import 'package:auth_demo/AuthStateBloc.dart';


class AuthPage extends StatelessWidget{

  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final loginController = TextEditingController();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final loginField = TextField(
          obscureText: false,
          style: style,
          controller: loginController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Логин",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final passwordField = TextField(
          obscureText: true,
          style: style,
          controller: passwordController,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              hintText: "Пароль",
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
        );
        final loginButon = Material(
          elevation: 5.0,
          borderRadius: BorderRadius.circular(30.0),
          color: Color(0xff01A0C7),
          child: MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(AuthLogin(loginController.text, passwordController.text));
            },
            child: Text("Войти",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        );

        final loginView = Scaffold(
          body: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/logo.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    loginField,
                    SizedBox(height: 25.0),
                    passwordField,
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthError)
                          return Text("Ошибка входа!", style: TextStyle(color: Colors.red, fontSize: 24));
                        else
                          return SizedBox(
                            height: 35.0,
                          );
                      },
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );

        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state){
            if (state is AuthSuccessful)
              return Center(
                child: Text("OK"),
              );
            else
              return loginView;
          }
        );
  }

}