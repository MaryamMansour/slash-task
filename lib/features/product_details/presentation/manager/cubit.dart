import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/home/domain/entities/product.dart';
import 'package:slash/features/home/domain/entities/productDetails.dart';
import 'package:slash/features/home/domain/use_cases/get_product_usecase.dart';
import 'package:slash/features/home/presentation/manager/states.dart';
import 'package:slash/features/product_details/presentation/manager/states.dart';

import '../../../home/data/data_sources/data_source.dart';
import '../../../home/data/repositories/home_data_repo.dart';
import '../../../home/domain/repositories/home_domain_repo.dart';


class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  ProductDetailsCubit(this.homeDataSources) : super(ProductDetailsInit()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static ProductDetailsCubit get(context) => BlocProvider.of(context);
  ProductDetails? product;

  getProductDetails(int id) async {
    emit(ProductDetailsLoading());
    GetProductDetailsUseCase getProductsUseCase = GetProductDetailsUseCase(homeDomainRepo);
    var result = await getProductsUseCase.call(id.toString());
    result.fold((l) => {emit(ProductDetailsError(l))}, (r) {
      product = r;
      emit(ProductDetailsLoaded(r));
    });
  }

}
