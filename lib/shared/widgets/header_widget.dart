import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/assets_path.dart';
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 287,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AssetsPath.primaryContainer,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: -22,
            left: -55,
            child: SvgPicture.asset(
              AssetsPath.primaryContainerTopDesign,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}