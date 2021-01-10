

import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:spotadate/models/resturant.dart';
//import 'package:spot/models/user.dart';

class SpotDate {
  int id;
  bool spotDateApproved = false;
  bool spotDateDetailApproved = false;
  String description = "";
  String time = "";
  int resturantId;
  bool confirmed;
  String createdAt = "";
  String updatedAt = "";
  // User user1;
  // User user2;
  bool decline;
  Resturant resturant;
  List<DaysAvailable> daysAvailable = List();
  List<MyDateType> dateTypes = List();
  int toId;


  SpotDate({this.id});

  // SpotDate.formJson(Map<String, dynamic> json) {
  //   this.id = json['id'];
  //   this.spotDateApproved = json['spot_date_approved'] != null? (json['spot_date_approved'] == 0? false : true) : false;
  //   this.spotDateDetailApproved = json['spot_date_detail_approved'] != null? (json['spot_date_detail_approved'] == 0? false: true) : false;
  //   this.description = json['description'] != null? json['description'] : json['description'];
  //   this.time = json['time'] != null? json['time'] : null;
  //   this.resturantId = json['resturant_id'] != null? (json['resturant_id'] is String? int.parse(json['resturant_id']) : json['resturant_id']) : null;
  //   this.createdAt = json['created_at'];
  //   this.updatedAt = json['updated_at'];
  //   this.user1 = json['user1'] != null? User.fromJson(json['from']): null;
  //   this.user2 = json['user2'] != null? User.fromJson(json['to']) : null;
  //   this.resturant = json['resturant'] != null? Resturant.fromJson(json['resturant']): null;
  //   this.decline = json['decline'] != null? (json['decline'] == 0? false : true) : false;
  //   List<dynamic> galleryList = json['days_available'];
  //   this.daysAvailable = galleryList.map((i) => DaysAvailable.fromJson(i)).toList();
  //   List<dynamic> dateTypeList = json['date_types'];
  //   this.dateTypes = dateTypeList.map((i) => MyDateType.fromJson(i)).toList();
  //   this.confirmed = json['confirmed'] is String? (int.parse(json['confirmed']) == 0? false : true) : (json['confirmed'] ==0? false : true);
  // }
  //
  // Map<String, dynamic> toJson() {
  //   Map<String, dynamic> json = Map();
  //   json['spot_date_id'] = this.id;
  //   json['spot_date_approved'] = this.spotDateApproved;
  //   json['spot_date_detail_approved'] = this.spotDateDetailApproved;
  //   json['description'] = this.description;
  //   json['time'] = this.time;
  //   json['resturant_id'] = this.resturantId;
  //   json['date_types'] = this.dateTypes;
  //   json['days_available'] = this.daysAvailable;
  //   json['to_id'] = this.toId;
  //
  //   return json;
  // }
}

class DaysAvailable {
  String date = "";

  DaysAvailable({this.date});

  DaysAvailable.fromJson(Map<String, dynamic> json) {
    this.date = json['date'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['date'] = this.date;
    return json;
  }
}

class MyDateType {
  int id;
  String type;

  MyDateType({this.type});

  MyDateType.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.type = json['type'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['type'] = this.type;
    return json;
  }
}
