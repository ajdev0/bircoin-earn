import 'package:bitcoin_earn/animation/FadeAnimation.dart';
import 'package:bitcoin_earn/component/page_image.dart';
import 'package:bitcoin_earn/constants.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  MainLayout({@required this.child, this.imageName});
  final Widget child;
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_alert),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      //backgroundColor: kOrangeBackground,
      body: Container(
        width: double.infinity,
        color: kOrangeBackground,
        child: Column(
          children: [
            PageImage(
              imgName: imageName,
            ),
            Expanded(
              flex: 4,
              child: FadeAnimation(
                child: Container(
                  // height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(80.0),
                        topLeft: Radius.circular(80.0)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: SingleChildScrollView(
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
