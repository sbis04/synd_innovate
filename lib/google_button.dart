import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:synd_innovate/dashboard_screen.dart';
import 'package:synd_innovate/details_screen.dart';
import 'package:synd_innovate/sign_in.dart';

class GoogleSignInButton extends StatefulWidget {
  final String buttonImage;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  GoogleSignInButton({
    @required this.buttonImage,
    @required this.buttonText,
    @required this.buttonColor,
    @required this.textColor,
  });

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  String _signingIn = 'idle';
  bool _docExists = false;

  Future<bool> ifDocExists() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    DocumentReference documentReferencer =
        documentReference.collection('user_data').document(uid);

    await documentReferencer.get().then((doc) {
      if (doc.exists) {
        _docExists = true;
        prefs.setBool('auth', true);
        authSignedIn = true;
      } else {
        _docExists = false;
      }
    });

    return _docExists;
  }

  Widget _signInButton() {
    switch (_signingIn) {
      case 'idle':
        return Row(
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
        );
        break;
      case 'working':
        return CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
        );
      case 'done':
        return Icon(
          Icons.done,
          size: 30,
          color: Colors.grey,
        );
    }
  }

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
            child: _signInButton(),
            // CircularProgressIndicator(
            //   valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey),
            // )
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: <Widget>[
            //     Image(
            //         image: AssetImage("assets/images/${widget.buttonImage}"),
            //         height: 30.0),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 10),
            //       child: Text(
            //         widget.buttonText,
            //         style: TextStyle(
            //           color: widget.textColor,
            //           fontSize: 15,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
          ),
        ),
        onPressed: () {
          setState(() {
            _signingIn = 'working';
          });
          signInWithGoogle().whenComplete(
            () {
              setState(() {
                _signingIn = 'done';
              });

              ifDocExists().then((success) {
                if (success) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DashboardScreen(),
                    ),
                  );
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(),
                    ),
                  );
                }
              });

              return Container(
                color: Color(0xffFFCD00),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );

              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) {
              //       return FutureBuilder(
              //         future: ifDocExists(),
              //         builder: (_, snapshot) {
              //           // if (snapshot.connectionState ==
              //           //     ConnectionState.waiting) {
              //           //   return Container(
              //           //     color: Color(0xffFFCD00),
              //           //     child: Center(
              //           //       child: CircularProgressIndicator(),
              //           //     ),
              //           //   );
              //           // } else
              //           if (!_docExists) {
              //             return DetailScreen();
              //           } else {
              //             return DashboardScreen();
              //           }
              //         },
              //       );
              //     },
              //   ),
              // );

              // FutureBuilder(
              //   future: ifDocExists(),
              //   builder: (_, snapshot) {
              //     if (_docExists) {
              //     } else {
              //       Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) {
              //             return DetailScreen();
              //           },
              //         ),
              //       );
              //     }
              //   },
              // );
              // Future.delayed(const Duration(milliseconds: 800), () {
              //   if (_docExists) {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return DashboardScreen();
              //         },
              //       ),
              //     );
              //   } else {
              //     Navigator.of(context).push(
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return DetailScreen();
              //         },
              //       ),
              //     );
              //   }
              // });
            },
          ).catchError(
            (e) => SnackBar(
              content: Text('Error Signing In, try again !'),
              backgroundColor: Colors.grey,
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
