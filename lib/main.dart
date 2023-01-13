import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'data/hotelcontents.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: const Color.fromARGB(255, 234, 229, 229),
        textTheme: GoogleFonts.latoTextTheme(
          Theme.of(context).textTheme.apply(
                fontSizeFactor: 1.4,
                fontSizeDelta: 2.0,
              ),
        ),
      ),
      home: const HotelSearchPageUI(),
    );
  }
}

class HotelSearchPageUI extends StatelessWidget {
  const HotelSearchPageUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Icon(
                                  Ionicons.options_outline,
                                  size: 40,
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color.fromARGB(255, 234, 233, 233),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black,
                                    offset: Offset(0.0, 1.0), //(x,y)
                                    blurRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: const CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    'https://images.hindustantimes.com/img/2022/02/28/550x309/7832faee-9632-11ec-9470-469037641c48_1646069142106.jpg'),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          'Welcome back Yash!!',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: const Color.fromARGB(255, 234, 233, 233),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search for hotels..',
                                hintStyle: TextStyle(fontSize: 20)),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    // color: Colors.amberAccent,
                    height: 375,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Pickup from where you left us',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                Map data = hoteldetails[index];
                                return Card(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 220,
                                        width: 240,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          color: Colors.black,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              data['hotelmage'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 225,
                                        left: 5,
                                        child: Text(
                                          data['hotelname'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        ),
                                      ),
                                      Positioned(
                                        top: 262,
                                        left: 5,
                                        child: Text(
                                          data['hoteldescription'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    // color: Colors.amberAccent,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Choose the best Hotel Package',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              InkWell(
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                Map data = hoteldetails[index];
                                return Card(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: 140,
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            bottomLeft: Radius.circular(15),
                                          ),
                                          color: Colors.black,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                              data['hotelmage'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
                                        left: 150,
                                        child: Text(
                                          data['hotelname'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Positioned(
                                        top: 37,
                                        left: 150,
                                        child: Text(
                                          data['hoteldescription'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15),
                                        ),
                                      ),
                                      Positioned(
                                        top: 62,
                                        left: 150,
                                        child: Text(
                                          data['hotelrate'],
                                          style: const TextStyle(fontSize: 13),
                                        ),
                                      ),
                                      Positioned(
                                        top: 80,
                                        left: 150,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.star,
                                                color: Colors.yellow),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              data['hotelrating'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 70,
                                        right: -25,
                                        child: Container(
                                          height: 50,
                                          width: 100,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              'Book \nNow',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              // scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        // barHeight: 50,
        // domeCircleColor: Colors.black,
        domeHeight: 10,
        barColor: Colors.black,
        selectedIndex: 0,
        onTabChange: (clickedIndex) {},
        tabs: [
          MoltenTab(
            icon: const Icon(Icons.home),
          ),
          MoltenTab(
            icon: const Icon(Icons.search),
          ),
          MoltenTab(
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
