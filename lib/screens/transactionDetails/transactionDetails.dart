import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:transaction_demo/constants/constant.dart';

class TransactionDetails extends StatelessWidget {
  final String id;
  final String dateTime;
  final String liter;
  final String amount;
  final String status;
  final Color color;
  const TransactionDetails(
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(8),
              color: const Color(0xffF4F7FF),
              // appBar: AppBar(leading: Icon(Icons.arrow_back_rounded,size: Constant.width/8,),),
              child: Column(
                children: [
                  Row(
                    children: [
                     IconButton( icon:Icon(
                        Icons.arrow_back_rounded,
                        size: Constant.width / 10,
                      ),
                      onPressed: ()=>Get.back(),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        textRow('ID', id),
                        textRow('Date', dateTime),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Quantity',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14)),
                              Text(
                                liter,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                              // SizedBox(height: Constant.height/40,)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Status',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 14)),
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
                                height: Constant.height / 22,
                                width: Constant.width / 3.5,
                                child: Center(
                                    child: Text(
                                  status,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ],
                          ),
                        ),
                        Center(
                            child: Text(
                          '\u{20B9}$amount',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        )),
                        SvgPicture.asset('assets/svg/qrcode.svg',
                            // height: Constant.height/3,
                            semanticsLabel: 'Petrol Pump'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    minimumSize: Size(Constant.width / 2.4,
                                        Constant.height / 15),
                                    backgroundColor:
                                        const Color.fromARGB(255, 244, 222, 210),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8))),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                  'Refresh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16),
                                )),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    elevation: 4,
                                    minimumSize: Size(Constant.width / 2.4,
                                        Constant.height / 15),
                                    backgroundColor:
                                        const Color.fromARGB(255, 244, 222, 210),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8))),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.print_outlined,
                                  color: Colors.black,
                                ),
                                label: const Text(
                                  'Print',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 16),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: Constant.height/65,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            pointsCard('Visit  Points','15',Colors.lightBlue),
                        pointsCard('Redeemed','0',Colors.red),
                          ],
                        ),
                        Container(
              
              margin: EdgeInsets.all(Constant.width/35),
              padding: EdgeInsets.all(8),
              height: Constant.height/3.5,
              width: Constant.width/1,
              decoration: BoxDecoration(
          color: Colors.white,
          border:Border.all(),
          borderRadius: BorderRadius.circular(8),
              ),
            child: Column(children:[textRow('Name', 'Anil Kumar'),
        SizedBox(height: 15,),
        textRow('Mobile','9380458545'),
        SizedBox(height: 15,),
        textRow('Vehicle','Maruti Suzuki Dzire'),
        SizedBox(height: 15,),
        textRow('Vehicle#','TN-05K-2436'),
            ] ,))
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Widget pointsCard(String label, value,Color color) {
    return Container(
      
      margin: EdgeInsets.all(Constant.width/35),
      padding: EdgeInsets.all(8),
      height: Constant.height/8,
      width: Constant.width/2.6,
      decoration: BoxDecoration(
        color: Colors.white,
        border:Border.all(),
        borderRadius: BorderRadius.circular(8),
      ),
    child: Column(children:[
Text(label,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
SizedBox(height: 15,),
Text(value,style: TextStyle(color: color,fontSize: 20,fontWeight: FontWeight.w700),),
    ] ,));
  }

  Widget textRow(String label, value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          // SizedBox(height: Constant.height/40,)
        ],
      ),
    );
  }
}
