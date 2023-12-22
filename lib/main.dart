import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'config/routes/routes.dart';
import 'core/utils/observer.dart';
import 'features/home/data/data_sources/data_source.dart';
import 'features/home/presentation/manager/cubit.dart';
import 'features/product_details/presentation/manager/cubit.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer=MyBlocObserver();
//   runApp( MyApp(Routes.home));
// }
//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(HomeRemoteDto()), // Pass your data source to HomeCubit
        ),
        BlocProvider<ProductDetailsCubit>(
          create: (context) => ProductDetailsCubit(HomeRemoteDto()), // Pass your data source to ProductDetailsCubit
        ),
      ],
      child: MyApp(Routes.home),
    ),
  );
}
