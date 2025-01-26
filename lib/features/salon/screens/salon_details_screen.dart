part of '../salon.dart';
class SalonDetailsScreen extends StatefulWidget {
  const SalonDetailsScreen({super.key,});

  @override
  State<SalonDetailsScreen> createState() => _SalonDetailsScreenState();
}

class _SalonDetailsScreenState extends State<SalonDetailsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: BlocConsumer<SalonCubit, SalonState>(
          builder: (context, state) {
            var salonDetails = state.salonDetails ?? SalonModel();
            return Skeletonizer(
              enabled: state.isSalonDetailsLoading || state.isServicesLoading,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      expandedHeight: 330.responsiveHeight,
              leading: InkWell(
                onTap: () => RouteManager.rPopRoute(context),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  width: 40.responsiveWidth,
                  height: 40.responsiveHeight,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(),
                  ),
                  child:  Icon(
                    Icons.arrow_back_outlined,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
                      pinned: true,
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.black : AppColors.white,
                      flexibleSpace: FlexibleSpaceBar(
                        background: NullableNetworkImage(
                          height: 330.responsiveHeight,
                          width: double.infinity,
                          imagePath: salonDetails.image,
                          fit: BoxFit.fill, notHaveImage: salonDetails.image == null,
                        ),
                      ),
                    ),
                  ];
                },
                body: Column(
                  children: [
                    // Container with TabBar and TabBarView
                    Container(
                      decoration: BoxDecoration(
                        color: context.watch<GlobalCubit>().isDarkTheme()
                            ? AppColors.black
                            : AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(AppSize.s16.responsiveSize),
                          topRight: Radius.circular(AppSize.s16.responsiveSize),
                        ),
                      ),
                      child: Column(
                        children: [
                          SalonDetailsCard(salonDetails: salonDetails),
                          AppSize.s16.sizedBoxHeight,
                          ShareSalonWidget(salonDetails: salonDetails),
                          AppSize.s16.sizedBoxHeight,
                          Container(
                            height: AppSize.s8.responsiveHeight,
                            decoration: BoxDecoration(
                              color: context.watch<GlobalCubit>().isDarkTheme()
                                  ? AppColors.lightBlackColor
                                  : AppColors.borderColor,
                            ),
                          ),
                          // TabBar
                          TabBar(
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(text: LocaleKeys.services.tr()),
                              Tab(text: LocaleKeys.salonWorkers.tr()),
                            ],
                            dividerColor: AppColors.dividerColor,
                            indicatorPadding: EdgeInsets.symmetric(horizontal: AppPadding.p16.responsiveWidth),
                          ),
                        ],
                      ),
                    ),
                    // TabBarView
                    Expanded(
                      child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          ServicesGridViewWidget(),
                          SalonWorkersListWidget()                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state.isError) {
              showSnackBar(description: state.error?.errorMessage ?? "", state: ToastStates.error, context: context);
            }
          },
        ),
      ),
    );
  }
}

