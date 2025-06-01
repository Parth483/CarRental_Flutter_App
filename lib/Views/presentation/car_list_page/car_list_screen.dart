import 'package:carrental/components/parentwidget/customparentbackground.dart';
import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/components/widgets/car_card.dart';
import 'package:carrental/components/widgets/widgets.dart';
import 'package:carrental/configs/string_constant.dart';
import 'package:carrental/data/data.dart';
import 'package:carrental/data/models/Car.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> car = cars;

  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(false);
      },
      body: Column(
        children: [
          getDynamicSizedBox(height: 2.h),
          getCenterappbar(title: CarListconst.chooseCar),
          getDynamicSizedBox(height: 2.h),
          Expanded(
            child: ListView.builder(
              // physics: BouncingScrollPhysics(),
              itemCount: car.length,
              itemBuilder: (context, index) {
                return CarCard(car: car[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
