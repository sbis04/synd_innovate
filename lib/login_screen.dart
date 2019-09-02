import 'package:flutter/material.dart';
import 'package:synd_innovate/sign_in_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Color(0xffFFCD00),
          ),
        ),
        SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 15,
                  left: 15,
                ),
                child: Image.asset('assets/images/logo.png'),
              ),
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                color: Colors.white70,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25),
                      SignInButton(
                        buttonImage: 'google_logo.png',
                        buttonText: 'Sign in with Google',
                        buttonColor: Colors.white,
                        textColor: Colors.grey,
                      ),
                      SizedBox(height: 25),
                      SignInButton(
                        buttonImage: 'face_logo.png',
                        buttonText: 'Login in with Facebook',
                        buttonColor: Color(0xff3A559F),
                        textColor: Colors.white,
                      ),
                      SizedBox(height: 25),
                      SignInButton(
                        buttonImage: 'linkedin_logo.png',
                        buttonText: 'Sign in with LinkedIn',
                        buttonColor: Color(0xff007AB9),
                        textColor: Colors.white,
                      ),
                      SizedBox(height: 25),
                      FlatButton(
                        child: Text('Sign in using OTP'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
