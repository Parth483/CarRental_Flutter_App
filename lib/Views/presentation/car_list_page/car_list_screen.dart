import 'package:carrental/components/parentwidget/customparentbackground.dart';
import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/components/widgets/car_card.dart';
import 'package:carrental/components/widgets/widgets.dart';
import 'package:carrental/configs/string_constant.dart';
import 'package:carrental/models/Car.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(
      model: 'Fortuner GR',
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
    Car(
      model: 'Fortuner GR',
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
    Car(
      model: 'Fortuner GR',
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
    Car(
      model: 'Fortuner GR',
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(true);
      },
      body: Column(
        children: [
          getDynamicSizedBox(height: 2.h),
          getCenterappbar(title: CarListconst.chooseCar),
          getDynamicSizedBox(height: 2.h),
          Expanded(
            child: ListView.builder(
              // physics: BouncingScrollPhysics(),
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: cars[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
