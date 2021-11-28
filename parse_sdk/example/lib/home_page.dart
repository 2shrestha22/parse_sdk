import 'dart:convert';
import 'dart:math';

import 'package:example/models/pc.dart';
import 'package:flutter/material.dart';
import 'package:parse_sdk/parse_sdk.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cpuTextEditingController = TextEditingController();
  final ramTextEditingController = TextEditingController();
  final diskTextEditingController = TextEditingController();

  Future<List<PC>> getPCs() async {
    final res = await ParseObject()
        .query(
          className: 'PC',
        )
        .get();
    return (jsonDecode(res)['results'] as List)
        .map((e) => PC.fromMap(e))
        .toList();
  }

  Future<List<PC>> queryPCs() async {
    final res = await ParseObject()
        .query(
          className: 'PC',
        )
        .where(
          'ram',
          isLessThan: '50',
          isNotEqualTo: '35',
        )
        .get();
    return (jsonDecode(res)['results'] as List)
        .map((e) => PC.fromMap(e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parse SDK Example'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    controller: cpuTextEditingController
                      ..text = Random().nextInt(100).toString(),
                    decoration: const InputDecoration(
                      labelText: 'CPU Usage %',
                      isDense: true,
                    ),
                  ),
                  TextFormField(
                    controller: ramTextEditingController
                      ..text = Random().nextInt(100).toString(),
                    decoration: const InputDecoration(
                      labelText: 'RAM Usage %',
                      isDense: true,
                    ),
                  ),
                  TextFormField(
                    controller: diskTextEditingController
                      ..text = Random().nextInt(100).toString(),
                    decoration: const InputDecoration(
                      labelText: 'Disk Usage %',
                      isDense: true,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint(
                          identical(ParseObject(), ParseObject()).toString());
                      ParseObject()
                          .createObject(
                        className: 'PC',
                        data: PC(
                          cpuTextEditingController.text,
                          ramTextEditingController.text,
                          diskTextEditingController.text,
                        ).toMap(),
                      )
                          .then((value) {
                        setState(() {});
                      });
                    },
                    child: const Text('Save Data'),
                  ),
                ],
              ),
            ),
            // List all objects from PC class
            FutureBuilder<List<PC>>(
              future: getPCs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!
                        .map((e) => Row(
                              children: [
                                Expanded(child: Text('CPU ${e.cpu} %')),
                                Expanded(child: Text('RAM ${e.ram} %')),
                                Expanded(child: Text('Disk ${e.disk} %')),
                              ],
                            ))
                        .toList(),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            // where query
            const Text('Query PCs'),
            FutureBuilder<List<PC>>(
              future: queryPCs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!
                        .map((e) => Row(
                              children: [
                                Expanded(child: Text('CPU ${e.cpu} %')),
                                Expanded(child: Text('RAM ${e.ram} %')),
                                Expanded(child: Text('Disk ${e.disk} %')),
                              ],
                            ))
                        .toList(),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
