import 'package:flutter/material.dart';
import 'package:newsapp/views/pages/categories.dart';
import 'package:newsapp/widgets/navbar_widget.dart';
import 'pages/home_page.dart';
import 'pages/profile_page.dart';
import '../data/notifiers.dart';
import 'pages/search.dart';

List<Widget> pages = [
  NewsPage(),
  Categories(),
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
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Search()),
              );
            },
          ),
          Icon(Icons.notifications),
          IconButton(
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                return Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
            onPressed: () {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
            },
          ),
        ],
        
      ),
      
      
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages.elementAt(selectedPage);
        },
      ),
     
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
