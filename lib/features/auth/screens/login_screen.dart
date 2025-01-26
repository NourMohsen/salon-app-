part of '../auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  late GlobalKey<FormState> formKey;

  late TextEditingController phoneController;

  @override
  void initState() {
    phoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppSize.s16.responsiveWidth,vertical: AppSize.s30.responsiveWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               HeaderWidget(
                title: LocaleKeys.login.tr(),
              ),
              AppSize.s48.sizedBoxHeight,
              Text(LocaleKeys.phoneNumber.tr(),
                style: AppTextStyle().w400.bodyLarge16.copyWith(
                  color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor,
                )),
              AppSize.s16.sizedBoxHeight,
              Form(
                key: formKey,
                child: TextFormFieldWidget(
                  controller: phoneController,
                  inputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  onFieldSubmitted: (p0){},
                  validator: AppValidation.phoneNumberValidation(),
                  hintText: "05xxxxxxx",prefixIcon: SizedBox(
                  height: AppSize.s10.responsiveHeight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: AppPadding.p16.responsiveWidth),
                        child: SvgPicture.asset(
                            AppIconsAssets.sSaudiFlag
                        ),
                      ),
                       Text(
                        '+966',
                        style: AppTextStyle().bodySmall12.copyWith(
                          fontWeight: AppFontWeight.regular2W500,
                          color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.blackTextColor,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: AppPadding.p10.responsiveHeight,horizontal: AppPadding.p16.responsiveWidth),
                        child: VerticalDivider(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                ),),
              ),
              AppSize.s36.sizedBoxHeight,
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.isError) {
                    showSnackBar(description: state.error ?? "", state: ToastStates.error, context: context);
                  }
                  if (state.isLoginLoaded) {
                    // RouteManager.rPopRoute(context);
                    RouteManager.rPushNamed(context: context,
                        rName: AppRoutesNames.rVerificationScreen,
                      arguments: phoneController.text,
                    );
                  }
                },
                builder: (context, state) {
                  if (state.isLoginLoading) {
                    return const LoadingWidget();
                  } else {
                    return DefaultButtonWidget(
                      label: LocaleKeys.login.tr(),
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          context
                              .read<AuthCubit>()
                              .login(UserModel(phone: phoneController.text,gender: "male"));
                        }
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
