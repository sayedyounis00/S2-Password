import 'package:hive/hive.dart';
import 'package:password_saver/data/models/image_model.dart';

part 'password_model.g.dart';

@HiveType(typeId: 0)
class PasswordModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String? url;
  @HiveField(2)
  String email;
  @HiveField(3)
  String userName;
  @HiveField(4)
  String password;
  @HiveField(5)
  ImageModel? image;

  PasswordModel({
    required this.title,
    required this.password,
    required this.email,
    required this.userName,
    this.url,
    this.image,
  });
}
