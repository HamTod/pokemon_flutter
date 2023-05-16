class AnimalData {
  String name;
  int value;

  AnimalData({
    required this.name,
    required this.value,
  });

  factory AnimalData.fromJson(Map<String, dynamic> json) {
    return AnimalData(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
