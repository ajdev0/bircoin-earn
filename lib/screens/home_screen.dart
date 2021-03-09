import 'package:bitcoin_earn/constants.dart';
import 'package:bitcoin_earn/games/wheel_luck/wheel_game.dart';
import 'package:bitcoin_earn/screens/refer_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_screen.dart';
import 'offer_screen.dart';
import 'withdraw_screen.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'Home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _auth = FirebaseAuth.instance;
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    //double t_width = MediaQuery.of(context).size.width * 8.0;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF00917C),
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert_rounded),
            onPressed: () {
              _auth.signOut();
              setState(() {
                Navigator.pushNamed(context, ScreenLogin.id);
              });
            },
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: WheelGame()),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ReferScreen.id);
                },
                child: Card(
                  elevation: 5,
                  color: Color(0xFF313131),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.supervised_user_circle,
                              size: 30,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              //  width: t_width,
                              child: Text(
                                'You can earn more mBTC by referring your friends and up to 30% of their earnings',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Start referring',
                              style: TextStyle(
                                  color: kOrange, fontFamily: 'Paytone'),
                            ),
                            Icon(
                              Icons.send_outlined,
                              color: kOrange,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: kOrangeIcon,
        selectedItemColor: kOrange,
        items: <BottomNavigationBarItem>[
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
