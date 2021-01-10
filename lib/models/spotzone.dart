
class Spotzone {
  int id;
  String title;
  int resturantId;
  String date;
  String time;
  bool male;
  bool female;
  int minAge;
  int maxAge;
  List<SpotDateType> dateTypes = List();

  Spotzone({this.title});

  Spotzone.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.title = json['title'];
    this.resturantId = json['resturant_id'] is String? int.parse(json['resturant_id']) : json['resturant_id'];
    this.date = json['date'];
    this.time = json['time'];
    this.male = json['male'] == 1? true : false;
    this.female = json['female'] == 1? true: false;
    this.minAge = json['min_age'];
    this.maxAge = json['max_age'];
    List<dynamic> dateTypeList = json['date_types'];
    this.dateTypes = dateTypeList.map((i) => SpotDateType.fromJson(i)).toList();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['title'] = this.title;
    json['resturant_id'] = this.resturantId;
    json['date'] = this.date;
    json['time'] = this.time;
    json['male'] = this.male;
    json['female'] = this.female;
    json['min_age'] = this.minAge;
    json['max_age'] = this.maxAge;
    json['date_types'] = this.dateTypes;
    return json;
  }
}

class SpotDateType {
  String type;

  SpotDateType({this.type});

  SpotDateType.fromJson(Map<String, dynamic> json) {
    this.type = json['type'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = Map();
    json['type'] = this.type;
    return json;
  }
}