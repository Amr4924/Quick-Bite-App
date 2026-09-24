import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/routing/router.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 390.w,
      height: 390.h,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 32.h, horizontal: 28.w),
        child: Column(
          children: [
            Text(
              "Delicious food,\ndelivered fast.",
              style: TextStyles.font26BlackBold,
            ),
            verticalSpacing(14),
            Text(
              'Order your favorite meals from the best\nlocal spots and get them to your door\nhot and fresh.',
              style: TextStyles.font15WarmGrayRegular,
              textAlign: TextAlign.center,
            ),
            verticalSpacing(90),
            SizedBox(
              width: 344.w,
              height: 56.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.primaryColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.authScreen);
                },
                child: Text(
                  "Get Started",
                  style: TextStyles.font16WhiteSemiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
