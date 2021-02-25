class NikeShoes {
  final String model;
  final double oldPrice;
  final double currentPrice;
  final List<String> images;
  final int modelNumber;
  final int color;

  NikeShoes({
    this.model,
    this.oldPrice,
    this.currentPrice,
    this.images,
    this.modelNumber,
    this.color,
  });
}

  final List<NikeShoes> shoes = [
    NikeShoes(
        model: 'AIR MAX 90 EZ BLACK',
        currentPrice: 149,
        oldPrice: 299,
        images: [
          "assets/images/shoes1_1.png",
          "assets/images/shoes1_2.png",
          "assets/images/shoes1_3.png",
        ],
      modelNumber: 90,
      color: 0xFFF6F6F6,
    ),
    NikeShoes(
      model: 'AIR MAX 95 RED',
      currentPrice: 299,
      oldPrice: 399,
      images: [
        "assets/images/shoes2_1.png",
        "assets/images/shoes2_2.png",
        "assets/images/shoes2_3.png",
      ],
      modelNumber: 270,
      color: 0xFFFCF5EB,
    ),
    NikeShoes(
      model: 'AIR MAX 270 GOLD',
      currentPrice: 199,
      oldPrice: 349,
      images: [
        "assets/images/shoes3_1.png",
        "assets/images/shoes3_2.png",
        "assets/images/shoes3_3.png",
      ],
      modelNumber: 95,
      color: 0xFFFEEDEF,
    ),
    NikeShoes(
      model: 'AIR MAX 98 FREE',
      currentPrice: 149,
      oldPrice: 299,
      images: [
        "assets/images/shoes4_1.png",
        "assets/images/shoes4_2.png",
        "assets/images/shoes4_3.png",
      ],
      modelNumber: 98,
      color: 0xFFEDF3FE,
    ),
  ];
