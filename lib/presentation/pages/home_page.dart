import 'package:flutter/material.dart';
import 'package:traveler/presentation/widgets/tile_with_number_of_travel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints.tightFor(
              height: MediaQuery.of(context).size.height / 2),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(50)),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Traveler",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          TileWithNumberOfTravel(),
                          SizedBox(width: 20),
                          TileWithNumberOfTravel(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            constraints: BoxConstraints.tightFor(
                height: MediaQuery.of(context).size.height / 4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.9),
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
