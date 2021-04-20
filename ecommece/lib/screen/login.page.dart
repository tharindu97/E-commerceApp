import 'package:ecommece/constants.dart';
import 'package:ecommece/screen/register.page.dart';
import 'package:ecommece/widgets/custom.btn.dart';
import 'package:ecommece/widgets/custom.input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  // build an Alert Dialog to display some errors.
  Future<void> _alertDialogBuilder(String error) async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close Dialog'))
            ],
          );
        });
  }

  // Login a new user account
  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm()  async {
    // Set the form to loading
    setState(() {
      _loginFormLoading = true;
    });
    // Run the login account method 
    String _loginAccountFeedback = await _loginAccount();

    //  If the String is not null, we got error while create account.
    if(_loginAccountFeedback != null){
      _alertDialogBuilder(_loginAccountFeedback);
      // Set the form to regular state [not loading]
      setState(() {
        _loginFormLoading = false;
      });
    }
  }

  // Default Form Loading State
  bool _loginFormLoading = false;

  //  Form Input Field Values
  String _loginEmail = "";
  String _loginPassword = "";

  // Focus Node for input fields
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  

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
              child: Text(
                'Welocome User, \nLogin to your account',
                style: Constants.boldHeading,
                textAlign: TextAlign.center,
              ),
            ),
            Column(
              children: [
                CustomInput(
                  hintText: 'Email...',
                  onChanged: (value) {
                    _loginEmail = value;
                  },
                  onSubmitted: (value) {
                    _passwordFocusNode.requestFocus();
                  },
                  textInputAction: TextInputAction.next,

                ),
                CustomInput(
                  hintText: 'Password...',
                  onChanged: (value) {
                    _loginPassword = value;
                  },
                  focusNode: _passwordFocusNode,
                  isPasswordField: true,
                  onSubmitted: (value){
                    _submitForm();
                  },
                ),
                CustomBtn(
                  text: 'Login',
                  onPressed: () {
                    _submitForm();
                  },
                  isLoading: _loginFormLoading,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: CustomBtn(
                text: 'Create New Account',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                outlineBtn: true,
              ),
            )
          ],
        ),
      )),
    );
  }
}
