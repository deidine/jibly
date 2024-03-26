import 'package:flutter/material.dart';
import 'package:jibly/app/controllers/credit_card_controller.dart';
import 'package:jibly/app/data/helper/enum/payment_view.dart';
import 'package:jibly/app/screens/profile/components/add_payment_details.dart';
import 'package:jibly/app/screens/profile/components/payment_details.dart';
import 'package:get/get.dart';

class ProfilePaymentView extends StatefulWidget {
  const ProfilePaymentView({super.key});

  @override
  State<ProfilePaymentView> createState() => _ProfilePaymentViewState();
}

class _ProfilePaymentViewState extends State<ProfilePaymentView> {
  CreditCardController cc = Get.put(CreditCardController());
  PaymentViewEnum paymentView = PaymentViewEnum.paymentDetails;
  @override
  Widget build(BuildContext context) {
    return paymentView == PaymentViewEnum.paymentDetails
        ? PaymentView(
            addPaymentCard: () {
              setState(() {
                paymentView = PaymentViewEnum.addPaymentCard;
              });
            },
            creditCard: cc.creditCards ?? [],
          )
        : AddPaymentDetails(
            addCardCallback: (
                {required String cardHolderName,
                required String cardNumber,
                required String cvc,
                required String expireDate}) {
              setState(() {
                paymentView = PaymentViewEnum.paymentDetails;
              });
              cc.addCreditCard(
                  accountNumber: cardNumber,
                  ownerName: cardHolderName,
                  expireDate: expireDate,
                  cvcNumber: cvc);
            },
          );
  }
}
