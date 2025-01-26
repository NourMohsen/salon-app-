import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:salon_app/config/cubit/global_cubit/global_cubit.dart';
import 'package:salon_app/config/resources/app_text_style.dart';
import '../../config/resources/app_colors.dart';
import '../../config/resources/app_constants.dart';
import '../../config/responsive/responsive_extensions.dart';

class PinCodeFieldWidget extends StatelessWidget {
  final Function(String) onComplete;

  const PinCodeFieldWidget({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.darkStroke : AppColors.primaryColor,
        keyboardType: TextInputType.number,
        textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: AppFontSize.sp20.responsiveFontSize,
              color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.darkStroke : AppColors.primaryColor,
              fontWeight: FontWeight.bold,
        ),
        length: 4,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(
                AppConstants.appBorderRadiusR10.responsiveSize),
            fieldHeight: 56.responsiveHeight,
            fieldWidth:  56.responsiveWidth,
            borderWidth: 1,
            activeColor: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.darkStroke : AppColors.primaryColor,
            inactiveColor: AppColors.borderColor,
            inactiveFillColor: AppColors.white,
            activeFillColor: AppColors.white,
            selectedColor: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.darkStroke : AppColors.primaryColor,
            selectedFillColor: AppColors.white,
            disabledColor: AppColors.white,
            errorBorderColor: AppColors.failColor),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        onCompleted: onComplete,
      ),
    );
  }
}

