import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'image_model.g.dart';

@HiveType(typeId: 1)
class ImageModel extends HiveObject {
  @HiveField(0)
  Uint8List imageData;
  
  ImageModel({required this.imageData});
}
