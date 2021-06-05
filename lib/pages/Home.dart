import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weather/pages/week.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final cityName = TextEditingController();

var infos;
double temp = 0;
var humidity;
var desc;
var de;
var img;
var visibility;
var wind;
var city = 'Mangalore';
var currDt;
var day;
var date;
var month;
var hour;
var location_name;
var lat;
var long;

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

class _HomeState extends State<Home> {
  getData(String cityname) async {
    String cityUrl =
        "https://api.openweathermap.org/data/2.5/weather?q=${cityname}&appid=86a15e450b8914503ebb7ada1a767ade&units=imperial";
    var data = await http.get(Uri.parse(cityUrl));

    var infor = json.decode(data.body);

    lat = infor['coord']['lat'];
    long = infor['coord']['lon'];
    String myUrl =
        "https://api.openweathermap.org/data/2.5/onecall?lat=${lat}&lon=${long}&exclude=minutely,hourly&appid=86a15e450b8914503ebb7ada1a767ade&units=metric";
    var req = await http.get(Uri.parse(myUrl));
    infos = json.decode(req.body);

    setState(
      () {
        temp = infos['current']['temp'];
        desc = infos['current']['weather'];
        humidity = infos['current']['humidity'];
        visibility = infos['current']['visibility'];
        wind = infos['current']['wind_speed'];
        de = desc[0]['description'];
        de = de.substring(0, 1).toUpperCase() + de.substring(1);

        switch (de) {
          case "Scattered clouds":
            setState(() {
              img = images['cloudy'];
            });
            break;
          case "Clear sky":
            setState(() {
              img = images['sunny_foggy'];
            });
            break;
          case "Few clouds":
            setState(() {
              img = images['cloudy'];
            });
            break;
          case "Broken clouds":
            setState(() {
              img = images['cloudy_sunny'];
            });
            break;
          case "Shower rain":
            setState(() {
              img = images['rain_light'];
            });
            break;
          case "Rain":
            setState(() {
              img = images['storm'];
            });
            break;
          case "Thunderstorm":
            setState(() {
              img = images['thunder'];
            });
            break;
          case "Mist":
            setState(() {
              img = images['windy'];
            });
            break;
          case "Snow":
            setState(() {
              img = images['windy_night'];
            });
            break;
          default:
            break;
        }
      },
    );
    return infos['name'];
  }

  @override
  void initState() {
    getData('Mangalore');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      location_name = 'Location';
      currDt = DateTime.now();
      date = currDt.day;
      day = DateFormat('EEEE').format(currDt);
      print(day);
      month = currDt.month;
      switch (month) {
        case 1:
          setState(() {
            month = 'January';
          });
          break;
        case 2:
          setState(() {
            month = 'February';
          });
          break;
        case 3:
          setState(() {
            month = 'March';
          });
          break;
        case 4:
          setState(() {
            month = 'April';
          });
          break;
        case 5:
          setState(() {
            month = 'May';
          });
          break;
        case 6:
          setState(() {
            month = 'June';
          });
          break;
        case 7:
          setState(() {
            month = 'July';
          });
          break;
        case 8:
          setState(() {
            month = 'August';
          });
          break;
        case 9:
          setState(() {
            month = 'September';
          });
          break;
        case 10:
          setState(() {
            month = 'October';
          });
          break;
        case 11:
          setState(() {
            month = 'November';
          });
          break;
        case 12:
          setState(() {
            month = 'December';
          });
          break;
        default:
      }
      hour = DateFormat("h:mma").format(currDt);
    });
    print(currDt.month);
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
                      height: MediaQuery.of(context).size.height / 1.3,
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
                      height: MediaQuery.of(context).size.height / 1.35,
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed))
                                          return Colors.blueAccent;
                                        return Colors.blue;
                                        // Use the component's default.
                                      },
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      location_name = city;
                                    });
                                    showModalBottomSheet<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          height: 600,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'Enter Location',
                                                  style: GoogleFonts.nunito(
                                                    fontSize: 30,
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.black54,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                  child: Container(
                                                    height: 80,
                                                    child: TextField(
                                                      controller: cityName,
                                                      style: GoogleFonts.nunito(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w800,
                                                          color:
                                                              Colors.black45),
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        filled: true,
                                                        border:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        hintText:
                                                            'Enter City name',
                                                        hintStyle:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black,
                                                        ),
                                                        suffixIcon: IconButton(
                                                          icon: Icon(
                                                              Icons.search),
                                                          onPressed: () {
                                                            city =
                                                                cityName.text;
                                                            getData(city);
                                                            setState(() {
                                                              location_name =
                                                                  city;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        '${city.substring(0, 1).toUpperCase() + city.substring(1)}',
                                        style: GoogleFonts.nunito(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 270,
                            height: 200,
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
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '${temp.toInt()}',
                                        style: GoogleFonts.rubik(
                                          fontSize: 130,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                      WidgetSpan(
                                        child: Transform.translate(
                                          offset: const Offset(-2, -28),
                                          child: Text(
                                            '°',
                                            textScaleFactor: 6,
                                            style: TextStyle(
                                                color: Colors.white60),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            '${de}',
                            style: GoogleFonts.nunito(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '${day}, ' + '${date}' + ' ${month}',
                            style: GoogleFonts.nunito(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: GoogleFonts.nunito(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed))
                          return Colors.blueAccent;
                        return Colors.blue;
                        // Use the component's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Week()),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        '7 days',
                        style: GoogleFonts.nunito(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white60,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white60,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 90,
                  height: 120,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue,
                        offset: const Offset(
                          2.0,
                          2.0,
                        ),
                        blurRadius: 20.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(18, 177, 253, 1),
                        Color.fromRGBO(15, 77, 255, 1),
                      ],
                    ),
                    border: Border.all(color: Colors.cyanAccent, width: 1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${temp.toInt()}',
                                style: GoogleFonts.rubik(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(-2, 2),
                                  child: Text(
                                    '°',
                                    textScaleFactor: 2,
                                    style: TextStyle(color: Colors.white60),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(img), fit: BoxFit.fitHeight),
                        ),
                      ),
                      Text(
                        '${hour}',
                        style: GoogleFonts.nunito(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(6, 62, 141, 1),
                        Color.fromRGBO(15, 77, 255, 1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.air,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Wind :',
                                    style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white60,
                                    ),
                                  ),
                                  Text(
                                    ' ${wind} Km/h',
                                    style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.water_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'Humidity :',
                                    style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white60,
                                    ),
                                  ),
                                  Text(
                                    '${humidity}',
                                    style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                    child: Column(
                                      children: [
                                        Icon(
                                          Icons.visibility_outlined,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Text(
                                      'Visibility :',
                                      style: GoogleFonts.nunito(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '${visibility}',
                                    style: GoogleFonts.nunito(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white60,
                                    ),
                                  ),
                                ],
                              ),
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
    );
  }
}
