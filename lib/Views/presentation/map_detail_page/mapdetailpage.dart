import 'package:carrental/Views/presentation/car_detail_page/car_detail_page.dart';
import 'package:carrental/components/parentwidget/customparentbackground.dart';
import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/components/widgets/widgets.dart';
import 'package:carrental/configs/colors_constant.dart';
import 'package:carrental/configs/statusbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';

class Mapdetailpage extends StatelessWidget {
  const Mapdetailpage({super.key});

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbar();
    return CustomParentScaffold(
      isExtendedBody: true,
      onWillPop: () {
        return Future.value(true);
      },
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialZoom: 13,
              initialCenter: LatLng(23.0225, 72.5714),
            ),
            children: [
              TileLayer(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
            ],
          ),

          Positioned(
            top: 2.h,
            left: 3.w,
            child: getleftsidebackbtn(
              backFunction: () {
                print('yellow');
              },
              title: '',
            ),
          ),

          Positioned(
            bottom: 0.h,
            left: 0.w,
            right: 0.w,
            child: carDetailPage(),
          ),
        ],
      ),
    );
  }
}

Widget carDetailPage() {
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
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
          child: Column(
            children: [
              getDynamicSizedBox(height: 2.h),
              Text(
                'car.model',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
              getDynamicSizedBox(height: 2.h),

              Row(
                children: [
                  Icon(Icons.directions_car, color: white, size: 20.sp),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
