import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/core/assets_manager.dart';
import 'package:news_app_c12_online_sat/core/colors_manager.dart';
import 'package:news_app_c12_online_sat/data_model/category_DM.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/home_drawer/home_drawer.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/categories/categories.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/category_details/category_details.dart';
import 'package:news_app_c12_online_sat/presentation/screens/home/tabs/settings/settings.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    late Widget selectedWidget = Categories(onCategoryClicked: onCategoryClicked) ;
String appBarTitle = 'News App';
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: ColorsManager.white,
          image: DecorationImage(image: AssetImage(AssetsManager.bgPattern))),
      child: Scaffold(
          appBar: AppBar(
            title:  Text(appBarTitle),
          ),
          drawer: HomeDrawer(
            onMenuItemClicked: onDrawerItemClick,
          ),
          body: selectedWidget),
    );
  }

  void onCategoryClicked(CategoryDM categoryDM){
    selectedWidget = CategoryDetails(categoryDM: categoryDM,);
    appBarTitle = categoryDM.title;
    setState(() {

    });
  }

  void onDrawerItemClick(MenuItem item) {
    Navigator.pop(context);
    if (item == MenuItem.categories) {
      selectedWidget = Categories(onCategoryClicked: onCategoryClicked,);
    } else if (item == MenuItem.settings) {
      selectedWidget = Settings();
    }
    setState(() {});
  }
}
