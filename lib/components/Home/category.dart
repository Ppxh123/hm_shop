import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context,int index){
            return Container(
              height: 100,
              width: 80,
              alignment: Alignment.center,
              color: Colors.blue,
              margin: EdgeInsets.only(right: 10),
              child: Text("分类$index", style: TextStyle(color: Colors.white, fontSize: 20)),
            );
          },
        ),
      ),
    );
  }
}