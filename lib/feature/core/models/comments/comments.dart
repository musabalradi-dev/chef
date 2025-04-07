class CommentsModel{
  int? id;
  String? fullName;
  String? comment;
  int? restaurantId;

  // Constructor
  CommentsModel({this.id, this.fullName, this.comment, this.restaurantId});

  CommentsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    comment = json['comments'];
    restaurantId = json['restaurant_id'];
  }

  // To JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['comments'] = comment;
    data['restaurant_id'] = restaurantId;
    return data;
  }

}