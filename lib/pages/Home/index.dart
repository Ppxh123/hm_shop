import 'package:flutter/material.dart';
import 'package:hm_shop/components/Home/category.dart';
import 'package:hm_shop/components/Home/hot.dart';
import 'package:hm_shop/components/Home/slider.dart';
import 'package:hm_shop/components/Home/suggestion.dart';
import 'package:hm_shop/components/Home/moreList.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // 获取滚动容器的组件
  List<Widget> _gerScrollChildrern(){
    return [
      SliverToBoxAdapter(child: HmSlider()),  // 轮播图
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