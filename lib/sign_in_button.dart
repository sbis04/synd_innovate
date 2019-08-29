import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: buttonColor,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image(
                    image: AssetImage("assets/images/$buttonImage"),
                    height: 30.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
