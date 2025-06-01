import 'package:carrental/Views/presentation/car_list_page/car_list_screen.dart';
import 'package:carrental/components/button/form_button.dart';
import 'package:carrental/components/parentwidget/customparentbackground.dart';
import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/configs/assets_constant.dart';
import 'package:carrental/configs/colors_constant.dart';
import 'package:carrental/configs/statusbar.dart';
import 'package:carrental/configs/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key});

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('called onboarding screen');
  }

  @override
  Widget build(BuildContext context) {
    Statusbar().trasparentStatusbar();
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(false);
      },

      body: Container(
        color: Color(0xff2C2B34),
        child: Column(
          children: [
            // Text('hello'),
            Expanded(
              flex: 2,
              child: Container(
                height: 5.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.onboarding),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            getDynamicSizedBox(height: 2.h),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Onboardingconst.primium,
                      style: TextStyle(
                        color: white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    getDynamicSizedBox(height: 2.h),
                    Text(
                      Onboardingconst.rental,
                      style: TextStyle(color: white, fontSize: 16.sp),
                    ),
                    getDynamicSizedBox(height: 2.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 2.w),
                      child: getFormButton(
                        context,
                        () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarListScreen(),
                            ),
                            (route) => false,
                          );
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => CarListScreen(),
                          //   ),
                          // );
                        },
                        Onboardingconst.letsGo,
                        validate: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
