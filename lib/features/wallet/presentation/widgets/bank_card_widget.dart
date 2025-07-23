import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/assets_path.dart';

class BankCardWidget extends StatelessWidget {
  const BankCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.circular(23),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              AssetsPath.cardBackGroundSvg,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Debit',
                          style: TextStyle(
                            fontSize: 11.41,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Card',
                          style: TextStyle(
                            fontSize: 11.41,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        textAlign: TextAlign.left,
                        'Mono',
                        style: TextStyle(
                          fontSize: 13.41,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24),
                SvgPicture.asset(AssetsPath.chipSvg, width: 26, height: 20),
                SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '6219  8610  2888  8075',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      letterSpacing: 4,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Alex Majumder',
                      style: TextStyle(
                        fontSize: 13.69,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '5/26',
                      style: TextStyle(
                        fontSize: 13.69,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
