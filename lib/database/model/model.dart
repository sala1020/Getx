import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  StudentModel({
    required this.name,
    required this.age,
    required this.rollNumber,
    required this.imageUrl
  });

  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  int rollNumber;
  @HiveField(3)
  String imageUrl;
}
