import 'package:calculator_frontend/widgets/LargeText.dart';
import 'package:calculator_frontend/widgets/NavigationBox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:url_launcher/url_launcher.dart';

class MobileHomepage extends StatefulWidget {
  const MobileHomepage({Key? key}) : super(key: key);

  @override
  State<MobileHomepage> createState() => _MobileHomepageState();
}

class _MobileHomepageState extends State<MobileHomepage> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var widgetSize = MediaQuery.of(context).size;
    var current_login_url = window.location.href;
    return Scaffold(
      extendBodyBehindAppBar: true,
      endDrawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
        preferredSize: Size(widgetSize.width, 200),
        child: Container(
            color: _scrollPosition == 0 ? Colors.white : Colors.transparent,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Padding(
              padding: EdgeInsets.only(
                left: (widgetSize.width > 1000)
                    ? widgetSize.width / 30
                    : widgetSize.width / 50,
                right: (widgetSize.width > 1000)
                    ? widgetSize.width / 30
                    : widgetSize.width / 50,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/logo_color_row.png',
                    height: 30,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                          style: OutlinedButton.styleFrom(
                              primary: Colors.indigo,
                              backgroundColor: Colors.black54,
                              padding: EdgeInsets.all(20)),
                          child: Text('?????????',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700))),
                      const SizedBox(
                        width: 20,
                      ),
                      //  The problem is I was using the context of the widget that instantiated Scaffold.
                      //  Not the context of a child of Scaffold
                      Builder(builder: (context) {
                        return IconButton(
                            onPressed: () {
                              Scaffold.of(context).openEndDrawer();
                            },
                            icon: Icon(Icons.menu_rounded));
                      })
                    ],
                  )
                ],
              ),
            )),
      ),
      endDrawer: Drawer(
        width: 250,
        child: ListView(
          children: [
            DrawerHeader(
              child: null,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/new_logo2.jpg'),
                      fit: BoxFit.fill)),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('TAXAI ??????'),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('????????????'),
            ),
            ListTile(
              leading: Icon(Icons.mail_sharp),
              title: Text('?????? ??????'),
              onTap: () {
                sendInquiryEmail();
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_mail_sharp),
              title: Text('?????? ??????'),
              onTap: () {
                sendPartnerEmail();
              },
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xffe8e8e8), Color(0xff448aff)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: (widgetSize.width > 1000)
                          ? widgetSize.width / 30
                          : widgetSize.width / 50,
                      right: (widgetSize.width > 1000)
                          ? widgetSize.width / 30
                          : widgetSize.width / 50,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                style: TextStyle(
                                    fontSize: 110,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.blueAccent,
                                    shadows: [
                                      Shadow(
                                          offset: Offset(5, 5),
                                          color: Colors.white.withOpacity(.7),
                                          blurRadius: 7)
                                    ]),
                                text: 'T A X A I',
                                children: [
                                  TextSpan(
                                      text: '\n???????????? ??????????????? ?????????',
                                      style: TextStyle(
                                          fontSize: 35, color: Colors.black)),
                                ])),
                        const SizedBox(
                          height: 50,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text:
                                    'TAXAI??? ?????????, ??????, ??????????????????, ?????????, ???????????????\n?????? ????????? ????????? ????????? ?????? ?????????, ???????????? ?????? \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                                children: [
                                  TextSpan(
                                      text:
                                          '?????? ????????? ???????????? ???????????? ????????????\n???????????? ??????????????? ?????????',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      )),
                                  TextSpan(text: ' ?????????.')
                                ])),
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          'assets/images/homepage_image.png',
                          height: 400,
                          width: 500,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text:
                                    'TAXAI??? 15?????? ???????????? ??????????????????\n??????????????? ?????? ?????? ???????????? ?????? ????????? \n',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                                children: [
                                  TextSpan(text: '????????????????????? '),
                                  TextSpan(
                                      text:
                                          '?????? ????????? ??????, ?????? ??????\n ??????????????? ???????????? ?????? ??????????????? ?????? ?????????\n',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      )),
                                  TextSpan(
                                      text: '????????? ?????? ????????? ?????? ??????',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      )),
                                  TextSpan(text: '??? ??? ?????????,\n'),
                                  TextSpan(
                                      text:
                                          '?????????????????? ??? ???????????? ?????? ?????? \n?????? ???????????? ????????? ????????? ??????\n'),
                                  TextSpan(
                                      text: '???????????? ?????? ????????? \n??????????????? ????????? ??? ????????????.',
                                      style: TextStyle(
                                        color: Colors.blueAccent,
                                      ))
                                ])),
                        const SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          'assets/images/homepage_image2.png',
                          height: 400,
                          width: 500,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'TAXXI??? ?????? ?????? ????????? ????????? ?????? ????????? ????????? ???????????????.',
                          style: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        const SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: (widgetSize.width > 1000)
                          ? widgetSize.width / 30
                          : widgetSize.width / 50,
                      right: (widgetSize.width > 1000)
                          ? widgetSize.width / 30
                          : widgetSize.width / 50,
                      bottom: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(
                        text: 'AI ?????? ??????',
                        size: 35,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NavigationBox(
                                isCalculator: true,
                                imagepath: 'assets/images/calculator_line.png',
                                isMedium: true,
                                pushNamed: '/capgain',
                                title_1: '???????????????',
                                title_2: 'AI ?????? ?????????'),
                            SizedBox(
                              width: 30,
                            ),
                            NavigationBox(
                                isCalculator: true,
                                imagepath: 'assets/images/calculator_line.png',
                                isMedium: true,
                                pushNamed: '/holding',
                                title_1: '?????????(?????????, ?????????)',
                                title_2: 'AI ?????? ?????????'),
                            Opacity(
                                opacity: 0,
                                child: NavigationBox(
                                    isCalculator: true,
                                    imagepath: '',
                                    isMedium: false,
                                    pushNamed: '',
                                    title_1: '',
                                    title_2: ''))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: (widgetSize.width > 1000)
                          ? widgetSize.width / 30
                          : widgetSize.width / 50,
                      right: (widgetSize.width > 1000)
                          ? widgetSize.width / 30
                          : widgetSize.width / 50,
                      bottom: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(
                        text: 'TAXAI ?????????',
                        size: 35,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NavigationBox(
                                    isCalculator: false,
                                    imagepath:
                                        'assets/images/consultant_line.png',
                                    isMedium: true,
                                    pushNamed: '/',
                                    title_1: '??????????????? AI',
                                    title_2: '?????????'),
                                SizedBox(
                                  width: 30,
                                ),
                                NavigationBox(
                                    isCalculator: false,
                                    imagepath:
                                        'assets/images/consultant_line.png',
                                    isMedium: true,
                                    pushNamed: '/',
                                    title_1: '?????? ??????',
                                    title_2: 'AI ?????????'),
                                Opacity(
                                    opacity: 0,
                                    child: NavigationBox(
                                        isCalculator: true,
                                        imagepath: '',
                                        isMedium: false,
                                        pushNamed: '',
                                        title_1: '',
                                        title_2: ''))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                NavigationBox(
                                    isCalculator: false,
                                    imagepath:
                                        'assets/images/consultant_line.png',
                                    isMedium: true,
                                    pushNamed: '/',
                                    title_1: '??????????????? AI',
                                    title_2: '?????????'),
                                SizedBox(
                                  width: 30,
                                ),
                                NavigationBox(
                                    isCalculator: false,
                                    imagepath:
                                        'assets/images/consultant_line.png',
                                    isMedium: true,
                                    pushNamed: '/',
                                    title_1: '?????? ??????',
                                    title_2: 'AI ?????????'),
                                Opacity(
                                    opacity: 0,
                                    child: NavigationBox(
                                        isCalculator: true,
                                        imagepath: '',
                                        isMedium: false,
                                        pushNamed: '',
                                        title_1: '',
                                        title_2: ''))
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                      top: 60,
                      left: (widgetSize.width > 1000)
                          ? widgetSize.width / 30
                          : widgetSize.width / 50,
                      right: (widgetSize.width > 1000)
                          ? widgetSize.width / 30
                          : widgetSize.width / 50,
                      bottom: 70),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo_color_col.png',
                        height: 70,
                        width: 70,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      widgetSize.width < 700
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('(???) NEW EYE CORPORATION |'),
                                Text('?????? : ??????????????? ?????? ????????? 295, 911???(?????????, ????????????)')
                              ],
                            )
                          : Text(
                              '(???) NEW EYE CORPORATION | ?????? : ??????????????? ?????? ????????? 295, 911???(?????????, ????????????)'),
                      widgetSize.width < 700
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text('????????? ????????? | ????????? ????????????: 457-86-02417'),
                                  Row(
                                    children: [
                                      Text('| ????????? : '),
                                      TextButton(
                                          onPressed: () {
                                            sendTAXAIEmail();
                                          },
                                          child: Text(
                                            'admin@taxai.co.kr',
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationThickness: 2),
                                          ))
                                    ],
                                  )
                                ])
                          : Row(
                              children: [
                                Text('????????? ????????? | ????????? ????????????: 457-86-02417 | ?????????'),
                                TextButton(
                                    onPressed: () {
                                      sendTAXAIEmail();
                                    },
                                    child: Text(
                                      'admin@taxai.co.kr',
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationThickness: 2),
                                    ))
                              ],
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendInquiryEmail() async {
    final Uri inquiry_url = Uri(
      scheme: 'mailto',
      path: 'tech@taxai.co.kr',
      query: 'subject=[TAXAI ????????????]', //add subject and body here
    );

    if (await canLaunchUrl(inquiry_url)) {
      await launchUrl(inquiry_url);
    } else {
      showAlert('TAXAI ????????????', 'tech@taxai.co.kr');
      throw 'Could not launch $inquiry_url';
    }
  }

  sendPartnerEmail() async {
    final Uri partner_url = Uri(
      scheme: 'mailto',
      path: 'admin@taxai.co.kr',
      query: 'subject=[TAXAI ????????????]', //add subject and body here
    );

    if (await canLaunchUrl(partner_url)) {
      await launchUrl(partner_url);
    } else {
      showAlert('TAXAI ????????????', 'admin@taxai.co.kr');
      throw 'Could not launch $partner_url';
    }
  }

  sendTAXAIEmail() async {
    final Uri taxai_url = Uri(
      scheme: 'mailto',
      path: 'admin@taxai.co.kr',
      query: 'subject=[TAXAI]', //add subject and body here
    );

    if (await canLaunchUrl(taxai_url)) {
      await launchUrl(taxai_url);
    } else {
      showAlert('TAXAI', 'admin@taxai.co.kr');
      throw 'Could not launch $taxai_url';
    }
  }

  Future<void> showAlert(String title, String email) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(title),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('?????? ????????? ?????? ?????? ??? ????????????.'),
                Text('?????? ???????????? ??????????????? ?????????????????????.'),
                Text(
                  email,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:
                      Text('??????', style: TextStyle(fontWeight: FontWeight.bold)))
            ],
          );
        });
  }
}
