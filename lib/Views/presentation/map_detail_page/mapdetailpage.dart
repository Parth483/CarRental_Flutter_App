import 'package:carrental/components/parentwidget/customparentbackground.dart';
import 'package:carrental/components/widgets/widgets.dart';
import 'package:carrental/configs/assets_constant.dart';
import 'package:carrental/configs/statusbar.dart';
import 'package:carrental/data/models/Car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sizer/sizer.dart';

class Mapdetailpage extends StatelessWidget {
  final Car car;
  const Mapdetailpage({super.key, required this.car});

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
                urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
              ),
            ],
          ),

          Positioned(
            top: 2.h,
            left: 3.w,
            child: getleftsidebackbtn(
              backFunction: () {
                Navigator.pop(context);
              },
              title: '',
            ),
          ),

          Positioned(
            bottom: 0.h,
            left: 0.w,
            right: 0.w,
            child: carDetailPage(
              context,
              model: car.model,
              distacne: '> ${car.distance} km',
              fuleCapacity: car.fuelCapacity.toString(),
              price: car.pricePerHour,
            ),
          ),

         
        ],
      ),
    );
  }
}
