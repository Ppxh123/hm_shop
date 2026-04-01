import 'package:flutter/material.dart';

class HmSlider extends StatefulWidget {
  HmSlider({Key? key}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<HmSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 200,
        alignment: Alignment.center,
        color: Colors.blue,
        child: Text("轮播图", style: TextStyle(color: Colors.white, fontSize: 20)),
      ),
    );
  }
}