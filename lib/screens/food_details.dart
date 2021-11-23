import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:food/screens/shopping_cart.dart';
import 'package:hexcolor/hexcolor.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShoppingCart(),
                ),
              );
            },
            child: (SizedBox(
              child: Container(
                margin: EdgeInsets.only(bottom: 20.0),
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: HexColor('#FA4A0C'),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                width: MediaQuery.of(context).size.width - 60.0,
                child: Text(
                  'Add to card',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
          ),
        ],
      ),
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 20.0, top: 20.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20.0, top: 20.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_border),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 200.0,
                height: 200.0,
                margin: EdgeInsets.only(top: 20.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ImageSlideshow(
                    indicatorBackgroundColor: HexColor('#000000'),
                    indicatorColor: Colors.red,
                    isLoop: true,
                    autoPlayInterval: 5000,
                    children: [
                      ClipOval(
                          child: Container(
                        child: Image.asset('assets/images/food_01.png',
                            fit: BoxFit.cover),
                      )),
                      ClipOval(
                          child: Container(
                        child: Image.asset('assets/images/food_2.png',
                            fit: BoxFit.cover),
                      )),
                      ClipOval(
                          child: Container(
                        child: Image.asset('assets/images/food_3.png',
                            fit: BoxFit.cover),
                      )),
                    ],
                  ),
                ),
              ),
            ),
            Text(
              'Veggie tomato mix',
              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
            ),
            Text(
              ' N12,313',
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                  color: HexColor('#FA4A0C')),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Delivery info',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Text(
                        'Delivery info',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Text(
                    'Delivered between monday aug and thursday 20 from 8pm to 91:32 pm',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
