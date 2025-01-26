import 'package:flutter/material.dart';
import '../../config/resources/app_text_style.dart';
import '../../config/responsive/responsive_extensions.dart';
import '../enum/enum_generation.dart';

void showSnackBar(
    {required String description,
    required ToastStates state,
    double? bottomPadding,
    required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    _messageSnackBar(
      description: description,
      bottomPadding: bottomPadding,
      state: state,
      context: context,
    ),
  );
}

void showSnackBarWithAction(
    {required String description,
    required ToastStates state,
    required BuildContext context,
    required IconData actionIcon,
    required String actionLabel,
    required VoidCallback onPressed}) {
  ScaffoldMessenger.of(context).showSnackBar(
    _messageSnackBarWithAction(
      description: description,
      state: state,
      context: context,
      actionIcon: actionIcon,
      actionLabel: actionLabel,
      onPressed: onPressed,
    ),
  );
}

SnackBar _messageSnackBarWithAction(
    {required String description,
    required ToastStates state,
    required BuildContext context,
    required IconData actionIcon,
    required String actionLabel,
    required VoidCallback onPressed}) {
  return SnackBar(
    content: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.responsiveSize),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(20.responsiveSize)),
          color: _chooseToastPrimaryColor(state),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   _title(state),
            //   style: const AppTextStyle().white.w700.bodyMedium14,
            // ),
            Text(
              description,
              style: const AppTextStyle().white.bodySmall12,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: Alignment.center,
              child: TextButton.icon(
                  onPressed: onPressed,
                  icon: Icon(actionIcon, color: Colors.white),
                  label: Text(
                    actionLabel,
                    style: const AppTextStyle().white.bodySmall12,
                    overflow: TextOverflow.ellipsis,
                  )),
            ),
          ],
        )),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
    duration: const Duration(seconds: 2),
  );
}

SnackBar _messageSnackBar(
    {required String description,
    required ToastStates state,
    double? bottomPadding ,
    required BuildContext context}) {
  return SnackBar(
    showCloseIcon: false,
    closeIconColor: Colors.black,
    content: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.responsiveSize),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.all(Radius.circular(20.responsiveSize)),
          color: _chooseToastPrimaryColor(state),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   _title(state),
            //   style: AppReference.themeData.textTheme.bodyMedium!.copyWith(
            //     fontWeight: FontWeight.w700,
            //     color: Colors.white,
            //   ),
            // ),
            Text(
              description,
              style: AppTextStyle().bodySmall12.copyWith(
                color: Colors.white,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )),
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsetsDirectional.only(bottom: bottomPadding ?? 0),
    backgroundColor: Colors.transparent,
    elevation: 0,
    duration: const Duration(seconds: 2),
  );
}


Color _chooseToastPrimaryColor(ToastStates state) {
  switch (state) {
    case ToastStates.congrats:
      return const Color(0xFF2D6A4F);
    case ToastStates.error:
      return const Color(0xFFC72C41);
    case ToastStates.warning:
      return const Color(0xFFFCA652);
    case ToastStates.info:
      return const Color(0xFF3282B8);
  }
}

