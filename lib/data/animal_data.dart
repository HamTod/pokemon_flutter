import 'package:cloud_firestore/cloud_firestore.dart';

class AnimalData {
  String name;
  int value;
  String? id;
  DocumentReference? reference;

  AnimalData({
    required this.name,
    required this.value,
    this.reference,
    this.id,
  });

  factory AnimalData.fromJson(Map<String, dynamic> json) {
    return AnimalData(
      name: json['name'],
      value: json['value'],
      reference: json['reference'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['value'] = value;
    return data;
  }
}
