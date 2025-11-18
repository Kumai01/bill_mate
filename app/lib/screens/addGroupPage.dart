import 'package:BillMate/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddGroupPage extends StatelessWidget {
  final TextEditingController groupInputController;
  const AddGroupPage(this.groupInputController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Group')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            groupInputField(groupInputController),
            SizedBox(height: 10),
            addGivenGroupButton(groupInputController),
          ],
        ),
      ),
    );
    ;
  }
}

class groupInputField extends StatelessWidget {
  final TextEditingController groupInputController;
  const groupInputField(this.groupInputController, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: groupInputController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Group',
        ),
      ),
    );
  }
}

class addGivenGroupButton extends StatelessWidget {
  final TextEditingController groupInputController;
  const addGivenGroupButton(this.groupInputController, {super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return ElevatedButton(
      onPressed: () {
        if (groupInputController.text != "") {
          appState.addGroup(groupInputController.text);
          print(groupInputController.value);
          Navigator.pop(context);
        }
      },
      child: const Text('add'),
    );
  }
}
