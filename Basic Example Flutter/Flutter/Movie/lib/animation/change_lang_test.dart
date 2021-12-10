import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:movie/resources/strings/localization_service.dart';

class DemoChangeLang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo Multi Languages',
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      home: DemoMultiLanguages(),
    );
  }
}

class DemoMultiLanguages extends StatefulWidget {
  const DemoMultiLanguages({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _DemoMultiLanguages();
  }
}

class _DemoMultiLanguages extends State<DemoMultiLanguages> {
  String _selectedLang = LocalizationService.locale.languageCode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
      ),
      body: Container(
        child: Center(
          child: DropdownButton<String>(
            icon: const Icon(Icons.arrow_drop_down),
            value: _selectedLang,
            items: _buildDropdownMenuItems(),
            onChanged: (value) {
              setState(() => _selectedLang = value!);
              LocalizationService.changeLocale(value!);
            },
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownMenuItems() {
    var list = <DropdownMenuItem<String>>[];
    LocalizationService.langs.forEach((key, value) {
      list.add(DropdownMenuItem<String>(
        value: key,
        child: Text(key),
      ));
    });
    return list;
  }
}
