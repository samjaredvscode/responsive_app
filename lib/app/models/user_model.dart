import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class MyUser with _$MyUser {
  const MyUser._();

  const factory MyUser({
    @Default('') String uid,
    @Default('') String name,
    String? email,
    String? photo,
    bool? verify,
  }) = _MyUser;

  static const empty = MyUser(uid: '');

  bool get isEmpty => this == MyUser.empty;
  bool get isNotEmpty => this != MyUser.empty;

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
}
