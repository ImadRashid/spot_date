

import 'package:spotadate/models/spot_date.dart';
//import 'package:letsgetstarted/models/user.dart';

class Notification {
  int id;
  int fromId;
  int toId;
  String type;
  // User from;
  // User to;
  SpotDate spotDate;
  String createdAt;
  String updatedAt;

  // Notification.fromJson(Map<String, dynamic> json) {
  //   this.id = json['id'];
  //   this.fromId = json['from_id'] is String? int.parse(json['from_id']) : json['from_id'];
  //   this.toId = json['to_id'] is String? int.parse(json['to_id']): json['from_id'];
  //   this.type = json['type'];
  //   this.from = User.fromJson(json['from']);
  //   this.to = User.fromJson(json['to']);
  //   this.spotDate = SpotDate.formJson(json['spot_date']);
  //   this.createdAt = json['created_at'];
  //   this.updatedAt = json['updated_at'];
  // }
}