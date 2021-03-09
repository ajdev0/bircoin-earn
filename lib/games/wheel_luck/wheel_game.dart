import 'dart:math';

import 'package:flutter/material.dart';

import '../../constants.dart';
import 'board_view.dart';
import 'luck.dart';

class WheelGame extends StatefulWidget {
  @override
  _WheelGameState createState() => _WheelGameState();
}

class _WheelGameState extends State<WheelGame>
    with SingleTickerProviderStateMixin {
  double _angle = 0;
  double _current = 0;
  AnimationController _ctrl;
  Animation _ani;
  List<Luck> _items = [
    Luck(1000, Colors.accents[0]),
    Luck(3000, Colors.accents[2]),
    Luck(30, Colors.accents[4]),
    Luck(500, Colors.accents[6]),
    Luck(399, Colors.accents[8]),
    Luck(0, Colors.accents[10]),
    Luck(200, Colors.accents[12]),
    Luck(30000, Colors.accents[14]),
    Luck(30000, kOrange),
  ];

  Size get size => Size(MediaQuery.of(context).size.width * 1.0,
      MediaQuery.of(context).size.width * 1.1);
  @override
  void initState() {
    super.initState();
    var _duration = Duration(milliseconds: 5000);
    _ctrl = AnimationController(duration: _duration, vsync: this);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(180.0),
              bottomRight: Radius.circular(180.0)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF00917C), Color(0xFF00917C).withOpacity(0.4)])),
      child: AnimatedBuilder(
          animation: _ani,
          builder: (context, child) {
            final _value = _ani.value;
            final _angle = _value * this._angle;
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                BoardView(items: _items, current: _current, angle: _angle),
                _buildGo(),
                _buildResult(_value),
              ],
            );
          }),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: CircleBorder(),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: Text(
            "Spin",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: _animation,
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
      });
    }
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);

    return (((_base + value) % 1) * _items.length).floor();
  }

  _buildResult(_value) {
    var _index = _calIndex(_value * _angle + _current);
    int sum = 0;
    sum = Random().nextInt(100);
    print(sum);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          '$_index',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
