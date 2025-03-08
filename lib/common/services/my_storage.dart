import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/utility.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class MyStorage {
  static Future<String?> getPdfUrl(String name) async {
    try {
      final ref = FirebaseStorage.instance
          .ref()
          .child(AppConstants.KEY_ASSETS)
          .child(AppConstants.KEY_PDF)
          .child(name);
      return await ref.getDownloadURL();
    } catch (e) {
      cprint(e);
      return null;
    }
  }

  static Future<String?> getImageUrl(String name, {String? subFolder}) async {
    try {
      late Reference finalRef;
      final ref = FirebaseStorage.instance
          .ref()
          .child(AppConstants.KEY_ASSETS)
          .child(AppConstants.KEY_IMAGES);

      if (subFolder == null || subFolder == "") {
        finalRef = ref.child(name);
      } else {
        finalRef = ref.child(subFolder).child(name);
      }

      return await finalRef.getDownloadURL();
    } catch (e) {
      cprint(e);
      return null;
    }
  }

  static Future<File?> downloadFile(String url, String filename) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final Directory appDocumentsDir =
            await getApplicationDocumentsDirectory();
        final file = File('${appDocumentsDir.path}/$filename');
        await file.writeAsBytes(response.bodyBytes);
        return file;
      }
    } catch (e) {
      cprint(e);
    }
    return null;
  }
}
