class EvaluationModel {
  final String userId;
  final String gameId;
  final List<QnA> listQnA;

  EvaluationModel({
    required this.userId,
    required this.gameId,
    required this.listQnA,
  });

  factory EvaluationModel.fromJson(Map<String, dynamic> json) {
    return EvaluationModel(
      userId: json['userId'],
      gameId: json['gameId'],
      listQnA: List.from(json['evaluations'])
          .map((item) => QnA.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'gameId': gameId,
      'evaluations': listQnA.map((qna) => qna.toJson()).toList(),
    };
  }
}

class QnA {
  final String question;
  final String answer;

  QnA({
    required this.question,
    required this.answer,
  });

  factory QnA.fromJson(Map<String, dynamic> json) {
    return QnA(
      question: json['question'],
      answer: json['answer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'answer': answer,
    };
  }
}
