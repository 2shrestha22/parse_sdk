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
    final res = await ParseObject().query('PC').get();
    return (jsonDecode(res.body)['results'] as List)
        .map((e) => PC.fromJson(e))
        .toList();
  }

  Future<List<PC>> queryPCs() async {
    final res = await ParseObject()
        .query('PC')
        .where('createdAt', isNotEqualTo: DateTime(2021, 11, 28))
        .where('cpu', isLessThanOrEqualTo: 60, isNotEqualTo: 35)
        .orderByAscending('ram')
        .limit(50)
        .get();
    return (jsonDecode(res.body)['results'] as List)
        .map((e) => PC.fromJson(e))
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
                      ParseObject().create(
                        className: 'PC',
                        data: {
                          "cpu": int.parse(cpuTextEditingController.text),
                          "ram": int.parse(ramTextEditingController.text),
                          "disk": int.parse(diskTextEditingController.text),
                        },
                      ).then((value) {
                        setState(() {});
                      });
                    },
                    child: const Text('Save Data'),
                  ),
                ],
              ),
            ),

            // where query
            const Text('Query PCs'),
            FutureBuilder<List<PC>>(
              future: queryPCs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!
                        .map((e) => PcListItem(
                            pc: e,
                            onDelete: () {
                              ParseObject()
                                  .delete(className: 'PC', objectId: e.objectId)
                                  .then((value) {
                                setState(() {});
                              });
                            }))
                        .toList(),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            // List all objects from PC class
            const Text('All PCs'),
            FutureBuilder<List<PC>>(
              future: getPCs(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data!
                        .map((e) => PcListItem(
                              pc: e,
                              onDelete: () {
                                ParseObject()
                                    .delete(
                                        className: 'PC', objectId: e.objectId)
                                    .then((value) {
                                  setState(() {});
                                });
                              },
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

class PcListItem extends StatelessWidget {
  const PcListItem({Key? key, required this.pc, required this.onDelete})
      : super(key: key);

  final PC pc;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // height: 40,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('CPU ${pc.cpu} %'),
                        Text('RAM ${pc.ram} %'),
                        Text('Disk ${pc.disk} %'),
                      ],
                    ),
                    Text(pc.createdAt.toString().substring(0, 10)),
                  ],
                ),
              ),
              IconButton(onPressed: onDelete, icon: const Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}
