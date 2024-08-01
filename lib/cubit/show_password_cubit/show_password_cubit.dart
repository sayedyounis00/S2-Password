import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/data/models/password_model.dart';

part 'show_password_state.dart';

class ShowPasswordCubit extends Cubit<ShowPasswordState> {
  ShowPasswordCubit() : super(ShowPasswordInitial());
  List<PasswordModel> notes = [];
  showpassword() {
    var passBox = Hive.box<PasswordModel>(kPasswordBox);
    notes = passBox.values.toList();
    emit(ShowPasswordSucces());
    log(notes.toString());
  }
}
