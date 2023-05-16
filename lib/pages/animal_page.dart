import 'package:flutter/material.dart';
import 'package:pokemon2/data/animal_data.dart';
import 'package:pokemon2/services/animal_services.dart';

class AnimalPage extends StatefulWidget {
  const AnimalPage({Key? key}) : super(key: key);

  @override
  State<AnimalPage> createState() => _AnimalPageState();
}

class _AnimalPageState extends State<AnimalPage> {
  final animalService = AnimalServices();

  List<AnimalData> listAnimal = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Animal",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            IconButton(
                onPressed: () async {
                  final res = await _showMyDialog();
                  if (res != null) {
                    animalService.addAnimal(AnimalData(
                        name: res['animal'], value: int.parse(res['value'])));
                  }
                },
                icon: const Icon(Icons.add_circle_outline)),
          ],
        ),
        ...listAnimal.map((e) => ListTile(
              title: Text(e.name),
              subtitle: Text(e.value.toString()),
            ))
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final data = await animalService.getAnimal();
      setState(() {
        listAnimal = data;
      });
    });
  }

  Future<Map?> _showMyDialog() async {
    final local = MaterialLocalizations.of(context);
    final animalController = TextEditingController();
    final valueController = TextEditingController();
    return showDialog<Map?>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: animalController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ชื่อสัตว์',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: valueController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'จำนวน',
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(local.okButtonLabel),
              onPressed: () {
                Map data = {};
                data['animal'] = animalController.value.text;
                data['value'] = valueController.value.text;
                Navigator.of(context).pop(data);
              },
            ),
            TextButton(
              child: Text(local.cancelButtonLabel),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}