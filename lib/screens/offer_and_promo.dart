import 'package:flutter/material.dart';

class OfferAndPromo extends StatefulWidget {
  final VoidCallback openDrawer;
  const OfferAndPromo({Key? key, required this.openDrawer}) : super(key: key);

  @override
  _OfferAndPromoState createState() => _OfferAndPromoState();
}

class _OfferAndPromoState extends State<OfferAndPromo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Offer And Promo'),
      ),
    );
  }
}
