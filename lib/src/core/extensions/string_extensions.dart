extension StringX on String {
  String? get nullIfEmptyOrWhiteSpace {
    final value = trim();

    return value.isEmpty ? null : value;
  }

  String get commasToDots {
    return replaceAll(',', '.');
  }

  String get toNewLines => replaceAll(' ', '\n');

  String get capitalizeFirst {
    return this[0].toUpperCase() + substring(1);
  }

  String get formatNumberWithSpaces {
    if (isEmpty) return this; // Return the string if it's empty
    try {
      final parts = split('.');
      var integerPart = parts[0];
      final decimalPart = parts.length > 1 ? '.${parts[1]}' : '';

      final result = StringBuffer();
      final length = integerPart.length;

      for (var i = 0; i < length; i++) {
        if (i > 0 && (length - i) % 3 == 0) {
          result.write(' ');
        }
        result.write(integerPart[i]);
      }

      return result.toString() + decimalPart;
    } catch (e) {
      return this;
    }
  }
}

extension StringXNullable on String? {
  bool get isNullOrEmpty {
    final value = this?.trim();

    return (value?.isEmpty ?? true);
  }
}
