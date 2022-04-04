import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class AddRoutePage extends StatefulWidget {
  const AddRoutePage({Key? key}) : super(key: key);

  @override
  State<AddRoutePage> createState() => _AddRoutePageState();
}

class _AddRoutePageState extends State<AddRoutePage> {
  // void autoCompleteSearch(String value) async {
  //   var result = await googlePlace.autocomplete.get(value);
  //   if (result != null && result.predictions != null && mounted) {
  //     setState(() {
  //       predictions = result.predictions;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Планирование маршрута',
          style: kTextStyleTitle,
        ),
        backgroundColor: kBackgroundWidgetColor.withOpacity(0.9),
      ),
      body: Container(
        margin: EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Выберете город',
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 2,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {}
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 0,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      child: Icon(
                        Icons.pin_drop,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(''),
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
