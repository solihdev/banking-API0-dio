import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UploadApiService {
  Future<String> uploadProfileImage({
    required File file,
    required int userId,
  }) async {
    Dio dio = Dio();

    dio.options.headers = {
      'Authorization': "Token",
      'Accept': "application/json",
    };

    String fileName = file.path.split('/').last;
    var myFileFrom= await MultipartFile.fromFile(file.path,filename: fileName);

    FormData formData = FormData.fromMap({
      'avatar_image': await MultipartFile.fromFile(
        file.path,
        filename: fileName,
      ),
      'user_id': userId,
      'type_id': 0,
    });
    final Response response = await dio.post(
      "https://chronic.spai.uz'/api/upload_user_avatar/",
      data: formData,
    );

    debugPrint('client-image-upload');
    debugPrint('${response.statusCode}');

    if (response.statusCode! >= 200 && response.statusCode! < 300) {
      return response.data['status'];
    } else {
      throw Exception();
    }
  }
}
