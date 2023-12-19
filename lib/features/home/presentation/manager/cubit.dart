import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/features/home/domain/entities/product.dart';
import 'package:slash/features/home/presentation/manager/states.dart';

import '../../data/data_sources/data_source.dart';
import '../../data/repositories/home_data_repo.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../../domain/use_cases/get_product_usecase.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeDataSources homeDataSources;
  late HomeDomainRepo homeDomainRepo;

  HomeCubit(this.homeDataSources) : super(HomeInitState()) {
    homeDomainRepo = HomeDataRepo(homeDataSources);
  }

  static HomeCubit get(context) => BlocProvider.of(context);

  List<Product> products = [];

  getProducts() async {
    emit(HomeLoadingState());
    GetProductsUseCase getProductsUseCase = GetProductsUseCase(homeDomainRepo);
    var result = await getProductsUseCase.call();
    result.fold((l) => {emit(HomeGetProductsErrorState(l))}, (r) {
      products = r.product ?? [];
      emit(HomeGetProductsSuccessState(r));
    });
  }
}
