import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String title;
  String description;
  String aboutOrganizer;
  String deadline;
  String category;

  UserModel(
      {required this.title,
      required this.description,
      required this.aboutOrganizer,
      required this.deadline,
      required this.category});
}
