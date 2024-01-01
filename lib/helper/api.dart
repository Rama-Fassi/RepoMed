import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  ////get
  Future<dynamic> get({required String url, @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Content-Type': 'raw',
    });
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  ////post
  Future<dynamic> post({
    required String url,
    @required dynamic body,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    headers.addAll({
      'Accept': 'application/vnd.api+json',
    });
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }

  //// multipartrequest
  Future<dynamic> postWithFile({
    required String url,
    required Map<String, dynamic> jsonData,
    @required String? token,
    @required Uint8List? file,
  }) async {
    final Uri uri = Uri.parse(url);
    var request = http.MultipartRequest('POST', uri);

    //Add File
    request.files.add(
      http.MultipartFile.fromBytes(
        'image', // Form field name for the file
        file!,
        filename: 'image.jpg',
      ),
    );

    // Add JSON data to the request body
    request.fields
        .addAll(jsonData.map((key, value) => MapEntry(key, value.toString())));

    //Add headers
    Map<String, String> headers = {
      'Accept': 'application/vnd.api+json',
      // 'Content-Type': 'multipart/form-data',
    };
    //Add token to headers
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }
    request.headers.addAll(headers);

    try {
      final response = await request.send();

      // Check the response
      if (response.statusCode == 200) {
        // Read the response stream and convert it to a string
        final responseBody = await response.stream.bytesToString();
        return json.decode(responseBody);
      } else {
        throw Exception(
            'There is a problem with status code ${response.statusCode} with body ${await response.stream.bytesToString()}');
      }
    } catch (error) {
      throw Exception('Error sending the request: $error');
    }
  }

  ////put
  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    // headers.addAll({'Content-Type  ': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception(
          'there is a problem with status code${response.statusCode} with body ${jsonDecode(response.body)}');
    }
  }
}
