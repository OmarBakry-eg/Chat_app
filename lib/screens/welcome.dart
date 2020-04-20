import 'package:flutter/material.dart';
import '../reusable.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constant.dart';
import 'signup.dart';
import 'login.dart';

class WelcomePage extends StatelessWidget {
  static const id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: (MediaQuery.of(context).size.height - 10) * 0.5,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: welcomeGradient,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
              ),
            ),
            child: Center(
              child: Text(
                'Chating App',
                style: chatText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CarouselSlider(
                    items: [
                      ReusableCodeInWelcomeScreen(
                        iconData: Icons.touch_app,
                      ),
                      ReusableCodeInWelcomeScreen(
                        iconData: Icons.border_color,
                      ),
                      ReusableCodeInWelcomeScreen(
                        iconData: Icons.settings,
                      ),
                    ],
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    viewportFraction: 0.8,
                    pauseAutoPlayOnTouch: Duration(seconds: 2),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpPage.id);
                    },
                    child: ReusableContainerSignUpCode(
                      text: 'SIGN UP',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, LoginPage.id);
                    },
                    child: ReusableLoginContainerCode(
                      text: 'LOGIN',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
