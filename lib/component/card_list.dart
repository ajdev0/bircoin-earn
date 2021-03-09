import 'package:flutter/material.dart';
import 'package:bitcoin_earn/constants.dart';


class CardList extends StatelessWidget {
  const CardList({@required this.onTap, this.image, this.label});
  final Function onTap;
  final String image;
  final String label;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xFFDFF3E3),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Row(
            children: [
              Image(
                image: AssetImage('images/$image'),
                width: 85,
              ),
              SizedBox(
                width: 18,
              ),
              Text(
                label,
                style: kMainTextStyle.copyWith(color: kBlack, fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
