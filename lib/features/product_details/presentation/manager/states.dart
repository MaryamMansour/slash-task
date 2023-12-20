import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/productDetails.dart';

abstract class ProductDetailsState {}

class ProductDetailsInit extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
ProductDetails product;

  ProductDetailsLoaded(this.product);
}

class ProductDetailsError extends ProductDetailsState {
  Failures failures;

  ProductDetailsError(this.failures);
}
