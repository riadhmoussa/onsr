class StatisticModel {
  String? labelle;
  String? accidents;
  String? tues;
  String? blesses;

  StatisticModel({this.labelle, this.accidents, this.tues, this.blesses});

  StatisticModel.fromJson(Map<String, dynamic> json) {
    labelle = json['labelle'];
    accidents = json['accidents'];
    tues = json['tues'];
    blesses = json['blesses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['labelle'] = this.labelle;
    data['accidents'] = this.accidents;
    data['tues'] = this.tues;
    data['blesses'] = this.blesses;
    return data;
  }
}