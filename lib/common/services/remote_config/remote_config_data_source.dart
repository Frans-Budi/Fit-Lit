import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigDataSource {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  List<String> fetchEvaluationQuestionById(String id) {
    final rawData = _remoteConfig.getString('evaluation_questions');
    Map<String, dynamic> json = jsonDecode(rawData);
    List<String> questions = List<String>.from(json[id]);
    return questions;
  }

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 0),
        minimumFetchInterval: const Duration(seconds: 10),
      ),
    );
    await _remoteConfig.fetchAndActivate();
  }
}
