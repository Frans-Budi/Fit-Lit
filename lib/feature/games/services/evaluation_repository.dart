import 'package:dartz/dartz.dart';
import 'package:fit_lit/feature/games/models/evaluation_model.dart';
import 'package:fit_lit/feature/games/services/evaluation_data_source.dart';
import 'package:fit_lit/feature/games/services/evaluation_exception.dart';

class EvaluationRepository {
  final EvaluationDataSource source;
  EvaluationRepository(this.source);

  Future<bool> saveEvaluation(EvaluationModel data) =>
      source.saveEvaluation(data);

  Future<Either<EvaluationException, EvaluationModel?>> getEvaluation(
          String id) =>
      source.getEvaluation(id);
}
