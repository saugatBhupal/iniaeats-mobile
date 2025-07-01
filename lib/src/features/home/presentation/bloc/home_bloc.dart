import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inaeats/src/features/home/domain/usecases/switch_meal_tab_usecase.dart';
import 'package:inaeats/src/features/products/domain/entities/product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SwitchMealTabUsecase switchMealTabUsecase;
  HomeBloc({required this.switchMealTabUsecase}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is ChangeScreenModule) {
        _changeScreenModule(event, emit);
      }
      if (event is SwitchMealTabs) {
        await _switchMealTabs(event, emit);
      }
    });
  }
  void _changeScreenModule(ChangeScreenModule event, Emitter<HomeState> emit) {
    emit(ScreenModuleChanged(event.index));
  }

  final List<Product> _mealTabProducts = [];
  List<Product> get mealTabProducts => _mealTabProducts;
  Future<void> _switchMealTabs(SwitchMealTabs event, Emitter<HomeState> emit) async {
    emit(const SwitchMealTabLoading());
    try {
      final result = await switchMealTabUsecase.call(event.productType);
      result.fold((failure) => emit(SwitchMealTabError(message: failure.message)), (success) {
        _mealTabProducts
          ..clear()
          ..addAll(success);
        emit(SwitchMealTabSuccess(products: success));
      });
    } catch (e) {
      emit(SwitchMealTabError(message: "Error: ${e.toString()}"));
    }
  }
}
