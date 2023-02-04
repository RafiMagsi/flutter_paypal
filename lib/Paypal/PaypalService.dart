import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:flutter_paypal_sample/Paypal/Constanst.dart';

class PaypalService {
  static UsePaypal callPaypal() {
    return UsePaypal(
        sandboxMode: true,
        clientId: Constants.paypalClientID,
        secretKey: Constants.paypalSecret,
        returnURL: "https://samplesite.com/return",
        cancelURL: "https://samplesite.com/cancel",
        transactions: const [
          {
            "amount": {
              "total": '10.12',
              "currency": "USD",
              "details": {"subtotal": '10.12', "shipping": '0', "shipping_discount": 0}
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {"name": "A demo product", "quantity": 1, "price": '10.12', "currency": "USD"}
              ],

              // shipping address is not required though
              "shipping_address": {
                "recipient_name": "Jane Foster",
                "line1": "Travis County",
                "line2": "",
                "city": "Austin",
                "country_code": "US",
                "postal_code": "73301",
                "phone": "+00000000",
                "state": "Texas"
              },
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          debugPrint("onSuccess: $params");
        },
        onError: (error) {
          debugPrint("onError: $error");
        },
        onCancel: (params) {
          debugPrint('cancelled: $params');
        });
  }
}
