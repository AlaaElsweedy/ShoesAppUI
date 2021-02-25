import 'package:flutter/material.dart';
import 'package:shoes_shop/models/nike_shoes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/images/nike_logo.png",
                    height: size.height * 0.10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: shoes.length,
                      itemBuilder: (context, index) {
                        final shoesItem = shoes[index];
                        return NikeShoesItem(
                          shoesItem: shoesItem,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: kToolbarHeight,
              child: Container(
                color: Colors.white.withOpacity(0.5),
                child: Row(
                  children: [
                    Expanded(child: Icon(Icons.home)),
                    Expanded(child: Icon(Icons.search_outlined)),
                    Expanded(child: Icon(Icons.favorite_border)),
                    Expanded(child: Icon(Icons.shopping_cart_outlined)),
                    Expanded(
                      child: Icon(Icons.person_outline),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class NikeShoesItem extends StatelessWidget {
  final NikeShoes shoesItem;

  const NikeShoesItem({
    Key key,
    this.shoesItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 300.0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SizedBox(
        height: itemHeight,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(shoesItem.color),
              ),
            ),
            Positioned(
              top: 10,
              left: 100,
              height: itemHeight * 0.7,
              child: Image.asset(shoesItem.images.first),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {},
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: IconButton(
                icon: Icon(Icons.shopping_basket_outlined),
                onPressed: () {},
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    shoesItem.model,
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${shoesItem.oldPrice}",
                    style: TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$${shoesItem.currentPrice}",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
