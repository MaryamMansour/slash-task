import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/end_points.dart';
import '../models/productModel.dart';

abstract class HomeDataSources {
  Future<Either<Failures, ResponeModel>> getProducts();

}

class HomeRemoteDto implements HomeDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, ResponeModel>> getProducts() async {
    try {
      var response = await dio.get(
        "${ApiUrl.baseApiUrl}${EndPoints.getProducts}",
      );
      ResponeModel model = ResponeModel.fromJson(response.data);
      return Right(model);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

}

class HomeLocalDto implements HomeDataSources {

  @override
  Future<Either<Failures, ResponeModel>> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }

}
