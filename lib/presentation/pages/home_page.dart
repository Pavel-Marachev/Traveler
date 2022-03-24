import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:traveler/presentation/widgets/tile_with_number_of_travel.dart';
import 'package:flutter_svg/svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days = 120;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/images/background_mountains.png",
            height: double.infinity,
            width: double.infinity,
          ),
          Column(
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
                                          text: "$days",
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
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(15),
        height: 60,
        decoration: BoxDecoration(
          color: kBackgroundWidgetColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(
              "assets/images/list_icon.svg",
              color: kWidgetColor,
            ),
            SvgPicture.asset(
              "assets/images/home_icon.svg",
              color: kWidgetColor,
            ),
            SvgPicture.asset(
              "assets/images/travel_add_icon.svg",
              color: kWidgetColor,
            ),
          ],
        ),
      ),
    );
  }
}
