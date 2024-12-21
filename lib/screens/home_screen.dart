import 'package:alura_flutter/components/app_header.dart';
import 'package:alura_flutter/components/task.dart';
import 'package:alura_flutter/data/waifu_inherited.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: buildAppHeader(context),
      body: ListView(
        children: WaifuInherited.of(context).waifuList,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/form"),
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
