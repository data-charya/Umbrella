import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:weather/pages/Home.dart';

class Week extends StatefulWidget {
  @override
  _WeekState createState() => _WeekState();
}

var infos;
List daily = [];
String week = '';
List days = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat', 'Sun'];
var images = {
  'cloudy':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622689947/rairhwkck4h59r8hwsmn.png',
  'cloudy_sunny':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622690078/xnemqjds98wbfz8jzy5j.png',
  'rain_light':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622690132/xp8p7v5elllysztllzlo.png',
  'storm':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622690199/tdfbkpr9soh4sieszbf3.png',
  'sunny_foggy':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622690222/gddtqmux7lp6zhroyfoe.png',
  'thunder':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622690234/qe4v4qkdu1rs69da78am.png',
  'windy_cloudy':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622690256/imoasjf8uxp1kdzdy5v2.png',
  'windy_night':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622690256/imoasjf8uxp1kdzdy5v2.png',
  'windy':
      'https://res.cloudinary.com/vigneshshettyin/image/upload/v1622690284/rgjh8anrfd87wvhnpnk8.png'
};

class _WeekState extends State<Week> {
  getData() async {
    String myUrl =
        "https://api.openweathermap.org/data/2.5/onecall?lat=12.9130&lon=74.8426&exclude=minutely,hourly&appid=86a15e450b8914503ebb7ada1a767ade&units=metric";
    var req = await http.get(Uri.parse(myUrl));
    infos = json.decode(req.body);
    daily = infos['daily'];
    week = daily[0]['weather'][0]['description'];
    print(week);
    return infos['name'];
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getData();
    });
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 10, 24, 1),
      body: Column(
        children: [
          Row(
            children: [
              Hero(
                tag: 'colored',
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.6,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(6, 62, 141, 1),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.9,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyanAccent, width: 1),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color.fromRGBO(18, 177, 253, 1),
                            Color.fromRGBO(15, 77, 255, 1),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.chevron_left_outlined,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                Container(
                                  width: 180,
                                  height: 140,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        offset: const Offset(
                                          15.0,
                                          20.0,
                                        ),
                                        blurRadius: 80.0,
                                        spreadRadius: 1.0,
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: NetworkImage(img),
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Tommorow',
                                      style: GoogleFonts.nunito(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: '${temp.toInt()}',
                                              style: GoogleFonts.rubik(
                                                fontSize: 80,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white,
                                              ),
                                            ),
                                            WidgetSpan(
                                              child: Transform.translate(
                                                offset: const Offset(-5, 10),
                                                child: Text(
                                                  '??',
                                                  textScaleFactor: 6,
                                                  style: TextStyle(
                                                      color: Colors.white60),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${de}',
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 1.8,
                child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: 300,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${days[index]}',
                              style: GoogleFonts.nunito(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Colors.white60,
                              ),
                            ),
                            Text(
                              '${daily[index]['weather'][0]['description'].substring(0, 1).toUpperCase() + daily[index]['weather'][0]['description'].substring(1)}',
                              style: GoogleFonts.nunito(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${daily[index]['temp']['min']}',
                                    style: GoogleFonts.rubik(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Transform.translate(
                                      offset: const Offset(-2, 2),
                                      child: Text(
                                        '??',
                                        textScaleFactor: 2,
                                        style: TextStyle(color: Colors.white60),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
