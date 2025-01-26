part of '../auth.dart';

class SelectGenderWidget extends StatelessWidget {

  const SelectGenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
      var cubit = context.read<AuthCubit>();
      return Row(children: [
        Radio(
          activeColor: AppColors.primaryLightColor,value: true, groupValue: cubit.isMale, onChanged: (value) {
          cubit.selectGender(value!);
        },),
        Text(LocaleKeys.male.tr(),style: AppTextStyle.bodyMedium14.copyWith(
            color: context.watch<GlobalCubit>().isDarkTheme()? AppColors.white : AppColors.textColor,
            fontWeight: AppFontWeight.regular2W500),),
        AppSize.s82.sizedBoxWidth,
        Radio(
          activeColor: AppColors.primaryLightColor,
          value: false, groupValue: cubit.isMale, onChanged: (value) {
          cubit.selectGender(value!);
        },),
        Text(LocaleKeys.female.tr(),style: AppTextStyle.bodyMedium14.copyWith(
            color: context.watch<GlobalCubit>().isDarkTheme()? AppColors.white : AppColors.textColor,
            fontWeight: AppFontWeight.regular2W500),),
      ],);
    },);
  }
}
