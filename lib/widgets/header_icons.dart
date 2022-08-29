import 'package:flutter/material.dart';

class HeaderIcons extends StatefulWidget {
  const HeaderIcons({Key? key}) : super(key: key);

  @override
  State<HeaderIcons> createState() => _HeaderIconsState();
}

class _HeaderIconsState extends State<HeaderIcons> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.flight,
    Icons.car_rental,
    Icons.masks,
    Icons.motorcycle
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        itemCount: _icons.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: _selectedIndex == index
                    ? Colors.blue[50]
                    : Colors.grey[200],
                child: Icon(
                  _icons[index],
                  size: 40,
                  color: _selectedIndex == index ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
