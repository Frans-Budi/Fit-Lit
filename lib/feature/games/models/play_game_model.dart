class PlayGameModel {
  final String title;
  final String subTitle;
  final String imageName;
  final String subFolder;

  PlayGameModel({
    required this.title,
    required this.subTitle,
    required this.imageName,
    required this.subFolder,
  });

  factory PlayGameModel.fromJson(Map<String, dynamic> json) => PlayGameModel(
        title: json["title"],
        subTitle: json["sub_title"],
        imageName: json["image_name"],
        subFolder: json["sub_folder"],
      );
}
