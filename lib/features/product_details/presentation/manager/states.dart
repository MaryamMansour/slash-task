import '../../../../core/error/failures.dart';
import '../../../home/domain/entities/productDetails.dart';

abstract class ProductDetailsState {}

class ProductDetailsInit extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final int? price;
  final List<ProductVarientImages2>? img;
  final ProductDetails product;

  ProductDetailsLoaded(this.price, this.img, this.product);
}
class ProductDetailsLoaded2 extends ProductDetailsState {
  final int? price;
  final List<ProductVarientImages2>? img;
  final ProductDetails product;

  ProductDetailsLoaded2(this.price, this.img, this.product);
}


class ProductDetailsError extends ProductDetailsState {
  final Failures failures;

  ProductDetailsError(this.failures);
}
