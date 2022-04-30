import 'package:flutter/material.dart';
import 'package:traveler/presentation/pages/authorization_page.dart';
import 'package:traveler/presentation/theme/constants.dart';
import 'package:traveler/presentation/widgets/tile_with_number_of_travel.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints.tightFor(
              height: MediaQuery.of(context).size.height / 1.8),
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
            boxShadow: kMainShadow,
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
              leading: GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const AuthorizationPage())),
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: SvgPicture.asset(
                    "assets/images/logout_icon.svg",
                    color: kWidgetColor,
                  ),
                ),
              ),
              title: const Text("Traveler", style: kTextStyleTitle),
            ),
            body: Column(
              children: [
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
                                  style:
                                      kTextStyleTitle.copyWith(fontSize: 22)),
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
        const Spacer(),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          constraints: BoxConstraints.tightFor(
              height: MediaQuery.of(context).size.height / 4),
          decoration: BoxDecoration(
            color: kMainColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50),
            boxShadow: kMainShadow,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
