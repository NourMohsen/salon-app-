library auth;

import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/resources/app_constants.dart';
import '../../../../core/enum/enum_generation.dart';
import '../../../../core/services/injector_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_app/config/cubit/global_cubit/global_cubit.dart';
import 'package:salon_app/config/resources/app_assets.dart';
import 'package:salon_app/config/resources/app_values.dart';
import 'package:salon_app/config/responsive/responsive_extensions.dart';
import 'package:salon_app/config/routes/route_manager.dart';
import 'package:salon_app/config/routes/routes_names.dart';
import 'package:salon_app/core/base_widgets/loading_widget.dart';
import 'package:salon_app/core/base_widgets/snackbar_widget.dart';
import 'package:salon_app/core/shared_widget/button_widget.dart';
import 'package:salon_app/core/validation/app_validation.dart';
import '../../../config/resources/app_colors.dart';
import '../../../config/resources/app_text_style.dart';
import '../../../core/localization/locale_keys.g.dart';
import '../../../core/shared_widget/text_form_field.dart';
import '../../config/resources/app_end_points.dart';
import '../../core/shared_widget/default_drop_down_form_field.dart';
import '../../core/shared_widget/pin_code_filed_item.dart';
import '../../my_app/app_reference.dart';
import 'data/model/login_model.dart';
import 'data/model/user_model.dart';



part 'cubits/auth_cubit/auth_cubit.dart';
part 'cubits/auth_cubit/auth_states.dart';
part 'data/model/city_model.dart';
part 'data/repository/auth_repository.dart';
part 'screens/login_screen.dart';
part 'screens/complete_register_screen.dart';
part 'screens/verification_screen.dart';
part 'widgets/header_widget.dart';
part 'widgets/select_gender_widget.dart';
part 'widgets/time_to_resend.dart';
