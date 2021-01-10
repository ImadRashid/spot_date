

import 'package:spotadate/models/spot_date.dart';
import 'package:spotadate/models/spot_verification.dart';
//import 'package:spot/models/user.dart';

class SpotRequest {

  SpotRequest({this.toId});

  int id;
  int fromId;
  int toId;
  String type;
  // User from;
  // User to;
  SpotDate spotDate;
  SpotVerification spotVerification;

  SpotRequest.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.fromId = json['from_id'] is String? int.parse(json['from_id']) : json['from_id'];
    this.toId = json['to_id'] is String? int.parse(json['to_id']) : json['to_id'];
    this.type = json['type'];
    // this.from = User.fromJson(json['from']);
    // this.to = User.fromJson(json['to']);
    // this.spotDate = SpotDate.formJson(json['spot_date']);
    this.spotVerification = json['spot_verification'] != null? SpotVerification.fromJson(json['spot_verification']) : null;
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['to_id'] = this.toId;
    json['spot_date_id'] = this.spotDate != null? this.spotDate.id : null;
    return json;
  }
}