import 'package:BillMate/screens/groupsPage.dart';
import 'package:BillMate/screens/addGroupPage.dart';
import 'package:BillMate/screens/profilePage.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BillMate',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

// all important variables
class MyAppState extends ChangeNotifier {
  var groups = <String>[];

  void addGroup(String groupName) {
    groups.add(groupName);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// has all pages and pages indexes
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[GroupsPage(), ProfilePage()];

  static const List<Widget> _navBar = <Widget>[
    NavigationDestination(icon: Icon(Icons.explore), label: 'Groups'),
    NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
  ];

  void _onDestinationSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // for adding a group
  final groupInputController = TextEditingController();
  @override
  void dispose() {
    groupInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    // color: Theme.of(context).colorScheme.primaryContainer,

    return Scaffold(
      appBar: AppBar(title: const Text('BillMate'), centerTitle: true),
      body: Center(child: _pages.elementAt(_selectedIndex)),
      floatingActionButton: _selectedIndex == 0
          ? AddItemWidget(groupInputController)
          : null,
      bottomNavigationBar: NavigationBar(
        destinations: _navBar,
        selectedIndex: _selectedIndex,
        onDestinationSelected: _onDestinationSelected,
      ),
    );
  }
}

class AddItemWidget extends StatelessWidget {
  final TextEditingController groupInputController;
  const AddItemWidget(this.groupInputController);
  // const AddItemWidget(this.groupInputController, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (context) => AddGroupPage(groupInputController),
          ),
        );

        print("should navigate");
      },
      child: Icon(Icons.add),
    );
  }
}
