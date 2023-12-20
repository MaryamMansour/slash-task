import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import 'app.dart';
import 'config/routes/routes.dart';
import 'core/utils/observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  runApp( MyApp(Routes.home));
}

