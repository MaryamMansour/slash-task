import 'package:slash/features/home/domain/entities/product.dart';

import '../../../../core/error/failures.dart';

abstract class HomeStates {}

class HomeInitState extends HomeStates {}

class HomeLoadingState extends HomeStates {}

class HomeGetProductsSuccessState extends HomeStates {
  Respone model;

  HomeGetProductsSuccessState(this.model);
}

class HomeGetProductsErrorState extends HomeStates {
  Failures failures;

  HomeGetProductsErrorState(this.failures);
}
