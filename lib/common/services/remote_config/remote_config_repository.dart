import 'package:fit_lit/common/services/remote_config/remote_config_data_source.dart';

class RemoteConfigRepository {
  final RemoteConfigDataSource source;
  RemoteConfigRepository(this.source);

  List<String> fetchEvaluationQuestionById(String id) =>
      source.fetchEvaluationQuestionById(id);
}
