import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

getappbar({title}) {
  return Center(
    child: Text(
      title,
      style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
    ),
  );
}
