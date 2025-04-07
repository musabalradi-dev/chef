class RestaurantsModel{
  int? id;
  String? title;
  String? imageUrl;
  String? categories;
  String? address;
  String? description;

  RestaurantsModel({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.categories,
    required this.address,
    required this.description,
  });

  RestaurantsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    imageUrl = json['image_url'];
    categories = json['categories'];
    address = json['address'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = imageUrl;
    data['categories'] = categories;
    data['address'] = address;
    data['description'] = description;
    return data;
  }

}