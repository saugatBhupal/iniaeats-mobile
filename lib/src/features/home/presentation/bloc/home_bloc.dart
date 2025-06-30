import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inaeats/src/core/domain/entities/user.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      if (event is ChangeScreenModule) {
        _changeScreenModule(event, emit);
      }
    });
  }
}

void _changeScreenModule(ChangeScreenModule event, Emitter<HomeState> emit) {
  emit(ScreenModuleChanged(event.index));
}
