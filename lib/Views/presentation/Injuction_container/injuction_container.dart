import 'package:carrental/bloc/Car/car_bloc.dart';
import 'package:carrental/data/datasources/firebase_car_data_source.dart';
import 'package:carrental/data/repositories/car_repository_impl.dart';
import 'package:carrental/domain/repositories/car_repository.dart';
import 'package:carrental/domain/usecases/get_cars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection() {
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );
    getIt.registerLazySingleton<FirebaseCarDataSource>(
      () => FirebaseCarDataSource(firestore: getIt<FirebaseFirestore>()),
    );
    getIt.registerLazySingleton<CarRepository>(
      () => CarRepositoryImpl(getIt<FirebaseCarDataSource>()),
    );

    getIt.registerLazySingleton<GetCars>(() => GetCars(getIt<CarRepository>()));

    getIt.registerFactory(() => CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    throw e;
  }
}
