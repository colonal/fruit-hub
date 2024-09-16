import 'package:e_commerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: TextField(
          decoration: InputDecoration(
            border: buildBorder(),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
            hintText: "ابحث عن.......",
            hintStyle:
                TextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),
            fillColor: Colors.white,
            filled: true,
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 20, maxWidth: 36),
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 16),
              child: SvgPicture.asset(Assets.imagesSearchNormal),
            ),
            suffixIconConstraints:
                const BoxConstraints(maxHeight: 20, maxWidth: 20),
            suffixIcon: SvgPicture.asset(Assets.imagesSearchFilter),
          ),
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          smartDashesType: SmartDashesType.enabled,
          smartQuotesType: SmartQuotesType.enabled,
          onTapOutside: (event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(color: Color(0xFFFFFFFF)),
    );
  }
}
