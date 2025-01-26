part of '../../auth.dart';


class AuthRepository {


  Future<Either<String, String>> login(UserModel userModel) async {
    try {
      userModel.firebaseToken = await AppReference.getNotificationTokenFromFireBase();
      userModel.deviceId = await AppReference.getMobileID();
      final response = await dioService.post(
          endpoint: EndPoints.login, data: userModel.toJson());

      if (response.statusCode == 200 && response.data["status"]) {
        return Right(response.data['message']);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return  Left(e.toString());
    }
  }

  Future<Either<String, LoginModel>> activeAccount(String phoneNumber,String code) async {
    try {
      final response = await dioService.post(
          endpoint: EndPoints.sendOTP, data: {
            "phone": phoneNumber,
            "code": code,

      });

      if (response.statusCode == 200 && response.data["status"]) {
        return Right(LoginModel.fromJson(response.data['data']));
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return  Left(e.toString());
    }
  }

  Future<Either<String, UserModel>> completeRegistration(UserModel userModel) async {
    try {
      final response = await dioService.post(
          endpoint: EndPoints.completeRegistration, data: userModel.toJson());
      if (response.statusCode == 200 && response.data["status"]) {
        var userModel = UserModel.fromJson(response.data["data"]);
        return Right(userModel);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return const Left("oops error");
    }
  }


  Future<Either<String, void>> logout() async {
    try {
      final response = await dioService.get(
          endpoint: EndPoints.logoutPath,);
      if (response.statusCode == 200 && response.data["status"]) {
        return const Right(null);
      } else {
        return Left(response.data['message']);
      }
    } catch (e) {
      return const Left("oops error");
    }
  }

}

