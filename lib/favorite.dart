class AddGems {
  static final AddGems _addGems = AddGems._internal();

  factory AddGems() {
    return _addGems;
  }

  AddGems._internal();

  List<Map<String, dynamic>> addGems = [];
}
