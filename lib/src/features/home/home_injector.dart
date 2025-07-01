import 'package:inaeats/src/config/dependency_injection/dependency_injector.dart';
import 'package:inaeats/src/features/home/domain/usecases/switch_meal_tab_usecase.dart';
import 'package:inaeats/src/features/home/presentation/bloc/home_bloc.dart';

void initHome() {
  sl.registerLazySingleton<SwitchMealTabUsecase>(() => SwitchMealTabUsecase());
  sl.registerFactory<HomeBloc>(() => HomeBloc(switchMealTabUsecase: sl()));
}
