import 'package:dio/dio.dart';

class Service {
  final Dio dio = Dio();
  String apiUrl =
      'https://gradution2024-production.up.railway.app/api/v1/passengers';

  Future<void> register({
    required String firstname,
    required String lastname,
    required String email,
    required String password,
    required String passwordConfirm,
    required String cardNumber,
    required String expiryDate,
    required String cvv,
    required String gender ,
    required String phone ,
  }) async {
    Map<String, dynamic> registerData = {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "password": password,
      "passwordConfirm": passwordConfirm,
      "CardNumber": cardNumber,
      "ExpiryDate": expiryDate,
      "CVV": cvv,
      "gender": gender,
      "phone": phone,
    };

    try {
      Response response = await dio.post(apiUrl,
          data: registerData,
          options: Options(contentType: 'application/json'));
      print("Response: ${response.data}");
    } catch (error) {
      print("Error: $error");
    }
  }
}