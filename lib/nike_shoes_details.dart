import 'package:flutter/material.dart';

class NikeShoesDetails extends StatelessWidget {
  final ValueNotifier<bool> notifierButtonsVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifierButtonsVisible.value = true;
    }); // OR change to StatfulWidget and put notifierButtonsVisible on setState

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ValueListenableBuilder<bool>(
              valueListenable: notifierButtonsVisible,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: 'fav',
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                    //Spacer(),
                    FloatingActionButton(
                      heroTag: 'cart',
                      backgroundColor: Colors.black,
                      child: Icon(Icons.shopping_cart),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              builder: (context, value, child) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 200),
                  bottom: value ? 0.0 : -kToolbarHeight,
                  right: 0,
                  left: 0,
                  child: child,
                );
              }),
        ],
      ),
    );
  }
}
