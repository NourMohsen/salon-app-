part of '../salon.dart';

class SalonWorkersListWidget extends StatelessWidget {
  const SalonWorkersListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalonCubit,SalonState>(builder: (context, state) {
      var workers = state.salonDetails?.providers ?? [];
      return ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.responsiveWidth,vertical: AppPadding.p32.responsiveHeight),
          itemBuilder: (context, index) {

            return Container(
              padding:  EdgeInsets.all(AppPadding.p6.responsiveHeight),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s8.responsiveSize),
                  border: Border.all(color: AppColors.lightGreyColor)
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NullableNetworkImage(imagePath: workers[index].avatar,width: AppSize.s94.responsiveWidth,height: AppSize.s62.responsiveHeight,notHaveImage: workers[index].avatar == null, fit: BoxFit.cover,),
                  AppSize.s8.sizedBoxWidth,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workers[index].name ?? "",
                          style:  AppTextStyle().bodyMedium14.copyWith(
                            color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          workers[index].nationality ?? "",
                          style:  AppTextStyle().bodyMedium14.copyWith(
                            color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),


                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(AppPadding.p8.responsiveSize),
                    child: Row(
                      children: [
                        SvgPicture.asset(AppIconsAssets.sStar,height: AppPadding.p16.responsiveHeight,width: AppPadding.p16.responsiveWidth,),
                        AppSize.s4.sizedBoxWidth,
                        Text(
                          workers[index].rateAvg ??"",
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        )

                      ],
                    ),
                  )
                ],
              ),
            );
          }, separatorBuilder: (context, index) {
        return AppSize.s24.sizedBoxHeight;
      }, itemCount: workers.length);
    },
    );
  }
}
