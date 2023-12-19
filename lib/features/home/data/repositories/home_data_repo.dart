import 'package:dartz/dartz.dart';
import 'package:slash/features/home/data/models/productModel.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../data_sources/data_source.dart';
class HomeDataRepo implements HomeDomainRepo{
  HomeDataSources homeDataSources;
  HomeDataRepo(this.homeDataSources);

  @override
  Future<Either<Failures, Respone>> getProducts() => homeDataSources.getProducts();


}

