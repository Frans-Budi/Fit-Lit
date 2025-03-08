import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_lit/feature/home/services/profile_data_source.dart';

class ProfileRepository {
  final ProfileDataSource source;
  ProfileRepository(this.source);

  User? get currentUser => source.currentUser;

  Future<String> uploadImage({required String path, required File file}) =>
      source.uploadImage(path: path, file: file);

  Future<bool> updateProfile({
    required String name,
    String? imageUrl,
  }) =>
      source.updateProfile(name: name, imageUrl: imageUrl);
}
