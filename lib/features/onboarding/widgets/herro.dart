import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_bite/core/theming/color.dart';

class Herro extends StatelessWidget {
  const Herro({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 390.w,
          height: 400.h,
          color: ColorManager.primaryColor,
          child: Center(child: SvgPicture.asset('assets/svgs/Frame.svg')),
        ),
        Positioned(
          top: 80,
          left: 54,
          child: CircleAvatar(
            radius: 10.r,
            backgroundColor: ColorManager.secondry,
          ),
        ),
        Positioned(
          bottom: 76,
          right: 70,
          child: CircleAvatar(radius: 10.r, backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
