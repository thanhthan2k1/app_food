import 'package:app_food/controllers/foodOfStore_controller.dart';
import 'package:app_food/widgets/big_text.dart';
import 'package:app_food/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/icon_and_text_widget.dart';

class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GetBuilder<FoodOfStoreController>(builder: (foodStore){
        return  Container(
          height: ScreenUtil().setHeight(320),
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: ScreenUtil().setHeight(260),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(foodStore.foodsStore.imgUrl!))),
                  )),
              Positioned(
                  top: ScreenUtil().setHeight(20),
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppIcon(
                        icon: Icons.arrow_back,
                        size: ScreenUtil().setHeight(25),
                      ),
                      Row(
                        children: [
                          AppIcon(
                              icon: Icons.favorite, size: ScreenUtil().setHeight(25)),
                          AppIcon(
                              icon: Icons.search, size: ScreenUtil().setHeight(25)),
                        ],
                      )


                    ],
                  )),
              Positioned(
                top: ScreenUtil().setHeight(200),
                left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: ScreenUtil().setHeight(115),
                    margin: EdgeInsets.only(
                        left: ScreenUtil().setWidth(25),
                        right: ScreenUtil().setWidth(25),
                        bottom: ScreenUtil().setHeight(10)),
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(ScreenUtil().radius(15)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFe8e8e8),
                              blurRadius: 5.0,
                              offset: Offset(0, 5)),
                          BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                          BoxShadow(color: Colors.white, offset: Offset(5, 0))
                        ]),
                    child: Container(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(10),
                            left: ScreenUtil().setWidth(10),
                            right: ScreenUtil().setWidth(10)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BigText(
                                text:  foodStore.foodsStore.storeName!,
                                size: ScreenUtil().setSp(13),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(
                                      icon: Icons.location_on,
                                      text: "${(foodStore.foodsStore.distance.toString().substring(0,3))!}km",
                                      iconColor: AppColors.iconColor1),
                                  IconAndTextWidget(
                                      icon: Icons.phone,
                                      text: foodStore.foodsStore.phoneNumber!,
                                      iconColor: AppColors.iconColor1),

                                ],
                              ),
                              IconAndTextWidget(
                                  icon: Icons.home_outlined,
                                  text: foodStore.foodsStore.address.split(",")[0]!,
                                  iconColor: AppColors.iconColor1),


                            ])),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
      GetBuilder<FoodOfStoreController>(builder: (foodsStore){
        return Container(
          margin: EdgeInsets.only(
            left: ScreenUtil().setWidth(10),
            right: ScreenUtil().setWidth(10),
          ),
          height: ScreenUtil().setWidth(60),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColors.borderBottom, width: 2.0),
                top: BorderSide(color: AppColors.borderBottom, width: 2.0)),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconAndTextWidget(
                    icon: Icons.star,
                    text: "${foodsStore.foodsStore.star.toString()!}(${foodsStore.foodsStore.numOfReview.toString()!})",
                    iconColor: Color(0xFFFF8357)),
                IconAndTextWidget(
                    icon: Icons.shopping_bag,
                    text: foodsStore.foodsStore.numOfOrder.toString()!+" đã bán",
                    iconColor: Color(0xFFFF8357)),
                SmallText(
                  text: "Xem đánh giá",
                  color: Color(0xFF89D5C9),
                  size: ScreenUtil().setSp(8),
                )
              ],
            ),
          ),
        );
      }),
      GetBuilder<FoodOfStoreController>(builder: (foodsStore){
        return  Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: foodsStore.foodOfStoreList.isEmpty?0:foodsStore.foodOfStoreList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(10),
                          right: ScreenUtil().setWidth(10),
                          bottom: ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColors.borderBottom, width: 2.0))),
                      child: Row(
                        children: [
                          //image section
                          //text container
                          Expanded(
                            child: Container(
                              height: ScreenUtil().setWidth(98),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(ScreenUtil().radius(15)),
                                  bottomRight:
                                  Radius.circular(ScreenUtil().radius(15)),
                                ),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(10),
                                    right: ScreenUtil().setWidth(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SmallText(
                                        text: foodsStore.foodOfStoreList[index].foodName!,
                                        size: ScreenUtil().setSp(10),
                                        color: AppColors.mainBlackColor),
                                    SizedBox(height: ScreenUtil().setHeight(20)),
                                    BigText(
                                      text: "${foodsStore.foodOfStoreList[index].price.toString()!}đ",
                                      color: AppColors.mainBlackColor,
                                      size: ScreenUtil().setSp(10),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(80),
                            height: ScreenUtil().setHeight(80),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(ScreenUtil().radius(10)),
                                color: Colors.white38,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(foodsStore.foodOfStoreList[index].imageUrl!))),
                          ),
                        ],
                      ),
                    );
                  }),
            ));
      }),

    ]);
  }
}
