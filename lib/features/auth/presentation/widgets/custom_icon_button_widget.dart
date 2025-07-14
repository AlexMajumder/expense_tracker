import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomIconButton extends StatelessWidget {
  final String svgPath;

  const CustomIconButton({super.key, required this.svgPath, this.width, this.height, this.boxFit});

  final double? width;
  final double? height;
  final BoxFit? boxFit;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal:32,vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE8DEF8),width: 1.1,),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SvgPicture.asset(
        svgPath,
        fit: BoxFit.contain,
      ),
    );
  }
}