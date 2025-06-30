part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ChangeScreenModule extends HomeEvent {
  final int index;

  const ChangeScreenModule(this.index);
}
