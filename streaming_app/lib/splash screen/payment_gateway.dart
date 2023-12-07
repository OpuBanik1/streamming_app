import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:streaming_app/home_page.dart';

class PaymentGateway extends StatefulWidget {
  const PaymentGateway({super.key});

  @override
  State<PaymentGateway> createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  final _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  void onGooglePayResult(paymentResult) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomePage()));
    debugPrint(paymentResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome to ",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Stremy",
                    style: TextStyle(fontSize: 30, color: Colors.redAccent),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Are you ready to have a blast?",
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text(
                    'Make a payment and enjoy worldclass entertaining platform stremy',
                    style: TextStyle(color: Colors.grey)),
              ),
              SizedBox(
                height: 400,
              ),
              GooglePayButton(
                paymentConfigurationAsset: 'gpay.json',
                paymentItems: _paymentItems,
                type: GooglePayButtonType.pay,
                margin: const EdgeInsets.only(top: 15.0),
                onPaymentResult: onGooglePayResult,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
