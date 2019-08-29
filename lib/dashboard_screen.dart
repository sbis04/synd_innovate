import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardScreen extends StatelessWidget {
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
        Column(
          children: <Widget>[
            Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30))),
                  elevation: 10,
                  color: Color(0xffFFCD00),
                  child: SafeArea(
                    child: CarouselSlider(
                      viewportFraction: 1.0,
                      height: 200,
                      items: <Widget>[
                        Image.asset('assets/images/synd_disc.png'),
                        Image.asset('assets/images/synd_disc.png'),
                        Image.asset('assets/images/synd_disc.png'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
