import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/config/responsive/responsive.dart';
import '../../config/cubit/global_cubit/global_cubit.dart';
import '../../config/resources/app_text_style.dart';
import '../../config/resources/app_values.dart';
import '../../config/responsive/responsive_extensions.dart';
import '../../config/resources/app_colors.dart';
import '../../config/resources/app_constants.dart';
import '../localization/locale_keys.g.dart';

class TextFormFieldWidget extends StatelessWidget {
  final double bottomSizedBox;
  final double topSizedBox;
  final double? hintTextSize;
  final TextEditingController controller;
  final TextDirection textDirection;

  final String? hintText;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final String? label;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction inputAction;
  final bool isObscureText;
  final bool isReadOnly;

  final IconData? suffixIcon;
  final Widget?  prefixIcon;
  final Function()? suffixIconOnPress;
  final String? Function(String?)? validator;
  final int maxLine;
  final bool isOptional;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPaymentScreen;
  final Widget? suffixWidget;
  final Color? suffixIconColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final Color backgroundColor;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    this.hintText,
    this.hintTextSize,
    required this.keyboardType,
    this.focusNode,
    this.horizontalPadding=10,
    this.verticalPadding=0,
    required this.inputAction,
    this.isObscureText = false,
    this.textDirection = TextDirection.rtl,
    this.suffixIcon,
    this.prefixIcon,
    this.suffixIconOnPress,
    this.validator,
    this.maxLine = 1,
     this.label,
    this.bottomSizedBox = 0,
    this.topSizedBox = 0,
    this.isOptional=false,
    required this.onFieldSubmitted,
    this.inputFormatters,
    this.isPaymentScreen = false,
    this.isReadOnly = false,
    this.suffixWidget, this.suffixIconColor,
    this.backgroundColor = AppColors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        topSizedBox.sizedBoxHeight,
        if(label != null)
          Text.rich(TextSpan(
              text: label,
              style: AppTextStyle().w500.bodyLarge16.copyWith(
                color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.textColor,),
              children: isOptional ? [
                TextSpan(
                  text: " (${LocaleKeys.optional.tr()})",
                  style: AppTextStyle().w500.bodySmall12.copyWith(color: AppColors.greyColor),
                )
              ] : null
          )),
        AppSize.s10.sizedBoxHeight,
        Directionality(
          textDirection: prefixIcon != null ? TextDirection.ltr : TextDirection.rtl,
          child: TextFormField(
            //textDirection: textDirection,
            readOnly: isReadOnly,
            controller: controller,
            autocorrect: true,
            maxLines: maxLine,
            validator: validator,
            style: AppTextStyle().bodyLarge16.copyWith(
              color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.textColor,
            ),
            keyboardType: keyboardType,
            cursorColor:  context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.primaryColor,
    focusNode: focusNode,
            onFieldSubmitted: onFieldSubmitted,
            textInputAction: inputAction,
            obscureText: isObscureText,
            enableSuggestions: true,
            decoration: InputDecoration(
              filled: context.watch<GlobalCubit>().isDarkTheme(),
              fillColor: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.lightBlackColor :null,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: isPaymentScreen
                  ? suffixWidget
                  : suffixIcon == null
                      ? null
                      : IconButton(
                          icon: Icon(
                            suffixIcon,
                            size: AppConstants.iconSizeS20,
                            color: suffixIconColor ?? AppColors.primaryColor,
                          ),
                          onPressed: suffixIconOnPress,
                        ),
              hintStyle: AppTextStyle().bodySmall12.copyWith(
                fontSize: hintTextSize ?? AppFontSize.sp12.responsiveFontSize,
                  color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.greyColor ,
                  fontWeight: AppFontWeight.regular2W500
              ),
              border:buildOutlineInputBorder(context),

              enabledBorder: buildOutlineInputBorder(context),
              focusedBorder: buildOutlineInputBorder(context),
              focusColor: AppColors.primaryColor,
              contentPadding:  EdgeInsets.symmetric(horizontal: horizontalPadding!, vertical: verticalPadding!),
            ),
            inputFormatters: inputFormatters,

          ),
        ),
        bottomSizedBox.sizedBoxHeight,
      ],
    );
  }

  OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    ResponsiveManager.getSize(AppConstants.appBorderRadiusR10)
                ),
                borderSide: !context.watch<GlobalCubit>().isDarkTheme() ? BorderSide(
                  color: AppColors.borderColor,
                ) : const BorderSide(
                    color: Colors.transparent
                )
            );
  }
}
