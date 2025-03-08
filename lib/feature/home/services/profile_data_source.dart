import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/utility.dart';

class ProfileDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  User? get currentUser => _auth.currentUser;

  Future<String> uploadImage({required String path, required File file}) async {
    final ref = _firebaseStorage.ref().child(path);
    UploadTask uploadTask = ref.putFile(file);
    final snapshot = await uploadTask.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    return urlDownload;
  }

  Future<bool> updateProfile({
    required String name,
    String? imageUrl,
  }) async {
    try {
      if (imageUrl == null) {
        await _firestore
            .collection(AppConstants.KEY_USERS)
            .doc(currentUser!.uid)
            .update({'name': name});
      } else {
        await _firestore
            .collection(AppConstants.KEY_USERS)
            .doc(currentUser!.uid)
            .update({'name': name, 'photo': imageUrl});
      }
      return true;
    } catch (e) {
      cprint(e);
      return false;
    }
  }
}
