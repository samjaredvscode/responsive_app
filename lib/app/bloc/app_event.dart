part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.userChanged({required MyUser user}) = _UserChanged;
  const factory AppEvent.logoutRequested() = _LogoutRequested;
}
