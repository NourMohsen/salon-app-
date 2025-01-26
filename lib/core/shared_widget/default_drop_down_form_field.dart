import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/config/cubit/global_cubit/global_cubit.dart';
import 'package:salon_app/config/resources/app_text_style.dart';
import 'package:salon_app/config/resources/app_values.dart';
import 'package:salon_app/config/responsive/responsive_extensions.dart';
import '../../config/resources/app_colors.dart';
import '../../config/resources/app_constants.dart';
import '../../config/responsive/responsive.dart';



class DefaultDropDownFormField<T> extends StatefulWidget {
  final String hintText;
  final String label;
  final List<DropdownMenuItem<T>> items;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final T value;
  const DefaultDropDownFormField({super.key, required this.hintText, required this.label, required this.items, this.onChanged, required this.value, this.validator,});

  @override
  State<DefaultDropDownFormField<T>> createState() => _DefaultDropDownFormFieldState<T>();
}

class _DefaultDropDownFormFieldState<T> extends State<DefaultDropDownFormField<T>> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label,style: AppTextStyle().w500.bodyLarge16.copyWith(
          color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor,
        )),
        AppSize.s10.sizedBoxHeight,
        DropdownButtonFormField<T>(
          items: widget.items,
          onChanged: (value){
            widget.onChanged?.call(value);
            setState(() {});
          },
          value: widget.value,
          validator: widget.validator,
          isExpanded: true,
          icon: Icon(Icons.keyboard_arrow_down,color: AppColors.greyColor),
          style: AppTextStyle().w500.bodySmall12.copyWith(
    color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.greyColor ,

    ),
          hint: Text(widget.hintText,style: TextStyle(
              color: context.watch<GlobalCubit>().isDarkTheme() ? null : AppColors.greyColor ,
              fontSize: 12,
              fontWeight: FontWeight.w500
          ),),
          decoration: InputDecoration(
            filled: context.watch<GlobalCubit>().isDarkTheme(),
            fillColor: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.lightBlackColor :AppColors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),

            border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    ResponsiveManager.getSize(AppConstants.appBorderRadiusR10)
                ),
                borderSide: !context.watch<GlobalCubit>().isDarkTheme() ? BorderSide(
                  color: AppColors.borderColor,
                ) : const BorderSide(
                    color: Colors.transparent
                )
            ),

            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    ResponsiveManager.getSize(AppConstants.appBorderRadiusR10)
                ),
                borderSide: !context.watch<GlobalCubit>().isDarkTheme() ? BorderSide(
                  color: AppColors.borderColor,
                ) : const BorderSide(
                    color: Colors.transparent
                )
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                    ResponsiveManager.getSize(AppConstants.appBorderRadiusR10)
                ),
                borderSide: !context.watch<GlobalCubit>().isDarkTheme() ? BorderSide(
                  color: AppColors.borderColor,
                ) : const BorderSide(
                    color: Colors.transparent
                )
            ),

          ),
        ),
      ],
    );
  }
}
