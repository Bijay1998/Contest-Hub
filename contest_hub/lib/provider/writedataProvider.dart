import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final crudprovider = Provider((ref) => CRUD());

class CRUD {
  Future<String> giveaways(String title, String description, String deadline,
      String category, String organizer) async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      final eventBased = FirebaseFirestore.instance.collection('Give Aways');

      eventBased.add({
        'Title': title,
        'Description': description,
        'Deadline': deadline,
        'Category': category,
        'Organizer': organizer
      });
      return 'Success';
    } catch (err) {
      return '$err';
    }
  }

  Future<String> writing(String title, String description, String deadline,
      String category, String organizer) async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      final userdb = FirebaseFirestore.instance.collection('Writing');

      userdb.add({
        'Title': title,
        'Description': description,
        'Deadline': deadline,
        'Category': category,
        'Organizer': organizer
      });
      return 'Success';
    } catch (err) {
      return '$err';
    }
  }

  Future<String> quiz(String title, String description, String deadline,
      String category, String organizer) async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      final userdb = FirebaseFirestore.instance.collection('Quiz');

      userdb.add({
        'Title': title,
        'Description': description,
        'Deadline': deadline,
        'Category': category,
        'Organizer': organizer,
      });
      return 'Success';
    } catch (err) {
      return '$err';
    }
  }

  Future<String> photo(
      String title,
      String description,
      String deadline,
      String category,
      String organizersName,
      String aboutOrganizer,
      String location) async {
    try {
      final id = FirebaseAuth.instance.currentUser!.uid;
      final userdb = FirebaseFirestore.instance.collection('Photo');

      userdb.add({
        'Title': title,
        'Description': description,
        'Deadline': deadline,
        'Category': category,
        "Organizer's Name": organizersName,
        "About Organizer": aboutOrganizer,
        "Location": location
      });
      return 'Success';
    } catch (err) {
      return '$err';
    }
  }
}
