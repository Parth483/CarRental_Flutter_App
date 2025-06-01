import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/configs/colors_constant.dart';
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
