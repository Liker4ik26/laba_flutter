extension StringExtensions on String {
  String get hardcoded => '$this';
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
