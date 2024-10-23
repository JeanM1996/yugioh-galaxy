extension StringExtension on String {
  String capitalize() {
    return isEmpty
        ? ''
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeFirstWord() {
    return isEmpty
        ? ''
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String obscureFromPositionToSymbol(int position, String symbol) {
    //obscure text form position to symbol
    final firstPart = substring(0, position);
    final secondPart = substring(position, indexOf(symbol));
    final thirdPart = substring(indexOf(symbol));
    return "$firstPart${"*" * secondPart.length}$thirdPart";
  }

  double toDouble() {
    return isEmpty ? 0.0 : double.tryParse(replaceAll(',', '.')) ?? 0.0;
  }

  num toNum() {
    return num.tryParse(replaceAll(',', '.')) ?? 0;
  }

  //capitalize first letter of each word
  String capitalizeFirstLetterOfEachWord() {
    final items = split(' ');
    var result = '';
    for (final item in items) {
      if (item.isEmpty) continue;
      result += '${item.capitalize()} ';
    }
    return result.trim();
  }

  String toBold() {
    return '<b>$this</b>';
  }
}
