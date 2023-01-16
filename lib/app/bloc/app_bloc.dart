import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_app/app/models/user_model.dart';
import 'package:responsive_app/app/packages/authentication/authentication.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<MyUser> _streamSubscription;
  AppBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isNotEmpty
              ? AppState.authenticated(
                  user: authenticationRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppEvent>((event, emit) {
      event.when(
        userChanged: (user) => AppEvent.userChanged(user: user),
        logoutRequested: () => unawaited(_authenticationRepository.logOut()),
      );
      _streamSubscription = _authenticationRepository.user.listen(
        (_) => add(
          event.maybeWhen(
            orElse: () => const AppEvent.logoutRequested(),
            userChanged: (user) => AppEvent.userChanged(user: user),
          ),
        ),
      );
    });
  }

  @override
  Future<void> close() async {
    _streamSubscription.cancel();
    return super.close();
  }
}
