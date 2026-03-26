import 'package:flutter/material.dart';
import 'package:newsapp/widgets/navbar_widget.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import '../data/notifiers.dart';

List<Widget> pages = [
  HomePage(),
  ProfilePage(),
  Center(child: Text("Video Page")),
];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dan tri'),
        centerTitle: true,
        leading: Icon(Icons.person),
        actions: [Icon(Icons.notifications)],
      ),
      body: ValueListenableBuilder(valueListenable: selectedPageNotifier, builder: (context, selectedPage, child) {
        return pages.elementAt(selectedPage);
      }),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
