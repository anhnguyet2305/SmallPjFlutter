import 'package:flutter/material.dart';
import 'package:food/components/food.dart';
import 'package:food/screens/food_details.dart';
import 'package:food/screens/shopping_cart.dart';
import 'package:food/widget/drawer_menu_widget.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:food/data/food.dart';

class ContentHome extends StatelessWidget {
  final VoidCallback openDrawer;

  const ContentHome({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#F2F2F2'),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DrawerMenuWidget(onClicked: openDrawer),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingCart(),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart))
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Delicious',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold)),
                    Text('food for you',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 34, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              autofocus: false,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                contentPadding:
                    const EdgeInsets.fromLTRB(20.0, 18.0, 20.0, 18.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0)),
              ),
            ),
          ),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: double.infinity,
                  child: DefaultTabController(
                    length: 4,
                    child: Column(
                      children: [
                        Container(
                          child: const TabBar(
                            labelColor: Colors.red,
                            unselectedLabelColor: Colors.black,
                            indicatorColor: Colors.red,
                            indicatorSize: TabBarIndicatorSize.label,
                            tabs: [
                              Tab(
                                child: Text(
                                  'Food',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Drinks',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Snacks',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  'Sauce',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  offset: Offset(.0, 6.7),
                                  blurRadius: 10.7,
                                  spreadRadius: 2.0,
                                  color: Colors.white70)
                            ]),
                            child: TabBarView(children: [
                              Tab(
                                  child: Column(
                                children: [
                                  Expanded(
                                      child: GridView.builder(
                                    padding: EdgeInsets.only(left: 30.0),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: 1.6,
                                    ),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        ItemCard(food: listFood[index]),
                                    itemCount: listFood.length,
                                  )),
                                ],
                              )),
                              Tab(
                                  child: Container(
                                      margin: const EdgeInsets.all(20))),
                              Tab(
                                  child: Container(
                                      margin: const EdgeInsets.all(20))),
                              const Tab(child: Text('A')),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  )))
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final ListFood food;
  const ItemCard({
    Key? key,
    required this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FoodDetails()),
        );
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50.0, left: 0.0),
            height: 230.0,
            width: 180.0,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  food.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  food.price.toString(),
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w700,
                      fontSize: 17.0),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            left: 25.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70.0),
              child: Image.asset(
                food.img,
                width: 130.0,
                height: 130.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
