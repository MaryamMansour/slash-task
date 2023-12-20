import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/end_points.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/productDetails.dart';
import '../models/productModel.dart';

abstract class HomeDataSources {
  Future<Either<Failures, Respone>> getProducts();

  Future<Either<Failures, ProductDetails>> getProductDetails(String productId);


}

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, Respone>> getProducts() async {
    try {
      var response = await dio.get(
        "${ApiUrl.baseApiUrl}${EndPoints.getProducts}",
      );
      Respone model = Respone.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  @override
  Future<Either<Failures, ProductDetails>> getProductDetails(String productId) async{
    try {
      var response = await dio.get(
        "${ApiUrl.baseApiUrl}${EndPoints.getProducts}/$productId",
      );
      ProductDetails model = ProductDetails.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

}

