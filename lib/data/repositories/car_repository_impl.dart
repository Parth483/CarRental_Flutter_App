import 'package:carrental/data/datasources/firebase_car_data_source.dart';
import 'package:carrental/data/models/Car.dart';
import 'package:carrental/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDataSource dataSource;

  CarRepositoryImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}
