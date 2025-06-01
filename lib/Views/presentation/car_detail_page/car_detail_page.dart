import 'dart:ffi';

import 'package:carrental/Views/presentation/map_detail_page/mapdetailpage.dart';
import 'package:carrental/components/parentwidget/customparentbackground.dart';
import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/components/widgets/car_card.dart';
import 'package:carrental/configs/assets_constant.dart';
import 'package:carrental/configs/colors_constant.dart';
import 'package:carrental/configs/string_constant.dart';
import 'package:carrental/data/models/Car.dart';
import 'package:carrental/components/widgets/more_card.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CarDetailPage extends StatefulWidget {
  final Car car;
  const CarDetailPage({super.key, required this.car});

  @override
  State<CarDetailPage> createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_animationController!)..addListener(() {
      setState(() {});
    });

    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(true);
      },
      body: Column(
        children: [
          getDynamicSizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline),
              getDynamicSizedBox(width: 1.w),
              Text(CarDetailconst.information),
            ],
          ),
          getDynamicSizedBox(height: 2.h),
          CarCard(
            car: Car(
              model: widget.car.model,
              distance: widget.car.distance,
              fuelCapacity: widget.car.fuelCapacity,
              pricePerHour: widget.car.pricePerHour,
            ),
          ),
          getDynamicSizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: greyish,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(Assets.user),
                        ),
                        getDynamicSizedBox(height: 2.h),
                        Text(
                          'Parth Gamit',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('\$4,253', style: TextStyle(color: grey)),
                      ],
                    ),
                  ),
                ),
                getDynamicSizedBox(width: 4.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Mapdetailpage(car: widget.car),
                        ),
                      );
                    },
                    child: Container(
                      height: 22.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        // image: DecorationImage(
                        //   image: AssetImage(Assets.maps),
                        //   fit: BoxFit.cover,
                        // ),
                        boxShadow: [
                          BoxShadow(
                            color: black12,
                            spreadRadius: 5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Transform.scale(
                          scale: _animation!.value,
                          alignment: Alignment.center,
                          child: Image.asset(Assets.maps, fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          getDynamicSizedBox(height: 1.h),
          Container(
            padding: EdgeInsets.all(15),
            // height: 34.h,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoreCard(
                  car: Car(
                    model: '${widget.car.model}-1',
                    distance: widget.car.distance + 100,
                    fuelCapacity: widget.car.fuelCapacity + 100,
                    pricePerHour: widget.car.pricePerHour + 10,
                  ),
                ),
                getDynamicSizedBox(height: 1.h),
                MoreCard(
                  car: Car(
                    model: '${widget.car.model}-2',
                    distance: widget.car.distance + 200,
                    fuelCapacity: widget.car.fuelCapacity + 200,
                    pricePerHour: widget.car.pricePerHour + 20,
                  ),
                ),
                getDynamicSizedBox(height: 1.h),
                MoreCard(
                  car: Car(
                    model: '${widget.car.model}-3',
                    distance: widget.car.distance + 300,
                    fuelCapacity: widget.car.fuelCapacity + 300,
                    pricePerHour: widget.car.pricePerHour + 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
