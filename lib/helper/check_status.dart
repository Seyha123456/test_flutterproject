import 'package:get/get.dart';
import 'package:flutter/material.dart';

void checkHttpStatus(int status) {
  String message = '';
  switch (status) {
    case 422:
      message = 'Wrong input data'.tr;
      break;
    case 400:
      message = 'The request was invalid.'.tr;
      break;
    case 401:
      message =
          'The request did not include an authentication token or the authentication token was expired.'
              .tr;
      break;
    case 403:
      message = 'You don\'t have permission to access.'.tr;
      break;
    case 404:
      message = 'The requested resource was not found.'.tr;
      break;
    case 405:
      message =
          'The HTTP method in the request was not supported by the resource.'
              .tr;
      break;
    case 409:
      message = 'The request could not be completed due to a conflict.'.tr;
      break;
    case 500:
      message =
          'The request was not completed due to an internal error on the server side.'
              .tr;
      break;
    case 509:
      message = 'The server was unavailable.'.tr;
      break;
  }
  if (message != '') {
    Get.defaultDialog(content: Text(message), textConfirm: 'Close'.tr);
  }
}
