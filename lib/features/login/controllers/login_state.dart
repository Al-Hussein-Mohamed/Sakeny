part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {}
final class LoginFailed extends LoginState {
  final String errorMessage;

  LoginFailed({this.errorMessage = "Login failed"});
}