
import 'package:hive/hive.dart';

part'password_model.g.dart';

@HiveType(typeId: 0)
class PasswordModel extends HiveObject{
  @HiveField(0)
  final String title;
    @HiveField(1)
  final String password;
    @HiveField(2)
  final String email;
    @HiveField(3)
  final String userName;

  PasswordModel({required this.title, required this.password, required this.email, required this.userName});
}
