class TrafficCenter {
  final String name;
  final double lat;
  final double lng;

  TrafficCenter({required this.name, required this.lat, required this.lng});

  factory TrafficCenter.fromJson(Map<String, dynamic> json) {
    return TrafficCenter(
      name: json['name'],
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
