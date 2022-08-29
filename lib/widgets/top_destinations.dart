import 'package:flutter/material.dart';
import 'package:travel/models/destination_model.dart';
import 'package:travel/screens/hotel_screen.dart';

class TopDestinations extends StatelessWidget {
  const TopDestinations({Key? key}) : super(key: key);

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
                itemCount: destinations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => HotelScreen(
                                destination: destinations[index],
                              ))),
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
                              width: 230,
                              height: 140,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${destinations[index].activity} activities',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 30),
                                    ),
                                    Text(
                                      destinations[index].description!,
                                      style: TextStyle(
                                          // letterSpacing: 0.1,
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 100,
                            child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Material(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.transparent,
                                    elevation: 5,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.asset(
                                        height: 200,
                                        width: 200,
                                        destinations[index].imageUrl!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: const LinearGradient(
                                            colors: [
                                              Colors.transparent,
                                              Colors.black54
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 15),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            destinations[index].city!,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.send,
                                                color: Colors.white60,
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              ),
                                              Text(
                                                destinations[index].country!,
                                                style: const TextStyle(
                                                    color: Colors.white60,
                                                    fontSize: 20),
                                              )
                                            ],
                                          )
                                        ]),
                                  )
                                ]),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
