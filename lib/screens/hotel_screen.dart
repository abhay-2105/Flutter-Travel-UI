import 'package:flutter/material.dart';
import 'package:travel/models/destination_model.dart';
import 'package:travel/models/hotel_model.dart';

class HotelScreen extends StatelessWidget {
  final Destination destination;
  const HotelScreen({required this.destination, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[30],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
          color: Colors.black,
        ),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => print('Search Button'),
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.asset(
                height: 350,
                destination.imageUrl!,
                fit: BoxFit.cover,
              ),
              Container(
                height: 350,
                decoration: const BoxDecoration(
                  // color: Colors.red,
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black54],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 10,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 15, bottom: 15, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination.city!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                destination.country!,
                                style: const TextStyle(
                                    color: Colors.white60, fontSize: 25),
                              )
                            ],
                          ),
                          IconButton(
                            onPressed: () => print('location'),
                            icon: Icon(
                              size: 30,
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Stack(alignment: Alignment.centerLeft, children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 30, bottom: 10, top: 10),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        elevation: 5,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 170,
                          width: MediaQuery.of(context).size.width * 0.85,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 85, top: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.36,
                                        child: Text(activities[index].name!,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black,
                                                fontSize: 18)),
                                      ),
                                      Text(
                                        '\$${activities[index].price}',
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 25),
                                      )
                                    ]),
                                Text(
                                  '${activities[index].type}',
                                  style: TextStyle(
                                      color: Colors.grey[500], fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    // Icon(Icons.star),
                                    for (int i = 0;
                                        i <= activities[index].rating!;
                                        i++)
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Colors.amber,
                                      )
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[50],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                        activities[index].startTimes![0],
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.blue[50],
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Text(
                                          style: const TextStyle(fontSize: 18),
                                          activities[index].startTimes![1]),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        activities[index].imageUrl!,
                        fit: BoxFit.cover,
                        height: 150,
                        width: 120,
                      ),
                    ),
                  ]),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
