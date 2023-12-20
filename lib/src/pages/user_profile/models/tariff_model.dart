class TariffModel {
  const TariffModel(this.onTap, {
    required this.image,
    required this.name,
    required this.description,
  });

  final String image;
  final String name;
  final String? description;
  final void Function()? onTap;
}
