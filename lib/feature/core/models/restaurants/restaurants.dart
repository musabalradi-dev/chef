class RestaurantsModel {

  int? id;
  String? title;
  String? image;
  String? categories;
  dynamic rating;
  String? address;
  String? description;

  // Constructor
  RestaurantsModel({
    this.id,
    this.title,
    this.image,
    this.categories,
    this.rating,
    this.address,
    this.description,
  });

  // Json to Model
  RestaurantsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image_url'];
    categories = json['categories'];
    rating = json['rating'];
    address = json['address'];
    description = json['description'];
  }

  // To Json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image_url'] = image;
    data['categories'] = categories;
    data['rating'] = rating;
    data['address'] = address;
    data['description'] = description;
    return data;
  }
}