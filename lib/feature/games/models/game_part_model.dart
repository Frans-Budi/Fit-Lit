class GamePartModel {
  final String id;
  final String title;
  final String subTitle;
  final String imageName;
  final String subFolder;
  final String pdfName;
  final bool isFinish;

  GamePartModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.imageName,
    required this.subFolder,
    required this.pdfName,
    this.isFinish = false,
  });

  factory GamePartModel.fromJson(Map<String, dynamic> json) => GamePartModel(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        imageName: json["image_name"],
        subFolder: json["sub_folder"],
        pdfName: json["pdf_name"],
      );
}
