import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/configs/colors_constant.dart';
import 'package:carrental/configs/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

getCenterappbar({title}) {
  return Center(
    child: Text(
      title,
      style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
    ),
  );
}

getleftsidebackbtn({required backFunction, required title}) {
  return Container(
    height: 10.h,
    decoration: BoxDecoration(color: transparent),
    child: Row(
      children: [
        InkWell(
          onTap: () {
            backFunction();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.arrow_back),
          ),
        ),
        getDynamicSizedBox(width: 1.w),
        Text(title, style: TextStyle(fontSize: 18.sp)),
      ],
    ),
  );
}

Widget featureIcon({
  required IconData icon,
  required String title,
  required String subtitle,
}) {
  return Container(
    width: 28.w,
    height: 12.h,
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: grey, width: 0.5.w),
    ),
    child: Column(
      children: [
        Icon(icon, size: 20.sp),

        Text(title),

        Text(subtitle, style: TextStyle(color: grey, fontSize: 13.sp)),
      ],
    ),
  );
}

Widget carDetailPage(
  context, {
  required model,
  required distacne,
  required fuleCapacity,
  required price,
}) {
  return SizedBox(
    height: 45.h,
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: black38, spreadRadius: 0, blurRadius: 10),
            ],
            color: black54,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getDynamicSizedBox(height: 2.h),
              Text(
                model,
                style: TextStyle(
                  fontSize: 21.sp,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              getDynamicSizedBox(height: 2.h),

              Row(
                children: [
                  Icon(Icons.directions_car, color: white, size: 16.sp),
                  getDynamicSizedBox(width: 1.h),
                  Text(
                    distacne,
                    style: TextStyle(fontSize: 16.sp, color: white),
                  ),
                  getDynamicSizedBox(width: 2.w),
                  Icon(Icons.battery_full, color: white, size: 16.sp),
                  getDynamicSizedBox(width: 1.h),
                  Text(
                    fuleCapacity,
                    style: TextStyle(fontSize: 16.sp, color: white),
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          bottom: 0.h,
          right: 0.w,
          left: 0.w,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MapDetailconst.feature,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    featureIcon(
                      icon: Icons.local_gas_station,
                      title: MapDetailconst.diesel,
                      subtitle: MapDetailconst.commonRail,
                    ),
                    featureIcon(
                      icon: Icons.speed,
                      title: MapDetailconst.acceleration,
                      subtitle: MapDetailconst.kms,
                    ),
                    featureIcon(
                      icon: Icons.ac_unit,
                      title: MapDetailconst.cold,
                      subtitle: MapDetailconst.tempControl,
                    ),
                  ],
                ),
                getDynamicSizedBox(height: 2.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ ${price}/day',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {},

                      style: ElevatedButton.styleFrom(backgroundColor: black),
                      child: Text('Book Now', style: TextStyle(color: white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
