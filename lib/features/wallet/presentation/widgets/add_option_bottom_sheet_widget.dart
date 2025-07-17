import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../app/assets_path.dart';

void AddOptionBottomSheedWidget(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(38),
        child: Column(
          spacing: 16,
          children: [
            Text(
              'Select  an option',
              style: ThemeData().textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16,),
            _optionItem(title: 'Cards', imagePath: AssetsPath.cardSvg, imageHeight: 28),
            _optionItem(title: 'Bank Account', imagePath: AssetsPath.bankSvg, imageHeight: 36),
            _optionItem(title: 'Others', imagePath: AssetsPath.cashSvg, imageHeight: 39),
          ],
        ),
      );
    },
  );
}

Widget _optionItem({required String title,
  required String imagePath,
  required double imageHeight,
}) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 12,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: ThemeData().textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        SvgPicture.asset(height: imageHeight, width: 45, imagePath, fit: BoxFit.cover),
      ],
    ),
  );
}
