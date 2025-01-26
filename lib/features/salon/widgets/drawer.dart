part of '../salon.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<GlobalCubit>();
    return Drawer(
      width: 272.responsiveWidth,
       child: Padding(
         padding:  EdgeInsets.symmetric(vertical: 60.responsiveHeight),
         child: Column(
           children: [
             SvgPicture.asset(AppImagesAssets.sAvatar),
             AppSize.s8.sizedBoxHeight,
              Text(
                  prefsService.loadUserData()?.name ?? "",
               textAlign: TextAlign.center,
               style: AppTextStyle.bodyMedium14.copyWith(
                 color: cubit.isDarkTheme() ? Colors.white : const Color(0xFF6C6C6C),
                 fontWeight: AppFontWeight.regular2W500,
               )
             ),
              if(prefsService.loadUserData()?.email != null)
              Text(
                  prefsService.loadUserData()?.email ?? "",
               style: AppTextStyle.bodySmall12.copyWith(
                 color: cubit.isDarkTheme() ? Colors.white : const Color(0xFF6C6C6C),
                 fontSize: AppFontSize.sp12.responsiveFontSize,
                 fontWeight: AppFontWeight.regularW400,
               )
             ),
             AppSize.s16.sizedBoxHeight,
              Divider(
               color: AppColors.borderColor,
             ),
             AppSize.s32.sizedBoxHeight,
             DrawerItem(
               onTap: (){
                 context.read<GlobalCubit>().toggleLanguage(context);
                 //RouteManager.rPopRoute(context);
               },
               title: LocaleKeys.language.tr(),
               icon: AppIconsAssets.sLanguage,
             ),
             AppSize.s16.sizedBoxHeight,
             DrawerItem(
               title: LocaleKeys.theme.tr(),
               onTap: (){
                 context.read<GlobalCubit>().toggleTheme();
                // RouteManager.rPopRoute(context);
               },
               icon: AppIconsAssets.sTheme,
             ),
             const Spacer(),
             BlocProvider(
               create: (context) => AuthCubit(authRepository),
               child: BlocConsumer<AuthCubit,AuthState>(
                 listener: (context, state) {
                   if(state.isLogoutLoaded){
                     RouteManager.rPushNamedAndRemoveUntil(context: context, rName: AppRoutesNames.rLoginScreen);
                   }
                 },
                 builder: (context, state) {
                   return CustomInkWell(
                     onTap: (){
                       context.read<AuthCubit>().logout();
                     },
                     child:Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SvgPicture.asset(AppIconsAssets.sLogout),
                         AppSize.s12.sizedBoxWidth,
                         Text(
                           LocaleKeys.logout.tr(),
                           style: AppTextStyle().w600.bodyMedium14.copyWith(
                             color: const Color(0xFFDB2524),
                           ),
                         )
                       ],
                     ),
                   );
                 },),
             )



           ],
         ),
       ),
    );
  }
}


class DrawerItem extends StatelessWidget {
  final String icon;
  final String title;
  final void Function()? onTap;
  const DrawerItem({super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    var cubit = context.watch<GlobalCubit>();
    return  ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(icon),
      title:  Text(
        title,
        style: AppTextStyle().w600.bodySmall12.copyWith(
          color: cubit.isDarkTheme()?Colors.white:AppColors.blackTextColor
        )),
      trailing:  Icon(Icons.arrow_forward_ios_rounded,color: cubit.isDarkTheme() ? AppColors.darkStroke : AppColors.primaryColor,),
    );
  }
}

