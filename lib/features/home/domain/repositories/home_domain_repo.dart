import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/product.dart';

abstract class HomeDomainRepo{

  Future <Either<Failures, Respone>>getProducts();

}