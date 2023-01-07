import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/value_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get X',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final textController = TextEditingController();

  final valueController = ValueController();

  @override
  Widget build(BuildContext context) {
    print("criou arvore");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get X"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () {
                print("criou GetX");
                return Text(
                  'Valor Definido ${valueController.definedValue}',
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: TextField(
                controller: textController,
              ),
            ),
            Obx(
              () {
                print("criou GetX");
                return valueController.isLoading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          String v = textController.text;

                          valueController.setValue(v);

                          print(v);
                        },
                        child: const Text("Confirmar"),
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
