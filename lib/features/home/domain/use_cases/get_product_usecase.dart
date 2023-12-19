import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/product.dart';
import '../repositories/home_domain_repo.dart';

class GetProductsUseCase {
  HomeDomainRepo homeDomainRepo;

  GetProductsUseCase(this.homeDomainRepo);

  Future<Either<Failures, Respone>> call() =>
      homeDomainRepo.getProducts();
}