
class SpotVerification {
  int id;
  int userId;
  int spotDateId;
  int spotRequestId;
  bool verified;
  String image;

  SpotVerification.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.userId = json['user_id'] is String? int.parse(json['user_id']) : json['user_id'];
    this.spotDateId = json['spot_date_id'] is String? int.parse(json['spot_date_id']) : json['spot_date_id'];
    this.spotRequestId = json['spot_request_id'] is String? int.parse(json['spot_request_id']) : json['spot_request_id'];
    this.verified = json['verified'] == 0? false : true;
    this.image = json['image'];
  }

}