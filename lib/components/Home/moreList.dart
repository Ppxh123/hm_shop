import 'package:flutter/material.dart';

class MoreList extends StatefulWidget {
  MoreList({Key? key}) : super(key: key);

  @override
  _MoreListState createState() => _MoreListState();
}

class _MoreListState extends State<MoreList> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context,index){
        return Container(
          height: 100,
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text("爆款推荐$index",style: TextStyle(color: Colors.white,fontSize: 20))
        );
      },
    );
  }
}