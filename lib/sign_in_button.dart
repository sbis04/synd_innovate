import 'package:flutter/material.dart';
import 'package:synd_innovate/dashboard_screen.dart';
import 'package:synd_innovate/sign_in.dart';

class SignInButton extends StatefulWidget {
  final String buttonImage;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  SignInButton({
    @required this.buttonImage,
    @required this.buttonText,
    @required this.buttonColor,
    @required this.textColor,
  });

  @override
  _SignInButtonState createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: widget.buttonColor,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                    image: AssetImage("assets/images/${widget.buttonImage}"),
                    height: 30.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.buttonText,
                    style: TextStyle(
                      color: widget.textColor,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onPressed: () {
          signInWithGoogle().whenComplete(
            () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return DashboardScreen();
                  },
                ),
              );
              // setState(() {
              //   _signingIn = 'done';
              // });
              // Future.delayed(
              //   const Duration(milliseconds: 800),
              //   () => Navigator.of(context).pushNamed('/name'),
              // );
            },
          ).catchError(
            (e) => SnackBar(
              content: Text('Error Signing In, try again !'),
              backgroundColor: Colors.purple,
              duration: Duration(seconds: 20),
            ),
          );
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) {
          //       return DashboardScreen();
          //     },
          //   ),
          // );
        },
      ),
    );
  }
}
