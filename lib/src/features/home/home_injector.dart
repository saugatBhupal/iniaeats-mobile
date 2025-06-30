import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/features/home/presentation/bloc/home_bloc.dart';

void initHome() {
  sl.registerFactory<HomeBloc>(() => HomeBloc());
}
