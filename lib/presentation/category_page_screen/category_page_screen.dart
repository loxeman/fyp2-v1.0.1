import 'package:fyp2/Tool/appbar_widgets.dart';
import 'package:fyp2/presentation/search_screen/search_screen.dart';
import 'controller/category_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:fyp2/core/app_export.dart';

class CategoryPageScreen extends GetWidget<CategoryPageController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              leading: const AppBarBackButton(),
              centerTitle: true, backgroundColor: ColorConstant.gray900,
                title: const  AppBarTitle(title: 'Category'),
                actions: [const AppBarHome()],
            ),
            backgroundColor: ColorConstant.gray900,
            body: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              padding: getPadding(left: 10,right: 10),
              children: <Widget>[
                RepeatedTile(label: 'Cleaning'.toUpperCase(), image: ImageConstant.img29298converted, iheight: 98, iwidth: 98),
                RepeatedTile(label: 'Electrician'.toUpperCase(), image: ImageConstant.img40999converted, iheight: 98, iwidth: 70),
                RepeatedTile(label: 'Plumber'.toUpperCase(), image: ImageConstant.img19191converted, iheight: 108, iwidth: 90),
                RepeatedTile(label: 'Mechanic'.toUpperCase(), image: ImageConstant.img17205converted, iheight: 80, iwidth: 114),
                RepeatedTile(label: 'Construction'.toUpperCase(), image: ImageConstant.img51384361, iheight: 98, iwidth: 114),
                RepeatedTile(label: 'Logistic'.toUpperCase(), image: ImageConstant.imgLogisticworkers, iheight: 75, iwidth: 114),
                RepeatedTile(label: 'Cleaning'.toUpperCase(), image: ImageConstant.img29298converted, iheight: 98, iwidth: 98),
                RepeatedTile(label: 'Electrician'.toUpperCase(), image: ImageConstant.img40999converted, iheight: 98, iwidth: 70),
                RepeatedTile(label: 'Plumber'.toUpperCase(), image: ImageConstant.img19191converted, iheight: 108, iwidth: 90),
                RepeatedTile(label: 'Mechanic'.toUpperCase(), image: ImageConstant.img17205converted, iheight: 80, iwidth: 114),
                RepeatedTile(label: 'Construction'.toUpperCase(), image: ImageConstant.img51384361, iheight: 98, iwidth: 114),
                RepeatedTile(label: 'Logistic'.toUpperCase(), image: ImageConstant.imgLogisticworkers, iheight: 75, iwidth: 114)
              ]
              ),
            ),
            );
  }
}

class RepeatedTile extends StatelessWidget {
  final String label;
  final String image;
  final double iheight;
  final double iwidth;
  const RepeatedTile({Key? key, required this.label, required this.image, required this.iheight, required this.iwidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: getMargin(top: 10),
        decoration: AppDecoration.fillWhiteA700
            .copyWith(
            borderRadius: BorderRadiusStyle
                .roundedBorder25),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            mainAxisAlignment:
            MainAxisAlignment.end,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: getPadding(),
                      child:InkWell(
                          onTap: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SearchScreen(availability: '', category: label, location: '',)));},
                          child: CommonImageView(
                          imagePath: image,
                          height: getVerticalSize(
                              iheight),
                          width: getHorizontalSize(
                              iwidth))),
                      )),
              Padding(
                  padding: getPadding(
                      left: 6,
                      top: 6,
                      right: 6,
                      bottom: 6),
                  child: Text(label,
                      overflow:
                      TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: AppStyle
                          .txtRobotoRomanBold14))
            ]));
  }
}
