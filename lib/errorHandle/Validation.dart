class Validation {
  static bool isEmptyInputs(String input) {
    return input.isEmpty;
  }

  static bool isValidCardNumberChar(String cardNumber) {
    final numericRegex = RegExp(r'^[0-9]+$');
    return numericRegex.hasMatch(cardNumber);
  }

  static bool isValidCardNumberLength(String cardNumber) {
    return cardNumber.length == 16;
  }
}
