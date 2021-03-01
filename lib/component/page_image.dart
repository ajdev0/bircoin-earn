import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageImage extends StatelessWidget {
  const PageImage({@required this.imgName});
  final String imgName;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'login',
      child: Container(
        child: SvgPicture.asset(
          'images/$imgName.svg',
          height: 200,
        ),
      ),
    );
  }
}
