import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/configs/colors_constant.dart';
import 'package:carrental/data/models/Car.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MoreCard extends StatelessWidget {
  final Car car;
  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: blackcard,

        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(color: black54, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: TextStyle(
                  color: white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              getDynamicSizedBox(height: 1.h),

              Row(
                children: [
                  Icon(Icons.directions_car, color: white, size: 15.sp),

                  getDynamicSizedBox(height: 1.w),
                  Text(
                    '> ${car.distance} km',
                    style: TextStyle(color: white, fontSize: 15.sp),
                  ),
                  getDynamicSizedBox(height: 2.w),
                  Icon(Icons.battery_full, color: white, size: 15.sp),
                  getDynamicSizedBox(height: 1.w),
                  Text(
                    car.fuelCapacity.toString(),
                    style: TextStyle(color: white, fontSize: 15.sp),
                  ),
                ],
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios, color: white, size: 18.sp),
        ],
      ),
    );
  }
}
