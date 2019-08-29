import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                        bottomLeft: Radius.elliptical(250, 170),
                        bottomRight: Radius.elliptical(250, 170),
                      ),
                    ),
                    elevation: 10,
                    color: Color(0xFFF6711D),
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Row(),
                          Icon(
                            Icons.account_circle,
                            size: 80,
                          ),
                          SizedBox(height: 20),
                          Text(
                            '100 Leads',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '4860 Reward points',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Transfer to bank',
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFF228164)),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Level 1 Partner',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color(0xCC3100FF),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          SvgPicture.asset(
                            'assets/images/level_1.svg',
                            color: Color(0xFF3100FF),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 10,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          'Name: ',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Souvik Biswas',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/edit_outline.svg',
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          'Gender: ',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'Male',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/edit_outline.svg',
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          'Address: ',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Center(
                            child: Text(
                              '13/B, Eastern Park, Santoshpur, 1st Road, Kolkata -700075',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/images/edit_outline.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          SafeArea(
            child: InkWell(
              splashColor: Colors.black,
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 10,
                ),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
