import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../config/resources/app_text_style.dart';
import '../../config/responsive/responsive_extensions.dart';
import '../../config/resources/app_colors.dart';
import '../../config/resources/app_constants.dart';
import '../../config/resources/app_values.dart';

class DefaultButtonWidget extends StatelessWidget {
  final Color buttonColor;
  final Color labelColor;
  final bool isExpanded;
  final String label;
  final Function() onTap;
  final double width;
  final double height;
  final double borderSize;
  final Color borderColor;
  final double textVerticalPadding;
  final double textHorizontalPadding;
  final double textFontSize;
  final TextStyle? textStyle;
  final double elevation;
  final String? icon;

  const DefaultButtonWidget({
    super.key,
    this.buttonColor = AppColors.primaryColor,
    this.labelColor = AppColors.white,
    this.isExpanded = true,
    required this.label,
    required this.onTap,
    this.width = AppSize.s60,
    this.height = AppSize.s64,
    this.borderSize = AppConstants.appBorderRadiusR16,
    this.borderColor = AppColors.primaryColor,
    this.textVerticalPadding = AppPadding.p10,
    this.textFontSize = AppFontSize.sp18,
    this.textHorizontalPadding = AppPadding.p16,
    this.textStyle,
    this.elevation = AppConstants.appElevationR8,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: buttonColor,
      textColor: labelColor,
      elevation: elevation,
      minWidth: isExpanded ? double.infinity : width.responsiveWidth,
      height: height.responsiveHeight,
      padding: EdgeInsetsDirectional.symmetric(
        vertical: textVerticalPadding.responsiveSize,
        horizontal: textHorizontalPadding.responsiveSize,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderSize.responsiveSize),
        side: BorderSide(
          color: borderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: textStyle ??
                const AppTextStyle().titleSmall18.copyWith(
                  color: labelColor,
                  fontSize: textFontSize.responsiveFontSize,
                  fontWeight: AppFontWeight.boldW700
                ),
          ),
          if(icon != null)...[
          AppSize.s40.sizedBoxWidth,
          SvgPicture.asset(icon!)]
        ],
      ),
    );
  }
}


