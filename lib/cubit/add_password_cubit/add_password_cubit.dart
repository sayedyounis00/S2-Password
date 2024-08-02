import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:password_saver/constants.dart';
import 'package:password_saver/data/models/password_model.dart';

part 'add_password_state.dart';

class AddPasswordCubit extends Cubit<AddPasswordState> {
  AddPasswordCubit() : super(AddPasswordInitial());

  addPassword(PasswordModel pass) async {
    try {
      // Open the Hive box
      var passBox = await Hive.openBox<PasswordModel>(kPasswordBox);

      // Create a new instance of PasswordModel
      var newPassword = PasswordModel(
        title: pass.title,
        password: pass.password,
        email: pass.email,
        userName: pass.userName,
        url: pass.url,
        image: pass.image,
      );

      // Add the new instance to the Hive box
      await passBox.add(newPassword);
      // passBox.deleteAll(passBox.keys);

      // Emit success state
      emit(AddPasswordSuccess());
    } catch (e) {
      // Emit failure state with error message
      emit(AddPasswordFailure(errMessage: e.toString()));
    }
  }
}
