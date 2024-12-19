import 'package:flutter/material.dart';

import 'database.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body:  Center(
          child: ElevatedButton(onPressed: runQuery, child: Text('Run Query'))
        ),
      )
    );
  }
}

void runQuery() async {

  final db = Database();

  await db.into(db.testTable).insert(
    TestTableCompanion.insert(
      data: "Test",
      createdAt: DateTime.now(),
    ),
  );
}


