class CategoriesModel{
  int? id;
  String? image;
  String? title;

  // Constructor
  CategoriesModel({this.id, this.image, this.title});

  // Json to Model
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image_url'];
    title = json['title'];
  }

  // To Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = image;
    data['title'] = title;
    return data;
  }
}