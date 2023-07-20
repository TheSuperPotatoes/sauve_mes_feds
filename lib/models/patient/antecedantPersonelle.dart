class AntecedantsPersonels {
  AntecedantsPersonels({required this.maladies, required this.allergie});
  List<String> maladies;
  List<String> allergie;

  Map<String, List<String>> get map {
    return {
      "maladie": maladies,
      "allergie": allergie,
    };
  }
}
