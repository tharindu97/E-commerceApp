import 'package:ecommece/constants.dart';
import 'package:ecommece/screen/login.page.dart';
import 'package:ecommece/widgets/custom.btn.dart';
import 'package:ecommece/widgets/custom.input.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                child: Text('Create A New Account',
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
                    text: 'Create Account',
                    onPressed: () {
                      print(' to Account');
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0
                ),
                child: CustomBtn(
                  text: 'Back To Login',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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