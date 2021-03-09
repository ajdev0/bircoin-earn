import 'package:bitcoin_earn/animation/FadeAnimation.dart';
import 'package:bitcoin_earn/constants.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_earn/screens/home_screen.dart';
import 'package:bitcoin_earn/screens/refer_screen.dart';
import 'package:bitcoin_earn/screens/withdraw_screen.dart';
import 'package:bitcoin_earn/component/card_list.dart';

class OfferScreen extends StatefulWidget {
  static String id = 'offer';
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  int _selectedItem = 0;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                      child: Column(
                        children: [
                          Text(
                            'Play & Earn',
                            style: kMainTextStyle.copyWith(fontSize: 30),
                            textAlign: TextAlign.center,
                          ),
                          CardList(
                            onTap: () {},
                            label: 'Tic Tac Toe',
                            image: 'tictac.png',
                          ),
                          CardList(
                            onTap: () {},
                            label: 'Memory Game',
                            image: 'memorygame.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: kOrangeIcon,
        selectedItemColor: kOrangeIcon,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.card_giftcard,
              size: 30.0,
            ),
            label: 'offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              size: 30.0,
            ),
            label: 'Refer',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monetization_on,
              size: 30.0,
            ),
            label: 'withdraw',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
          switch (index) {
            case 0:
              Navigator.pushNamed(context, HomeScreen.id);
              break;
            case 1:
              Navigator.pushNamed(context, OfferScreen.id);
              break;
            case 2:
              Navigator.pushNamed(context, ReferScreen.id);
              break;
            case 3:
              Navigator.pushNamed(context, WirhdrawScreen.id);
              break;
          }
        },
        currentIndex: _selectedItem,
      ),
    );
  }
}
