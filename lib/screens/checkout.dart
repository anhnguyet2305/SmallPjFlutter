import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CheckOutPayment extends StatelessWidget {
  const CheckOutPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: Container(
          margin: EdgeInsets.only(left: 18.0),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => (),
              //   ),
              // );
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Payment',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 34.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('Payment method',
                  style:
                      TextStyle(fontSize: 17.0, fontWeight: FontWeight.w600)),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
