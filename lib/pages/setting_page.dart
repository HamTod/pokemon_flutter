import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../store/auth_store.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    final appText = AppLocalizations.of(context)!;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SelectLanguage(),
          ],
        ),
        Text(appText.helloWorld)
      ],
    );
  }
}


const List<Lang> list = <Lang>[Lang.thai, Lang.eng];

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {


  String getLangText(Lang ln) {
    if (ln == Lang.thai) {
      return 'ไทย';
    } else {
      return 'English';
    }
  }

  @override
  Widget build(BuildContext context) {
    final authStore = Provider.of<AuthStore>(context, listen: false);

    return Observer(
        builder: (context) {
          return DropdownButton<Lang>(
            value: authStore.language,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (value) {
              // This is called when the user selects an item.
              if (value != null) {
                authStore.setLocale(value);
              }
            },
            items: list.map<DropdownMenuItem<Lang>>((value) {
              return DropdownMenuItem<Lang>(
                value: value,
                child: Text(getLangText(value)),
              );
            }).toList(),
          );
        }
    );
  }
}
