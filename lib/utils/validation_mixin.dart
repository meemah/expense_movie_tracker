mixin ValidationMixin {
  String validateIsEmpty(String value) {
    if (value.length < 1) {
      return 'Field cant be left empty';
    }
    return null;
  }

  String numberValidator(String value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '"$value" is not a valid number';
    }
    return null;
  }
}
