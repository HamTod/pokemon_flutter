import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pokemon2/data/animal_data.dart';
import 'package:rxdart/rxdart.dart';

class AnimalServices {
  static final _firebase = FirebaseFirestore.instance;
  static const _collection = 'animals';

  Future<DocumentReference<Map<String, dynamic>>> addAnimal(AnimalData data) {
    final ref = _firebase.collection(_collection);
    return ref.add(data.toJson());
  }

  Future<List<AnimalData>> getAnimal() async {
    final ref = _firebase.collection(_collection);
    List<AnimalData> list = [];
    await ref.snapshots().doOnData((data) {
      final res = data.docs.map((e) => AnimalData.fromJson(e.data()));
      list.addAll(res);
    }).listen((event) {}).asFuture();
    return list;
  }
}
