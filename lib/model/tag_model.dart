class Tagsmodel {
  String? id;
  String? title;
  String? image;

  Tagsmodel({
    this.id,
    this.title,
    this.image,
  });

  Tagsmodel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
  }
}
