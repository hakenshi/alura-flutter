import 'package:flutter/material.dart';

AppBar buildAppHeader(BuildContext context) {
  return AppBar(
    leading: TextButton(
      onPressed: () => Navigator.pushNamed(context, "/"),
      child: Image.network(
          "https://static.wikia.nocookie.net/bhlx/images/6/6e/Ironblood-logo.png/revision/latest?cb=20230317170338"),
    ),
    title: const Text("Iron Blood"),
    backgroundColor: Colors.red.shade900,
  );
}
