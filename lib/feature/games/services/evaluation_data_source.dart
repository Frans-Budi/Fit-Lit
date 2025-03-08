import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fit_lit/common/utils/app_constants.dart';
import 'package:fit_lit/common/utils/utility.dart';
import 'package:fit_lit/feature/games/models/evaluation_model.dart';
import 'package:fit_lit/feature/games/services/evaluation_exception.dart';

class EvaluationDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> saveEvaluation(EvaluationModel data) async {
    try {
      await _firestore
          .collection(AppConstants.KEY_EVALUATIONS)
          .doc("${data.userId}|${data.gameId}")
          .set(data.toJson());
      return true;
    } catch (e) {
      cprint(e);
      return false;
    }
  }

  Future<Either<EvaluationException, EvaluationModel?>> getEvaluation(
    String id,
  ) async {
    try {
      final snapshot = await _firestore
          .collection(AppConstants.KEY_EVALUATIONS)
          .doc(id)
          .get();
      if (snapshot.data() == null) {
        return const Right(null);
      }
      return Right(EvaluationModel.fromJson(snapshot.data()!));
    } catch (e) {
      cprint(e);
      return Left(EvaluationException(message: 'Terjadi Kesalahan!'));
    }
  }
}
