import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFFFCD00),
            ),
          ),
          Container(
            width: 140,
            decoration: BoxDecoration(
              color: Color(0xFFFF9D00),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(250, 150),
                        bottomRight: Radius.elliptical(250, 150),
                      ),
                    ),
                    elevation: 10,
                    color: Color(0xFFF6711D),
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Row(),
                          Icon(Icons.account_circle),
                          Text('100 Leads'),
                          Text('4860 Reward points'),
                          Text('Transfer to bank'),
                          Text('Level 1 Partner'),
                          SizedBox(
                            height: 300,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
