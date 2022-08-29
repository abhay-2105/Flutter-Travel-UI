import 'package:flutter/material.dart';
import 'package:travel/widgets/exclusive_hotels.dart';

import '../widgets/header_icons.dart';
import '../widgets/top_destinations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[30],
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
              child: const Text('What you would like to find?',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700)),
            ),
          ),
          const SliverToBoxAdapter(
            child: HeaderIcons(),
          ),
          const SliverToBoxAdapter(
            child: TopDestinations(),
          ),
          const SliverToBoxAdapter(
            child: ExclusiveHotels(),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.shopping_bag_outlined),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.circle),
          ),
        ],
      ),
    );
  }
}
