import 'package:flutter/material.dart';

class LeadDetail extends StatelessWidget {
  final String userImageUrl;
  final int leads;
  final int rewardPoints;

  LeadDetail(this.userImageUrl, this.leads, this.rewardPoints);
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
            child: Align(
              alignment: Alignment.topCenter,
              child: Card(
                margin: EdgeInsets.all(0),
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.elliptical(250, 170),
                //     bottomRight: Radius.elliptical(250, 170),
                //   ),
                // ),
                elevation: 10,
                color: Color(0xFFF6711D),
                child: SafeArea(
                  child: Column(
                    children: <Widget>[
                      Row(),
                      SizedBox(height: 20),
                      Stack(
                        children: <Widget>[
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.transparent,
                            child: Icon(Icons.account_circle, size: 50),
                          ),
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                              userImageUrl,
                            ),
                            radius: 50,
                            backgroundColor: Colors.transparent,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        '$leads Leads',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '$rewardPoints Reward points',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: Divider(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'CREDIT CARD',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(),
                            Text(
                              'Leads: 278',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              'Reward Points: 12800',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'INSURANCE POLICY',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(),
                            Text(
                              'Leads: 221',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              'Reward Points: 10700',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'PERSONAL LOAN',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50.0, top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(),
                            Text(
                              'Leads: 198',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                            Text(
                              'Reward Points: 9800',
                              style: TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
