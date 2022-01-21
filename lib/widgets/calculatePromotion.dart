import 'package:flutter/material.dart';

class CalculatePromotion extends StatefulWidget {
  static const tag = 'promo_page';

  @override
  _CalculatePromotionState createState() => _CalculatePromotionState();
}

class _CalculatePromotionState extends State<CalculatePromotion> {

  TextEditingController inputPrice = TextEditingController();
  TextEditingController inputReduction = TextEditingController();
  String result = '0';
  String resultFinalPrice = '0';

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
    ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcul promotion"),
      ),
      body:
      Center(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: inputPrice,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Original price',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: inputReduction,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Reduction',
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              style: style,
              onPressed: () {
                setState(() {
                  double remise = (int.parse(inputPrice.text) * int.parse(inputReduction.text)) / 100;
                  double finalPrice = (int.parse(inputPrice.text) - remise);
                  result = remise.toString();
                  resultFinalPrice = finalPrice.toString();
                });
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20.0)),
                        child: Container(
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('Vous avez économisé $result euros', style: const TextStyle(color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.bold),),
                                Text('Le prix final de votre produit est de $resultFinalPrice euros', style: const TextStyle(color: Colors.red, fontSize: 16.0, fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: const Text('Calculate'),
            ),
          ),
        ],
    ),
      ),
    );
  }
}
