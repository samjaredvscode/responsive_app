part of 'tab_bloc.dart';

@freezed
class TabEvent with _$TabEvent {
  const factory TabEvent.currentIndex({required int currentIndex}) = _Started;
}
