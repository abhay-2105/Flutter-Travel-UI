import 'package:flutter/material.dart';
import 'package:travel/screens/hotel_screen.dart';
import 'package:travel/widgets/exclusive_hotels.dart';

import '../widgets/header_icons.dart';
import '../widgets/top_destinations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
    );
  }
}
