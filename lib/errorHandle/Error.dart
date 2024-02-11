import 'package:account_app/errorHandle/ErrorTypes.dart';

class MyError {
  final ErrorType errorType;

  MyError({required this.errorType});
}

extension ErrorExt on MyError {
  String errorMessage() {
    switch (errorType) {
      case ErrorType.EMPTY_INPUTS:
        return "Please add your card number";
      case ErrorType.INVALID_INPUT:
        return "Please input valid card number";
      case ErrorType.INVALID_CARD_LENGTH:
        return "Card number length must be 16 character";
    }
  }
}
