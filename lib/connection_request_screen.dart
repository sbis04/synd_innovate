import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ConnectionRequestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xffFFCD00),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 200,
                child: FlareActor(
                  "assets/images/no_connection_1.flr",
                  alignment: Alignment.center,
                  animation: "no_connection",
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "NO CONNECTION",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
