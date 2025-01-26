library;

import 'package:dartz/dartz.dart' hide State;
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../core/enum/enum_generation.dart';
import '../../config/cubit/global_cubit/global_states.dart';
import '../../config/failure/failure.dart';
import '../../config/resources/app_end_points.dart';
import '../../config/routes/routes_names.dart';
import '../../core/base_widgets/loading_widget.dart';
import '../../core/services/injector_service.dart';
import '../../my_app/app_reference.dart';
import '../auth/auth.dart';
import 'data/model/appointment_model.dart';
import 'data/model/provider_model.dart';
import 'data/model/service_model.dart';
import 'data/model/type_service_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salon_app/config/resources/app_assets.dart';
import 'package:salon_app/config/resources/app_constants.dart';
import 'package:salon_app/config/responsive/responsive_extensions.dart';
import 'package:salon_app/config/routes/route_manager.dart';
import 'package:salon_app/core/base_widgets/snackbar_widget.dart';
import 'package:salon_app/core/shared_widget/custom_inkwell.dart';
import 'package:salon_app/core/shared_widget/nullable_network_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../config/cubit/global_cubit/global_cubit.dart';
import '../../../config/resources/app_colors.dart';
import '../../../config/resources/app_text_style.dart';
import '../../../config/resources/app_values.dart';
import '../../../core/localization/locale_keys.g.dart';





part 'cubits/salon_cubit/salon_cubit.dart';
part 'cubits/salon_cubit/salon_states.dart';
part 'data/salon_repository/salon_repository.dart';
part 'data/model/salon_model.dart';


part 'screens/salon_screen.dart';
part 'screens/salon_details_screen.dart';
part 'widgets/salon_item.dart';
part 'widgets/salon_services_grid_view_widget.dart';
part 'widgets/salon_workers_list_widget.dart';
part 'widgets/share_salon_widget.dart';
part 'widgets/salon_details_card.dart';
part 'widgets/drawer.dart';

