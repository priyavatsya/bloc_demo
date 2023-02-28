import 'package:flutter/material.dart';

import '../../model/infopage_model.dart';

class ListTileBuilder extends StatelessWidget {
  const ListTileBuilder(
      this.data, {
        Key? key,
      }) : super(key: key);

  final InfoPageModel data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:  Container(
      child: Center(
        child:Container(
          padding: EdgeInsets.all(20),
        child: ListTile(
          title: Text(
            data.name,
            style: const TextStyle(
                color: Colors.blue, fontSize: 25.0),
          ),
          subtitle: Text(
            data.job,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 20.00,
            ),
          ),
          trailing: Text(
            "ID: ${data.id}",
            style: const TextStyle(
                color: Colors.red, fontSize: 25.00),
          ),
        ),
        ),
      ),
    ),
    );
  }
}