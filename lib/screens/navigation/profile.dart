
import 'dart:convert';


class Profile {

  Profile({this.name});

  String name = "";
  String username = "";
  String occupation = "";
  String about = "";
  String gender = "";
  String sexualPreference = "";
  String dob = "";
  String image = "";
  double latitude;
  double longitude;
  String createdAt = "";
  String updatedAt = "";
  String address = "";
  String status = "";
  String height = "";
  int userId;
  LocationObj location;

  List<Interest> interests = List();
  List<Gallery> gallery = List();

  Profile.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.username = json['username'];
    this.occupation = json['occupation'];
    this.about = json['about'];
    this.gender = json['gender'];
    this.sexualPreference = json['sexual_preference'];
    this.dob = json['dob'];
    this.image = json['image'];
    print(json['latitude']);
    //this.latitude = (json['latitude'] is double)? (json['latitude'] as double).toDouble(): (json['latitude'] as double).toDouble();
    //this.longitude = (json['longitude'] is double)? (json['longitude'] as double).toDouble(): (json['longitude']as double).toDouble();
    this.createdAt = json['created_at'];
    this.updatedAt = json['updated_at'];
    this.address = json['address'];
    this.status = json['status'];
    this.height = json['height'];
    this.userId = json['user_id'] is String? int.parse(json['user_id']) : json['user_id'];
    this.location = LocationObj.fromJson(json['location']);
    List<dynamic> interestList = json['interests'];
    //this.interests = interestList.map((i) => Interest.fromJson(i)).toList();
    List<dynamic> galleryList = json['gallery'];
    this.gallery = galleryList.map((i) => Gallery.fromJson(i)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['name'] = this.name;
    json['username'] = this.username;
    json['occupation'] = this.occupation;
    json['about'] = this.about;
    json['gender'] = this.gender;
    json['sexual_preference'] = this.sexualPreference;
    json['dob'] = this.dob;
    json['image'] = this.image;
    json['latitude'] = this.latitude;
    json['longitude'] = this.longitude;
    json['created_at'] = this.createdAt;
    json['updated_at'] = this.updatedAt;
    json['address'] = this.address;
    json['status'] = this.status;
    json['height'] = this.height;
    json['interests'] = this.interests;
    json['location'] = this.location.toJson();
    print(json.toString());

    return json;
  }
}

class Interest {
  String interest;
  Interest({this.interest});


  //
  // Interest.fromJson(Map<String, dynamic> json) {
  //   this.interest = json['interest'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> json = Map();
  //   json['interest'] = this.interest;
  //   return json;
  // }
}

List<Interest> interestList=[
  Interest(
    interest: "Nature",

  ),
  Interest(
    interest: "Music",

  ),
  Interest(
    interest: "travel",

  ),
];

class Gallery {
  Gallery({this.image});

  String image = "";

  Gallery.fromJson(Map<String, dynamic> json) {
    this.image = json['image'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['image'] = this.image;
    return json;
  }
}

class LocationObj {
  double lat;
  double lng;

  LocationObj({this.lat, this.lng});

  LocationObj.fromJson(Map<String, dynamic> json) {
    this.lat = double.parse(json['lat']);
    this.lng = double.parse(json['lng']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['lat'] = this.lat;
    json['lng'] = this.lng;
    return json;
  }
}