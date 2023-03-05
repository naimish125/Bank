import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool onch = false;
  List name = [
    'State Bank of India',
    'Bank of Baroda',
    'Central Bank of India',
    'Uco Bank',
    'Union Bank',
    'Indian Bank',
    'HDFC Bank',
    'Axis Bank',
    'kotak Bank',
  ];
  List logo = [
   'assets/images/sbi.png',
    'assets/images/Bank-of-Baroda-icon.png',
   'assets/images/Central-Bank-Of-India.jpg',
    'assets/images/uco.jpg',
    'assets/images/623dd76470712bdafc63c387.png',
    'assets/images/indian.jpg',
    'assets/images/HDFC-Bank.jpg',
    'assets/images/axis10june.jpg',
    'assets/images/kotak-1474562296.jpg',
  ];
  List num = [
    '1800 11 2211',
    '1800 258 44 55',
    '1800 425 0018',
    '022 61648786',
    '1800 425 00 000',
    '22 24252525',
    '1800 22 22 44',
    '1800 1080',
    '1800 202 6161',
  ];
  List link = [
    'https://www.onlinesbi.sbi',
    'https://www.bankofbaroda.in',
    'https://www.centralbankofindia.co.in/en',
    'https://www.ucobank.co.in',
    'https://www.unionbankofindia.co.in',
    'https://www.indianbank.in',
    'https://www.hdfcbank.com/',
    'https://www.axisbank.com/',
    'https://www.kotak.com/en/home.html'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade800,
          title: Text("Bank details"),
          centerTitle: true,
          actions: [
            Icon(Icons.currency_rupee)
          ],
        ),
        body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            return Box(logo[index], name[index], link[index], num[index]);
          },
        ),
      ),
    );
  }

  Widget Box(String a, String b, String c, String d) {
    return ExpansionTile(
      collapsedTextColor: Colors.white,
      textColor: Colors.white,
      childrenPadding: EdgeInsets.all(10),
      onExpansionChanged: (value) {
        setState(() {
          onch = value;
        });
      },
      leading: (onch == false)
          ? Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          image: DecorationImage(
              image: AssetImage('$a'),
              fit: BoxFit.cover
          ),
        ),
      )
          : Container(width: 35,height: 35,),
      title: Text('$b'),
      trailing: Container(
        width: 55,
      ),
      children: [
        Container(
          height: 195,
          width: double.infinity,
          color: Colors.grey.shade800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: (){
                  setState(() {
                    showDialog(context: context, builder: (context) {
                      return AlertDialog(
                        insetPadding: EdgeInsets.all(0),
                        content: Image.asset('$a'),
                      );
                    },);
                  });
                },
                child: Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('$a'),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13,
              ),
              Text(
                "$b",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    "Web :",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  InkWell(
                    onTap: () async{
                      await launchUrl(Uri.parse("$c"));
                    },
                    child: Text(
                      " $c",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "Coustomer Care:",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  InkWell(
                    onTap: () async{
                      await launchUrl(Uri.parse("tel:$d"));
                    },
                    child: Text(
                      " +91 $d",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
