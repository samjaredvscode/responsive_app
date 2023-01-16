part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

@freezed
class AppState with _$AppState {
  const factory AppState.authenticated({
    required MyUser user,
    @Default(AppStatus.authenticated) AppStatus? appStatus,
  }) = _Authenticated;
  const factory AppState.unauthenticated({
    @Default(AppStatus.unauthenticated) AppStatus? appStatus,
  }) = _Unauthenticated;
}
