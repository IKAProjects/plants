class FactModel {
  final int id;
  final String name;
  final List<DetailFactModel> details;

  FactModel({
    required this.id,
    required this.name,
    required this.details,
  });
}

class DetailFactModel {
  final int id;
  final String name;
  final String description;
  final String image;

  DetailFactModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});
}
