class SizePositionModel {
  final double width;
  final double height;
  final double left;
  final double top;

  SizePositionModel({
    required this.width,
    required this.height,
    required this.left,
    required this.top,
  });

  factory SizePositionModel.fromJson(Map<String, dynamic> json) {
    return SizePositionModel(
      width: (json['width'] as int).toDouble(),
      height: (json['height'] as int).toDouble(),
      left: (json['left'] as int).toDouble(),
      top: (json['top'] as int).toDouble(),
    );
  }
}
