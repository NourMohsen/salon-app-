part of '../auth.dart';

class VerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const VerificationScreen({super.key, required this.phoneNumber});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late TextEditingController pinCodeController;
  bool reSend = false;
  @override
  void initState() {
    pinCodeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    pinCodeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.p16.responsiveWidth,vertical: AppPadding.p30.responsiveHeight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(title: LocaleKeys.verificationCode.tr()),
              AppSize.s38.sizedBoxHeight,
              Text.rich(
                   TextSpan(
                children: [
                   TextSpan(
                    text: LocaleKeys.typeVerificationCodeThatSentTo.tr(),
                    style: AppTextStyle().w500.bodyMedium14.copyWith(
                      color: context.watch<GlobalCubit>().isDarkTheme()? AppColors.white : AppColors.black
                    ),
                  ),
                    TextSpan(
                    text: " ${widget.phoneNumber} ",
                      style: AppTextStyle().w700.bodyLarge16.copyWith(
                          color: context.watch<GlobalCubit>().isDarkTheme()? AppColors.white : AppColors.blackTextColor
                      ),
                  ),
                  TextSpan(
                    text: LocaleKeys.edit.tr(),
                      style: AppTextStyle().bodyMedium14.copyWith(
                        fontWeight: AppFontWeight.boldW700,
                          color: context.watch<GlobalCubit>().isDarkTheme()? AppColors.white : AppColors.blackTextColor,
                          decoration: TextDecoration.underline
                      ),
                     recognizer: TapGestureRecognizer()..onTap=(){
                       RouteManager.rPopRoute(context);

                     },

                  ),
                ]
              )),
              AppSize.s32.sizedBoxHeight,
              PinCodeFieldWidget(
                onComplete: (value){
                  pinCodeController.text = value;
                },
              ),

              AppSize.s16.sizedBoxHeight,
              StatefulBuilder(
                builder: (context, setBuilderState) {
                  return Row(
                    children: [
                      Text(
                        "${LocaleKeys.didNotGetCode.tr()} ",
                        style: AppTextStyle().w500.bodyMedium14.copyWith(
                          color: context.watch<GlobalCubit>().isDarkTheme()? AppColors.white : AppColors.blackTextColor,
                        ),
                      ),
                      if (!reSend)
                        TimerToResend(
                          canSend: (canSend) {
                            setBuilderState(() {
                              reSend = canSend;
                            });
                          },
                        ),
                      if(reSend)
                      TextButton(
                        onPressed: reSend
                            ? () {
                          context.read<AuthCubit>().login(UserModel(
                              phone: widget.phoneNumber
                          ));
                          setBuilderState(() {
                            reSend = false;
                          });
                        }
                            : () {},
                        child: Text(
                          "${LocaleKeys.resend.tr()} ",
                          style: AppTextStyle().bodyMedium14.copyWith(
                              color: context.watch<GlobalCubit>().isDarkTheme()? AppColors.white : AppColors.blackTextColor,
                              fontWeight: AppFontWeight.boldW700,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
              const Spacer(),
              BlocConsumer<AuthCubit,AuthState>(
                builder: (context, state) {
                  if(state.isActiveAccountLoading){
                    return const LoadingWidget();
                  }else{
                    return  DefaultButtonWidget(label: LocaleKeys.verifyNow.tr(), onTap: () {
                      if(pinCodeController.text.isEmpty){
                        showSnackBar(context: context,description: "من فضلك ادخل الكود",state: ToastStates.warning);
                        return;
                      }
                      context.read<AuthCubit>().activeAccount(widget.phoneNumber, pinCodeController.text);
                    },);
                  }
                },
                listener: (context, state) {
                  if(state.isActiveAccountLoaded){
                    if(state.isFirstLogin ?? true){
                      RouteManager.rPushReplacementNamed(context: context, rName: AppRoutesNames.rRegisterScreen);
                    }else{
                      RouteManager.rPushNamedAndRemoveUntil(context: context, rName: AppRoutesNames.rHomeScreen);
                    }
                  }
                  if(state.isError){
                    showSnackBar(context: context,description: state.error ?? "",state:ToastStates.error);
                  }
                },)

            ],
          ),
        ),
      ),
    );
  }
}
