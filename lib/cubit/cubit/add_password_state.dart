part of 'add_password_cubit.dart';

sealed class AddPasswordState {}

final class AddPasswordInitial extends AddPasswordState {}

final class AddPasswordLoading extends AddPasswordState {}

final class AddPasswordSuccess extends AddPasswordState {}

final class AddPasswordFailure extends AddPasswordState {
  final String errMessage;

  AddPasswordFailure({required this.errMessage});
}
