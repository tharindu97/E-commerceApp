import 'package:ecommece/constants.dart';
import 'package:ecommece/screen/register.page.dart';
import 'package:ecommece/widgets/custom.btn.dart';
import 'package:ecommece/widgets/custom.input.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: 24.0),
                child: Text('Welocome User, \nLogin to your account',
                  style: Constants.boldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              Column(
                children: [
                  CustomInput(
                    hintText: 'Email...',
                  ),
                  CustomInput(
                    hintText: 'Password...',
                  ),
                  CustomBtn(
                    text: 'Login',
                    onPressed: () {
                      print('Login to Account');
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0
                ),
                child: CustomBtn(
                  text: 'Create New Account',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                  outlineBtn: true,
                ),
              )

            ],
          ),
        )
      ),
    );
  }
}
