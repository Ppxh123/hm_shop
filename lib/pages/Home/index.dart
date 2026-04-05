import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/category.dart';
import 'package:hm_shop/components/Home/hot.dart';
import 'package:hm_shop/components/Home/slider.dart';
import 'package:hm_shop/components/Home/suggestion.dart';
import 'package:hm_shop/components/Home/moreList.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _bannerList = [
    BannerItem(id: "1", imgurl:"https://images.unsplash.com/photo-1669909981138-ddba075a1b79?q=80&w=1828&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
    BannerItem(id: "2", imgurl: "https://images.unsplash.com/photo-1773672726538-885c0d878033?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDMwfENEd3V3WEpBYkV3fHxlbnwwfHx8fHw%3D"),
    BannerItem(id: "3", imgurl: "https://images.unsplash.com/photo-1742712608977-4f47f57c6093?q=80&w=1450&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
  ];

  // 获取滚动容器的组件
  List<Widget> _gerScrollChildrern(){
    return [
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),  // 轮播图
      SliverToBoxAdapter(child: SizedBox(height: 10)),  // 分隔线
      SliverToBoxAdapter(child: Category()),  // 分类
      SliverToBoxAdapter(child: SizedBox(height: 10)),  // 分隔线
      SliverToBoxAdapter(child: Suggestion()), //推荐
      SliverToBoxAdapter(child: SizedBox(height: 10)),  // 分隔线
      SliverToBoxAdapter(child: Padding(                // 热门
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: Hot()),
          SizedBox(width: 10),
          Expanded(child: Hot()),
        ],
      ))),
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      SliverPadding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        sliver: MoreList()), // 更多
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers:_gerScrollChildrern());
  }
}