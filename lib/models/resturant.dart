

class Resturant {
  int id;
  String name = "";
  String description = "";
  String fromTime = "";
  String toTime = "";
  String image = "";
  double lat;
  double lng;
  List<ResturantImage> resturantImages = List();
  List<Review> reviews = List();

  Resturant.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.description = json['description'];
    this.fromTime = json['from_time'];
    this.toTime = json['to_time'];
    this.image = json['image'];
    this.lat = double.parse(json['lat']);
    this.lng = double.parse(json['lng']);
    List<dynamic> resturantImagesList = json['resturant_images'];
    this.resturantImages = resturantImagesList.map((i) => ResturantImage.fromJson(i)).toList();
    List<dynamic> reviewsList = json['reviews'];
    this.reviews = reviewsList.map((i) => Review.fromJson(i)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['name'] = this.name;
    json['description'] = this.description;
    json['from_time'] = this.fromTime;
    json['to_time'] = this.toTime;
    json['image'] = this.image;
  }
}

class ResturantImage {
  String image;

  ResturantImage.fromJson(Map<String, dynamic> json) {
    this.image = json['image'];
  }
}

class Review {
  int id;
  String review;
  double rating;

  Review.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.review = json['review'];
    this.rating = json['rating'];
  }
}