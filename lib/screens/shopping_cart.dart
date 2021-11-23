import 'package:flutter/material.dart';
import 'package:food/components/button.dart';
import 'package:food/screens/checkout.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  int count = 1;
  double price = 1.900;
  var list = Item.lists;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#F2F2F2'),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CheckOutPayment(),
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
                    'Complete orders',
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
          title: Text('Cart'),
          leading: Container(
            margin: EdgeInsets.only(left: 18.0),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.touch_app,
                        color: Colors.black,
                      ),
                      Text(
                        'Swipe left to delete !',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final item = list[index];
                      return Slidable(
                        key: UniqueKey(),
                        endActionPane: ActionPane(
                          motion: ScrollMotion(),
                          dismissible: DismissiblePane(onDismissed: () {
                            setState(() {
                              list.removeAt(index);
                            });
                          }),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 1,
                              onPressed: doNothing,
                              foregroundColor: Colors.red,
                              icon: Icons.favorite,
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                setState(() {
                                  deleteCard(context, index);
                                });
                              },
                              foregroundColor: Colors.black,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Card(
                          shadowColor: HexColor('#000000'),
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 10.0),
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage(item.srcImg),
                              ),
                              title: Text(
                                item.title,
                                style: const TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.price,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w500,
                                            color: HexColor('#FA4A0C'),
                                            height: 2.0),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        height: 40.0,
                                        decoration: BoxDecoration(
                                            color: HexColor('#FA4A0C'),
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  if (count <= 1) {
                                                    price = price;
                                                    count = 1;
                                                  } else {
                                                    count--;
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                                size: 18.0,
                                              ),
                                            ),
                                            Text(
                                              '$count',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  count++;
                                                });
                                              },
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 18.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [],
                ),
              ],
            ),
          ),
        ));
  }

  void deleteCard(BuildContext context, int index) {
    list.removeAt(index);
  }
}

class Item {
  Item(
    this.price,
    this.title,
    this.srcImg,
  );

  final String price;
  final String title;
  final String srcImg;

  static final List<Item> lists = [
    Item('1900', 'Vegeie tomato mix', 'assets/images/food_01.png'),
    Item('3800', 'name 2', 'assets/images/food_01.png'),
  ];
}

void doNothing(BuildContext context) {}
