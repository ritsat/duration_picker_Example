import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration _duration = const Duration(hours: 0, minutes: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Duration Picker Example"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DurationPicker(
                onChange: (val) {
                  _duration = val;
                  setState(() {});
                },
                duration: _duration,
                baseUnit: BaseUnit.hour,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Duration? selectedDuration = await showDurationPicker(
                        context: context,
                        initialTime: const Duration(minutes: 20));

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Chose duration: $selectedDuration')));
                  },
                  child: const Text("Show Duration Picker"))
            ],
          ),
        ));
  }
}
