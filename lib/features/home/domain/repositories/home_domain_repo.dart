import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/product.dart';
import '../entities/productDetails.dart';

abstract class HomeDomainRepo{

  Future <Either<Failures, Respone>>getProducts();
  Future <Either<Failures, ProductDetails>>getProductDetails(String productId);

}