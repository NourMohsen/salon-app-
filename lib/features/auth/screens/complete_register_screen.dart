part of '../auth.dart';

class CompleteRegisterScreen extends StatefulWidget {
   const CompleteRegisterScreen({super.key});

  @override
  State<CompleteRegisterScreen> createState() => _CompleteRegisterScreenState();
}

class _CompleteRegisterScreenState extends State<CompleteRegisterScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late FocusNode nameFocusNode;
  late FocusNode emailFocusNode;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    nameFocusNode = FocusNode();
    emailFocusNode = FocusNode();
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.responsiveWidth,vertical: AppPadding.p30.responsiveHeight),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderWidget(
                        title: LocaleKeys.register.tr(),
                      ),
                      AppSize.s32.sizedBoxHeight,
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormFieldWidget(
                              controller: nameController,
                                inputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                onFieldSubmitted: (p0){
                                FocusScope.of(context).nextFocus();
                                },
                                focusNode: nameFocusNode,
                                validator: AppValidation.nameValidation(),
                                hintText: LocaleKeys.enterYourFullName.tr(),
                                label: LocaleKeys.fullName.tr()),
                            AppSize.s16.sizedBoxHeight,
                            TextFormFieldWidget(
                              controller: emailController,
                              inputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                              focusNode: emailFocusNode,
                              validator: emailController.text.isEmpty ? null : AppValidation.emailValidation(),

                              onFieldSubmitted: (p0) {},
                              hintText: "${LocaleKeys.enterYourEmail.tr()} (${LocaleKeys.optional.tr()})",
                              label: LocaleKeys.email.tr(),isOptional: true,),
                            AppSize.s16.sizedBoxHeight,
                            Text(LocaleKeys.selectGender.tr(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                            AppSize.s10.sizedBoxHeight,
                            SelectGenderWidget(),
                            AppSize.s10.sizedBoxHeight,
                            BlocBuilder<AuthCubit,AuthState>(builder: (context, state) {
                              var cubit = context.read<AuthCubit>();
                              return DefaultDropDownFormField<int?>(
                                hintText: LocaleKeys.selectYourCity.tr(),
                                label: LocaleKeys.city.tr(),
                                items: cities.map((e) => DropdownMenuItem(value: e.cityId,child: Text(e.cityName ?? ""),)).toList(),
                                value: cubit.cityId,
                                onChanged: (value){
                                  cubit.selectCity(value!);
                                },
                                validator: (value) {
                                  if(value == null){
                                    return LocaleKeys.pleaseSelectYourCity.tr();
                                  }
                                  return null;
                                },);
                            },)
                          ],
                        ),
                      ),
                      AppSize.s10.sizedBoxHeight,
                       Text.rich(TextSpan(
                          text: "${LocaleKeys.whenRegisterYourAccountYouAgreeWith.tr()} ",style:AppTextStyle.bodySmall12.copyWith(
                           color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.primaryColor,
                           fontWeight: AppFontWeight.regular2W500),
                          children:  [
                            TextSpan(
                              text: LocaleKeys.termsAndConditions.tr(),
                              style: AppTextStyle().bodyMedium14.copyWith(
                                color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.primaryColor,
                                  fontWeight: AppFontWeight.boldW700,
                                  decoration: TextDecoration.underline,
                                  fontSize: AppFontSize.sp14.responsiveFontSize,
                                  decorationColor: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.black),
                            ),
                             TextSpan(
                              text: " ${LocaleKeys.barber.tr()}",
                               style: AppTextStyle.bodySmall12.copyWith(
                                   color: context.watch<GlobalCubit>().isDarkTheme() ? AppColors.white : AppColors.primaryColor,
                                   fontWeight: AppFontWeight.regular2W500),                            ),

                          ]
                      )),



                    ],
                  ),
                ),
              ),
              BlocConsumer<AuthCubit,AuthState>(
                builder: (context, state) {
                  if(state.isCompleteRegisterLoading){
                    return const LoadingWidget();
                  }else{
                    return  DefaultButtonWidget(label: LocaleKeys.register.tr(),onTap: (){
                      if(formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(UserModel(
                          name: nameController.text,
                          email: emailController.text,
                        ));
                      }

                    },);
                  }
                },
                listener: (context, state) {
                if(state.isCompleteRegisterLoaded){
                  RouteManager.rPushNamedAndRemoveUntil(context: context, rName:AppRoutesNames.rHomeScreen);
                }
                if(state.isError){
                  RouteManager.rPopRoute(context);
                  showSnackBar(description: state.error??"", state: ToastStates.error, context: context);
                }
              },)

            ],
          ),
        ),
      ),
    );
  }
}
