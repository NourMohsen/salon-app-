part of '../salon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<SalonCubit>();
    cubit.state.pagingController.addPageRequestListener((pageKey) {
      cubit.getSalons(pageKey);
    });
  }

  @override
  void dispose() {
    context.read<SalonCubit>().state.pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const DrawerWidget(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: BlocBuilder<GlobalCubit, GlobalState>(
  builder: (context, state) {
    return Text(
          LocaleKeys.barberSalons.tr(),
        );
  },
),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openEndDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: PagedListView<int, SalonModel>.separated(
        separatorBuilder: (context, index) {
          return AppSize.s24.sizedBoxHeight;
        },
        pagingController: context.watch<SalonCubit>().state.pagingController,
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p24.responsiveWidth,
        ),
        builderDelegate: PagedChildBuilderDelegate<SalonModel>(
          itemBuilder: (context, item, index) => SalonItem(
            salonModel: item,
          ),
          firstPageProgressIndicatorBuilder: (context) => const LoadingWidget(),
          newPageProgressIndicatorBuilder: (context) => const LoadingWidget(),
          noItemsFoundIndicatorBuilder: (context) =>
              Center(child: Text(LocaleKeys.noItemsFound.tr())),
        ),
      ),
    );
  }
}