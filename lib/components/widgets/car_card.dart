import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/configs/assets_constant.dart';
import 'package:carrental/configs/colors_constant.dart';
import 'package:carrental/models/Car.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final Function function;
  const CarCard({super.key, required this.car, required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: carCardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: black12, blurRadius: 10, spreadRadius: 5),
          ],
        ),

        child: Column(
          children: [
            Image.asset(Assets.car),
            Text(
              car.model,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
            getDynamicSizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(Assets.gps),
                        Text('${car.distance.toStringAsFixed(0)}km'),
                      ],
                    ),
                    getDynamicSizedBox(width: 2.w),
                    Row(
                      children: [
                        Image.asset(Assets.pump),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L'),
                      ],
                    ),
                  ],
                ),

                Text(
                  '\$${car.pricePerHour.toStringAsFixed(2)}/hr',
                  style: TextStyle(fontSize: 15.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
