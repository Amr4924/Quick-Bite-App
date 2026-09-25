import 'package:flutter/material.dart';
import 'package:quick_bite/core/helpers/spasing.dart';
import 'package:quick_bite/core/theming/color.dart';
import 'package:quick_bite/core/theming/style.dart';
import 'package:quick_bite/core/widgets/quick_bite_text_form.dart';

class HomeSearchHeader extends StatelessWidget {
  const HomeSearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("What would you like today?", style: TextStyles.font20BlackBold),
        verticalSpacing(20),
        QuickBiteTextForm(
          prefixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 18,
              color: ColorManager.deepTerracotta,
            ),
          ),
          hintText: "Search burgers, pizza, drinks...",
          hintStyle: TextStyles.font13DeepTerracottaRegular,
        ),
      ],
    );
  }
}
