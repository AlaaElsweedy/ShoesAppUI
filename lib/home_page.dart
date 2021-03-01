import 'package:flutter/material.dart';
import 'package:shoes_shop/nike_shoes.dart';
import 'package:shoes_shop/nike_shoes_details.dart';

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
                    padding: EdgeInsets.only(bottom: 10),
                    itemBuilder: (context, index) {
                      final shoesItem = shoes[index];
                      return NikeShoesItem(
                        shoesItem: shoesItem,
                        onTop: () => _onShoesPressed(shoesItem, context),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            valueListenable: notifierBottomBarVisible,
            child: Container(
              color: Colors.white.withOpacity(0.7),
              child: Row(
                children: [
                  Expanded(child: Icon(Icons.home)),
                  Expanded(child: Icon(Icons.search_outlined)),
                  Expanded(child: Icon(Icons.favorite_border)),
                  Expanded(child: Icon(Icons.shopping_cart_outlined)),
                  Expanded(child: Icon(Icons.person_outline)),
                ],
              ),
            ),
            builder: (context, value, child) {
              return AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                left: 0,
                right: 0,
                bottom: value ? 0.0 : -kToolbarHeight,
                height: kToolbarHeight,
                child: child,
              );
            },
          ),
        ],
      ),
    );
  }

  final ValueNotifier<bool> notifierBottomBarVisible = ValueNotifier(true);

  _onShoesPressed(NikeShoes shoesItem, BuildContext context) async {
    notifierBottomBarVisible.value = false;
    await Navigator.of(context).push(
      PageRouteBuilder(pageBuilder: (context, animation1, animation2) {
        return FadeTransition(
          opacity: animation1,
          child: NikeShoesDetails(),
        );
      }),
    );
    notifierBottomBarVisible.value = true;
  }
}

class NikeShoesItem extends StatelessWidget {
  final NikeShoes shoesItem;
  final VoidCallback onTop;

  const NikeShoesItem({
    Key key,
    this.shoesItem,
    this.onTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const itemHeight = 300.0;
    return InkWell(
      onTap: onTop,
      child: Padding(
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
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: itemHeight * 0.7,
                  child: FittedBox(
                    child: Text(
                      "${shoesItem.modelNumber}",
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.05),
                      ),
                    ),
                  ),
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
      ),
    );
  }
}
