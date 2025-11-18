import 'package:BillMate/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GroupsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ListView(
      children: [
        Text('Groups: '),
        for (var group in appState.groups)
          ListTile(title: Text(group.toString()), leading: Text("icon")),
      ],
    );
  }
}
