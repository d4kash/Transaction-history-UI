import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:transaction_demo/constants/constant.dart';
import 'package:transaction_demo/screens/transactionDetails/transactionDetails.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cardSelected = 0.obs;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          children: [
            AppBar(
              leading: const Icon(FontAwesomeIcons.bars),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Rajesh K',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      Text(
                        'Emp Id: 10024',
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 11),
                      )
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        FontAwesomeIcons.mobileScreen,
                        color: Colors.deepOrange,
                      ),
                      Text(
                        '9354512548',
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 13),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Constant.height / 45,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => cardSelected.value = 0,
                      child: Card(
                        elevation: 4,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: Constant.height / 15,
                          width: Constant.width / 2.5,
                          decoration: BoxDecoration(
                            color: cardSelected.value == 0
                                ? Colors.redAccent.shade100
                                : Colors.lightBlue.withOpacity(0.1),
                            border: Border.all(
                                color: cardSelected.value == 0
                                    ? Colors.red
                                    : Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset('assets/svg/fuel_station.svg',
                                    semanticsLabel: 'Petrol Pump'),
                                //  Image.asset('assets/svg/emoji_fuel pump.png'),
                                const Text(
                                  'DU 3',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Image.asset('assets/svg/chevron_down.png')
                              ]),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => cardSelected.value = 1,
                      child: Card(
                        elevation: 4,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          height: Constant.height / 15,
                          width: Constant.width / 2.5,
                          decoration: BoxDecoration(
                            color: cardSelected.value == 1
                                ? Colors.redAccent.shade100
                                : Colors.lightBlue.withOpacity(0.1),
                            border: Border.all(
                                color: cardSelected.value == 1
                                    ? Colors.red
                                    : Colors.black),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    'assets/svg/icon_qr_code_scanner.svg',
                                    semanticsLabel: 'Petrol Pump'),
                                //  Image.asset('assets/svg/emoji_fuel pump.png'),
                                SizedBox(
                                  width: Constant.width / 40,
                                ),
                                const Text(
                                  'SCAN',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomPetrolNumberCard(),
            RichText(
                text: const TextSpan(children: [
              TextSpan(
                  text: 'Last 12 hours: ',
                  style: TextStyle(color: Colors.black)),
              TextSpan(
                  text: '700 Liters/\u{20B9}58500',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black))
            ])),
            const BillDetailsList(),
          ],
        ),
      ),
    );
  }
}

class BillDetailsList extends StatelessWidget {
  const BillDetailsList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> recieptDetail = [
      {
        "id": "224545121785",
        "dateTime": "Today, 9:46 PM",
        "liter": "18.54 L",
        "amount": '1500.00',
        "status": "BILL",
        "color": Colors.red
      },
      {
        "id": "224545784555",
        "dateTime": "Today, 9:36 PM",
        "liter": "10.44 L",
        "amount": '1800.00',
        "status": "REDEEMED",
        "color": Colors.green
      },
      {
        "id": "224535878965",
        "dateTime": "Today, 9:26 PM",
        "liter": "15.34 L",
        "amount": '500.00',
        "status": "ATTACHED",
        "color": Colors.lightBlue
      },
      {
        "id": "224545127564",
        "dateTime": "Today, 8:16 PM",
        "liter": "8.10 L",
        "amount": '2500.00',
        "status": "BILL",
        "color": Colors.red
      }
    ];
    return Container(
      height: Constant.height / 1.65,
      child: ListView.builder(
          itemCount: recieptDetail.length,
          itemBuilder: (context, index) {
            return BillDetailsCard(
              id: recieptDetail[index]['id'],
              status: recieptDetail[index]['status'],
              liter: recieptDetail[index]['liter'],
              dateTime: recieptDetail[index]['dateTime'],
              color: recieptDetail[index]['color'],
              amount: recieptDetail[index]['amount'],
            );
          }),
    );
  }
}

class BillDetailsCard extends StatelessWidget {
  final String id;
  final String dateTime;
  final String liter;
  final String amount;
  final String status;
  final Color color;
  const BillDetailsCard(
      {Key? key,
      required this.id,
      required this.dateTime,
      required this.liter,
      required this.amount,
      required this.status,
      required this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constant.height / 3,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 25.0,
          ),
        ],
        color: Colors.lightBlue.withOpacity(0.1),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'id: ', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '$id',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black))
              ])),
              Container(
                margin: const EdgeInsets.all(4),
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 25.0,
                    ),
                  ],
                  color: color,
                  border: Border.all(color: color),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: Constant.height / 19,
                width: Constant.width / 3.5,
                child: Center(
                    child: Text(
                  status,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              )
            ],
          ),
          SizedBox(
            height: Constant.height / 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                SvgPicture.asset('assets/svg/icon_fuel_pump.svg',
                    semanticsLabel: 'Petrol Pump'),
                //  Image.asset('assets/svg/emoji_fuel pump.png'),
                SizedBox(
                  width: Constant.width / 40,
                ),
                const Text(
                  '1',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ]),
              Text(
                '$dateTime',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
          SizedBox(
            height: Constant.height / 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                SvgPicture.asset('assets/svg/icon_Gas_station.svg',
                    semanticsLabel: 'Petrol Pump'),
                //  Image.asset('assets/svg/emoji_fuel pump.png'),
                SizedBox(
                  width: Constant.width / 40,
                ),
                Text(
                  '$liter',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ]),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Actual: ', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '\u{20B9}$amount',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20))
              ])),
            ],
          ),
          SizedBox(
            height: Constant.height / 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'PAY: ', style: TextStyle(color: Colors.black)),
                TextSpan(
                    text: '\u{20B9}$amount',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 22))
              ])),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      elevation: 4,
                      backgroundColor: Color.fromARGB(255, 244, 222, 210),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {},
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Refresh',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ))
            ],
          ),
          GestureDetector(
            onTap: () {
              Get.to(() =>  TransactionDetails(
                 id: id,
              status: status,
              liter: liter,
              dateTime: dateTime,
              color: color,
              amount: amount,
              ));
            },
            child: Container(
              // width: Constant.width/1,
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 25.0,
                  ),
                ],
                color: Color(0xffFAE0D1),
                border: Border.all(),
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: SizedBox(
                // width: Constant.width/2,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/Vector.svg',
                          height: 18, semanticsLabel: 'Petrol Pump'),
                      //  Image.asset('assets/svg/emoji_fuel pump.png'),
                      SizedBox(
                        width: Constant.width / 60,
                      ),
                      const Text(
                        'Print Reciept',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPetrolNumberCard extends StatelessWidget {
  CustomPetrolNumberCard({
    super.key,
  });

  @override
  final selectedIndex = 0.obs;
  Widget build(BuildContext context) {
    return SizedBox(
        height: Constant.height / 12,
        // width: Constant.width/1,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: ((context, index) {
              return GestureDetector(
                  onTap: () => selectedIndex.value = index,
                  child: showCard(index, selectedIndex));
            })));
  }

  Widget showCard(int index, selectedIndex) {
    return Obx(
      () => Container(
        width: Constant.width / 6,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 5.0,
            ),
          ],
          color: selectedIndex.value != index
              ? Colors.lightBlue.withOpacity(0.1)
              : Colors.orange.shade300,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(children: [
          SvgPicture.asset('assets/svg/icon_fuel_pump.svg',
              semanticsLabel: 'Petrol Pump'),
          //  Image.asset('assets/svg/emoji_fuel pump.png'),
          SizedBox(
            width: Constant.width / 40,
          ),
          Text(
            '${index + 1}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ]),
      ),
    );
  }
}
