import 'package:carrental/Views/presentation/Injuction_container/injuction_container.dart';
import 'package:carrental/bloc/Car/car_bloc.dart';
import 'package:carrental/bloc/Car/car_event.dart';
import 'package:carrental/bloc/Car/car_state.dart';
import 'package:carrental/components/parentwidget/customparentbackground.dart';
import 'package:carrental/components/toolbar.dart/toolbar.dart';
import 'package:carrental/components/widgets/car_card.dart';
import 'package:carrental/components/widgets/widgets.dart';
import 'package:carrental/configs/string_constant.dart';
import 'package:carrental/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CarListScreen extends StatelessWidget {
  // final List<Car> car = cars;

  @override
  Widget build(BuildContext context) {
    return CustomParentScaffold(
      onWillPop: () {
        return Future.value(false);
      },
      body: BlocProvider(
        create: (_) => getIt<CarBloc>()..add(LoadCars()),

        child: Column(
          children: [
            getDynamicSizedBox(height: 2.h),
            getCenterappbar(title: CarListconst.chooseCar),
            getDynamicSizedBox(height: 2.h),
            Expanded(
              child: BlocBuilder<CarBloc, CarState>(
                builder: (context, state) {
                  if (state is CarsLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CarsLoaded) {
                    return ListView.builder(
                      // physics: BouncingScrollPhysics(),
                      itemCount: state.cars.length,
                      itemBuilder: (context, index) {
                        return CarCard(car: state.cars[index]);
                      },
                    );
                  } else if (state is CarsError) {
                    return Text(state.message);
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
