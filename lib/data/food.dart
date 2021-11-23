class ListFood {
  late String img, title;
  late double price;
  ListFood(String img, String title, double price) {
    this.img = img;
    this.title = title;
    this.price = price;
  }
}

List<ListFood> listFood = [
  ListFood('assets/images/food_01.png', 'Món ăn 1', 11.23),
  ListFood('assets/images/food_2.png', 'Món ăn 2', 21.23),
  ListFood('assets/images/food_3.png', 'Món ăn 3', 31.23),
  ListFood('assets/images/food_4.png', 'Món ăn 4', 41.23),
  ListFood('assets/images/food_01.png', 'Món ăn 5', 13.15),
  ListFood('assets/images/food_2.png', 'Món ăn 6', 61.232),
];
