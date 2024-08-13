class Journee {
  String? jour;
  String? mois;
  String? annee;
  String? accidents;
  String? tues;
  String? blesses;

  Journee(
      {this.jour,
        this.mois,
        this.annee,
        this.accidents,
        this.tues,
        this.blesses});

  Journee.fromJson(Map<String, dynamic> json) {
    jour = json['jour'];
    mois = json['mois'];
    annee = json['annee'];
    accidents = json['accidents'];
    tues = json['tues'];
    blesses = json['blesses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['jour'] = this.jour;
    data['mois'] = this.mois;
    data['annee'] = this.annee;
    data['accidents'] = this.accidents;
    data['tues'] = this.tues;
    data['blesses'] = this.blesses;
    return data;
  }
}