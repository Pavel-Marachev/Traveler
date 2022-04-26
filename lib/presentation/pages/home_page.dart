import 'package:flutter/material.dart';
import 'package:traveler/presentation/pages/authorization_page.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:traveler/presentation/widgets/tile_with_number_of_travel.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              gradient: LinearGradient(
                begin: Alignment(0.5, 1),
                end: Alignment(0.5, -1),
                colors: <Color>[
                  kMainColor,
                  kBackgroundWidgetColor.withOpacity(0.9),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: kBackgroundWidgetColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AuthorizationPage())),
                          child: SvgPicture.asset(
                            "assets/images/logout_icon.svg",
                            color: kWidgetColor,
                          ),
                        ),
                        const Text("Traveler", style: kTextStyleTitle),
                        SvgPicture.asset(
                          "assets/images/logout_icon.svg",
                          color: Colors.transparent,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: kWidgetColor.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
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
              color: kMainColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: kBackgroundWidgetColor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: Offset(0, 4),
                ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
      //bottomNavigationBar: const MyTabBar(),
    );
  }
}
