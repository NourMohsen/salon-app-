part of '../salon.dart';

class ServicesGridViewWidget extends StatelessWidget {
  const ServicesGridViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalonCubit,SalonState>(builder: (context, state) {
      var services = state.services;
      return GridView.count(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.responsiveWidth,vertical: AppPadding.p32.responsiveHeight),
        crossAxisSpacing: AppSize.s20.responsiveWidth,
        mainAxisSpacing: AppSize.s24.responsiveHeight,
        childAspectRatio: AppReference.deviceWidth(context) / (AppReference.deviceHeight(context) * 0.54),
        crossAxisCount: 2,
        children:
        List.generate(services?.length ?? 0, (index) =>  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NullableNetworkImage(imagePath: services?[index].image ,width: 182.responsiveWidth,
              height: 146.responsiveHeight,fit: BoxFit.contain,notHaveImage: services?[index].image == null,),
            AppSize.s8.sizedBoxHeight,
            Text(
              services?[index].name ?? "",
              style:  AppTextStyle().bodyMedium14.copyWith(
                color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.descriptionColor,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        )),);
    },);
  }
}
