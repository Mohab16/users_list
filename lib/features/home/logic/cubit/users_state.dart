import 'package:freezed_annotation/freezed_annotation.dart';
part 'users_state.freezed.dart';

@Freezed()
class UsersState<T> with _$UsersState {
  const factory UsersState.initial() = _Initial;
  const factory UsersState.loading() = Loading;
  const factory UsersState.success(T data) = Success<T>;
  const factory UsersState.error({required String error}) = Error;
}
