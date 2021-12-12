import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_braintree/flutter_braintree.dart';

class ShopUI extends StatefulWidget {
  const ShopUI({Key? key}) : super(key: key);

  @override
  _ShopUIState createState() => _ShopUIState();
}

class _ShopUIState extends State<ShopUI> {
  var prices = [
    10000,5000,30000,10000,5000,30000,10000,5000,30000,10000,5000,30000,10000,5000,30000,
  ];
  var name = [
    "Handful of Coins","Bunch of Coins","Pile of Coins","Handful of Coins","Bunch of Coins","Pile of Coins","Handful of Coins","Bunch of Coins",
    "Pile of Coins","Handful of Coins","Bunch of Coins", "Pile of Coins","Handful of Coins","Bunch of Coins","Pile of Coins"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop"),
        backgroundColor: Colors.purple[900],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Colors.yellow[100],
              width: double.maxFinite,
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 5),
                height: 30,
                child: Center(child: Text("Coins", style: GoogleFonts.oswald(fontSize: 20),))),
            ),
            Expanded(
              child: Container(
                color: Colors.deepPurple[700],
                child: GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  childAspectRatio: 2 / 3,
                  crossAxisCount: 3,
                  children: List.generate(15, (index) {
                    return Container(
                      margin: EdgeInsets.fromLTRB(3, 6, 0, 0),
                      child: Card(
                          color: Colors.amber[700],
                          elevation: 5.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "${name[index]}",
                                  style: GoogleFonts.raleway(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    // color: Colors.white
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Icon(
                                FontAwesomeIcons.coins,
                                size: 40,
                              ),
                              SizedBox(height: 20),
                              Center(
                                  child: Text("${prices[index]}",
                                      style: GoogleFonts.lato(
                                          fontSize: 15, fontWeight: FontWeight.w500))),
                              SizedBox(height: 7),
                              Container(
                                  height: 22,
                                  width: 90,
                                  child: ElevatedButton(
                                      onPressed: () async{
                                        var request = BraintreeDropInRequest(
                                            tokenizationKey: 'sandbox_38fvzjrp_k24tjdnxdw657m8h',
                                            collectDeviceData: true,
                                           paypalRequest: BraintreePayPalRequest(
                                             amount: '10.00',
                                             displayName: 'wahed'
                                           ),
                                           cardEnabled: true
                                        );
                                        BraintreeDropInResult? result = await BraintreeDropIn.start(request);

                                        if(result != null){
                                          print(result.paymentMethodNonce.description);
                                          print(result.paymentMethodNonce.nonce);
                                        }
                                      },
                                      child: Text("BDT 80.00", softWrap: false,))),
                            ]
                          )),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
