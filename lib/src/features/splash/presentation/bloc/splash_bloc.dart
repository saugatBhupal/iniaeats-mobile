import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inaeats/src/core/domain/entities/user.dart';
import 'package:inaeats/src/features/splash/domain/usecases/get_current_user_usecase.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetCurrentUserUsecase getCurrentUser;
  SplashBloc({required this.getCurrentUser}) : super(SplashInitial()) {
    on<SplashEvent>((event, emit) async {
      if (event is StartUpEvent) {
        await _splashGetCurrentUser(event, emit);
      }
    });
  }

  Future<void> _splashGetCurrentUser(StartUpEvent event, Emitter<SplashState> emit) async {
    emit(StartupLoading());
    final result = await getCurrentUser();
    result.fold(
      (left) => emit(SplashGetUserFailed()),
      (right) => emit(SplashGetUserSuccessfully(user: right)),
    );
  }
}
