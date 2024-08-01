import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/data/models/password_model.dart';

part 'add_password_state.dart';

class AddPasswordCubit extends Cubit<AddPasswordState> {
  AddPasswordCubit() : super(AddPasswordInitial());

  addPassword(PasswordModel data) async {
    emit(AddPasswordLoading());
    try {
      var passBox = await Hive.openBox<PasswordModel>(kPasswordBox);
      passBox.add(data);
      log(data.toString());
      emit(AddPasswordSuccess());
    } catch (e) {
      emit(AddPasswordFailure(errMessage: e.toString()));
    }
  }
}
