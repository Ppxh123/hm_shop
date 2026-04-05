import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HmSlider extends StatefulWidget {
  final List<BannerItem> bannerList;
  HmSlider({Key? key, required this.bannerList}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<HmSlider> {
  final CarouselSliderController _carouselController = CarouselSliderController();  // 轮播图控制器
  int _currentIndex = 0;  // 当前索引
   @override
  // 获取轮播图组件
  Widget _getSlider(){
    // 获取屏幕宽度
    final double screenWidth = MediaQuery.of(context).size.width; // 屏幕宽度

    return CarouselSlider(
      carouselController: _carouselController, 
      items: List.generate(widget.bannerList.length,(int index){
        return Image.network(
          widget.bannerList[index].imgurl,
          fit: BoxFit.cover,        // 图片等比例缩放，填充容器
          width: screenWidth,      // 图片宽度为屏幕宽度
        );
      }), 
      options: CarouselOptions(
        viewportFraction: 1.0,  // 视口分数为1，即显示整张图片
        autoPlay: true,        // 自动播放
        autoPlayInterval: Duration(seconds: 4), // 自动播放间隔为4秒
        onPageChanged: (int index, reason){
          setState(() {
            _currentIndex = index;
          });
        }
      )
    );
  }

  // 获取搜索框组件
  Widget _getSearch(){
    return Positioned(
      top: 10,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 30),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            "搜索...",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  // 获取指示器组件
  Widget _getDots(){
    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(widget.bannerList.length,(int index){
          return GestureDetector(
            onTap: (){
              _carouselController.animateToPage(index, curve: Curves.easeInOut, duration: Duration(milliseconds: 300));
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: _currentIndex == index ? 70 : 40,
              height: 7,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: _currentIndex == index ? Colors.white : Colors.grey,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        }),
      ),
    );
  }
  Widget build(BuildContext context) {
    return Stack(
      children:[_getSlider(),_getSearch(),_getDots()]
    );
  }
}