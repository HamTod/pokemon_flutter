import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemon2/data/animal_data.dart';

class AnimalServices {
  static final _firebase = FirebaseFirestore.instance;
  static const _collection = 'animals';

  Future<DocumentReference<Map<String, dynamic>>> addAnimal(AnimalData data) {
    final ref = _firebase.collection(_collection);
    return ref.add(data.toJson());
  }

  Stream<List<AnimalData>> getAnimal() {
    final ref = _firebase.collection(_collection);
    return ref.snapshots().map((data) {
      final res = data.docs
          .map((e) => AnimalData.fromJson(
              {'id': e.id, 'reference': e.reference, ...e.data()}))
          .toList();
      return res;
    });
  }

  Future<void>? updateAnimal(AnimalData data) {
    return data.reference?.update(data.toJson());
  }

  Future<void>? deleteAnimal(AnimalData data) {
    return data.reference?.delete();
  }
}
