class Region {
  final String name;
  final double latitude;
  final double longitude;
  final String htmlFile;
  final List<EmergencyContacts> contacts;

  Region({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.htmlFile,
    required this.contacts,
  });
}

class EmergencyContacts {
  final String type;
  final Map<String, String> numbers;

  EmergencyContacts({
    required this.type,
    required this.numbers,
  });
}
