part of '../../auth.dart';

extension AuthStatusX on AuthState {
  bool get isInitial => status == AuthStatus.initial;
  bool get isLoginLoading => status == AuthStatus.loginLoading;
  bool get isLoginLoaded => status == AuthStatus.loginLoaded;
  bool get isCompleteRegisterLoading => status == AuthStatus.completeRegisterLoading;
  bool get isCompleteRegisterLoaded => status == AuthStatus.completeRegisterLoaded;
  bool get isActiveAccountLoading => status == AuthStatus.isActiveAccountLoading;
  bool get isActiveAccountLoaded => status == AuthStatus.isActiveAccountLoaded;
  bool get isLogoutLoaded => status == AuthStatus.logoutLoaded;
  bool get isSelectGender => status == AuthStatus.selectGender;
  bool get isError => status == AuthStatus.error;
}

class AuthState {
  final AuthStatus status;
  final String? error;
  final bool? isFirstLogin;
  const AuthState(
      {required this.status,this.isFirstLogin,this.error});

  AuthState copyWith({
    AuthStatus? status,
    bool? isFirstLogin,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      isFirstLogin: isFirstLogin ?? this.isFirstLogin,
      error: error ?? this.error,
    );
  }




}





