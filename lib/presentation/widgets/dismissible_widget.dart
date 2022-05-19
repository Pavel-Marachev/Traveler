import 'package:flutter/material.dart';
import 'package:traveler/presentation/theme/constants.dart';

class DismissibleWidget extends StatelessWidget {
  final Function(DismissDirection direction) confirmDismiss;
  final Function(bool isOpen) onExpansionChanged;
  final String placeName;
  final int rate;
  final String dismissKey;
  final bool isLoadingPlaceInformation;
  final String? description;
  final String? image;
  final DismissDirection direction;

  const DismissibleWidget({
    Key? key,
    required this.confirmDismiss,
    required this.placeName,
    required this.rate,
    required this.onExpansionChanged,
    required this.dismissKey,
    required this.isLoadingPlaceInformation,
    required this.description,
    required this.image,
    this.direction = DismissDirection.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: kMainColor,
        boxShadow: kMainShadow,
      ),
      child: Dismissible(
        key: Key(dismissKey),
        direction: direction,
        background: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kAddColor,
          ),
          child: const Align(
            child: Padding(
              padding: EdgeInsetsDirectional.only(start: 16),
              child: Icon(Icons.favorite),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: kDeleteColor,
          ),
          child: const Align(
            child: Padding(
              padding: EdgeInsetsDirectional.only(end: 16),
              child: Icon(Icons.delete_forever),
            ),
            alignment: Alignment.centerRight,
          ),
        ),
        confirmDismiss: (direction) async => confirmDismiss(direction),
        child: Container(
          decoration: BoxDecoration(
            color: kMainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ExpansionTile(
            iconColor: kWidgetColor,
            title: Text(
              placeName,
              style: kTextStyleTitle,
            ),
            subtitle: Text(
              'Рейтинг: $rate',
              style: kTextStyleTitle,
            ),
            onExpansionChanged: (isOpen) => onExpansionChanged(isOpen),
            childrenPadding: const EdgeInsets.all(20),
            children: isLoadingPlaceInformation
                ? [
                    const CircularProgressIndicator(
                      color: kWidgetColor,
                    ),
                  ]
                : [
                    if (image != null)
                      ClipRRect(
                        child: Image.network(image!),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    if (image != null) const SizedBox(height: 5),
                    Text(
                      description ?? 'Нет описания',
                      style: kTextStyleFootnote.copyWith(color: kWidgetColor),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
