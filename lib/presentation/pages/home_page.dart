import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:traveler/presentation/widgets/tile_with_number_of_travel.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints.expand(),
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage("assets/images/background_mountains.jpg"),
      //     fit: BoxFit.cover,
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints.tightFor(
                  height: MediaQuery.of(context).size.height / 2),
              decoration: BoxDecoration(
                color: kBackgroundWidgetColor.withOpacity(0.9),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(50)),
              ),
              child: SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      const Text("Traveler", style: kTextStyleTitle),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: kWidgetColor.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: RichText(
                                text: TextSpan(
                                  style: kTextStyleTitle,
                                  children: [
                                    const TextSpan(
                                        text:
                                            "Следующее увлекательное приключение будет через "),
                                    TextSpan(
                                        text: "122",
                                        style: kTextStyleTitle.copyWith(
                                            fontSize: 22)),
                                    const TextSpan(text: " дней"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            TileWithNumberOfTravel(
                              title: "Выполнено",
                              travelCount: 1,
                            ),
                            SizedBox(width: 20),
                            TileWithNumberOfTravel(
                              title: "Запланировано",
                              travelCount: 15,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 35),
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
                color: kBackgroundWidgetColor.withOpacity(0.9),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            const Spacer(),
          ],
        ),
        //bottomNavigationBar: const MyTabBar(),
      ),
    );
  }
}
