class WebtoonModel {
  final String id;
  final String title;
  final String thumb;

  WebtoonModel({
    required this.id,
    required this.title,
    required this.thumb,
  });

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        thumb = json['thumb'];
}
