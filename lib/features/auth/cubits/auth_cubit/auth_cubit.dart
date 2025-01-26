part of '../../auth.dart';


class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(const AuthState(status: AuthStatus.initial));

  Future<void> login(UserModel userModel) async {
      emit(state.copyWith(
        status: AuthStatus.loginLoading,
      ));
      final res = await authRepository.login(userModel);
      res.fold(
            (err) {
          emit(state.copyWith(
            status: AuthStatus.error,
            error: err,
          ));
        },
            (res) {
          emit(state.copyWith(
            status: AuthStatus.loginLoaded,
          ));
        },
      );

  }

  Future<void> activeAccount(String phoneNumber,String code) async {
    emit(state.copyWith(
      status: AuthStatus.isActiveAccountLoading,
    ));
    final res = await authRepository.activeAccount(phoneNumber,code);
    res.fold(
          (err) {
        emit(state.copyWith(
          status: AuthStatus.error,
          error: err,
        ));
      },
          (res) {
            prefsService.saveData(AppConstants.token, res.token);
        emit(state.copyWith(
          isFirstLogin: res.firstLogin,
          status: AuthStatus.isActiveAccountLoaded,
        ));
      },
    );

  }

  Future<void> register(UserModel userModel) async {
      emit(state.copyWith(
        status: AuthStatus.completeRegisterLoading,
      ));
      userModel.gender = isMale ? "male" : "female";
      userModel.cityId = cityId;
      final res = await authRepository.completeRegistration(userModel);
      res.fold(
        (err) {
          emit(state.copyWith(
            status: AuthStatus.error,
            error: err,
          ));
        },
        (res) {
          prefsService.saveData(
               AppConstants.userData,jsonEncode(res.toJson()));
          emit(state.copyWith(
            status: AuthStatus.completeRegisterLoaded,
          ));
        },
      );
  }
  bool isMale = true;
  int? cityId;

  selectGender(bool value){
    isMale = value;
    emit(state.copyWith());
  }

  selectCity(int value){
    cityId = value;
    emit(state.copyWith());
  }



  Future<void> logout() async {
      emit(state.copyWith(
        status: AuthStatus.logoutLoading,
      ));
      final res = await authRepository.logout();
      res.fold(
        (err) {
          emit(state.copyWith(
            status: AuthStatus.error,
            error: err,
          ));
        },
        (res) {
          prefsService.removeData(AppConstants.token);
          prefsService.removeData(AppConstants.userData);
          emit(state.copyWith(
            status: AuthStatus.logoutLoaded,
          ));
        },
      );
  }
}
