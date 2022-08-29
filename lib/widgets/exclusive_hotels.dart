import 'package:flutter/material.dart';

import '../models/hotel_model.dart';

class ExclusiveHotels extends StatelessWidget {
  const ExclusiveHotels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Destinations',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                TextButton(
                  onPressed: () => print('see All'),
                  child: const Text('See All'),
                )
              ],
            ),
          ),
          SizedBox(
            height: 340,
            // color: Colors.red,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 5,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: 250,
                            height: 140,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '${hotels[index].name}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    hotels[index].address!,
                                    style: TextStyle(
                                        // letterSpacing: 0.1,
                                        color: Colors.grey[500],
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15),
                                  ),
                                  Text(
                                    '\$${hotels[index].price}/night',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 100,
                          child:
                              Stack(alignment: Alignment.bottomLeft, children: [
                            Material(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.transparent,
                              elevation: 5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  height: 200,
                                  width: 220,
                                  hotels[index].imageUrl!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
