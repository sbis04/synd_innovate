import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LeadGeneration extends StatelessWidget {
  final String productName;
  LeadGeneration(this.productName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFCD00),
        elevation: 0,
      ),
      body: Stack(
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
                Text(
                  productName.toUpperCase(),
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.deepOrange[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                QrImage(
                  data: productName + ': 3yurlKNBNRgVZ2bl5zeFH8e5jKW2',
                  version: QrVersions.auto,
                  padding: EdgeInsets.all(10),
                  size: 250,
                ),
                Text(
                  'Scan this QR code to refer',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'SHARE',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  color: Colors.orange,
                  onPressed: () {},
                ),
                SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
