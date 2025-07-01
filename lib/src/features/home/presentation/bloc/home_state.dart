part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

class ScreenModuleChanged extends HomeState {
  final int index;

  const ScreenModuleChanged(this.index);
  @override
  List<Object> get props => [index];
}

class SwitchMealTabLoading extends HomeState {
  const SwitchMealTabLoading();
}

class SwitchMealTabSuccess extends HomeState {
  final List<Product> products;

  const SwitchMealTabSuccess({required this.products});
}

class SwitchMealTabError extends HomeState {
  final String message;

  const SwitchMealTabError({required this.message});
}
