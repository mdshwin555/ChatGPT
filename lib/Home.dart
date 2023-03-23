import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'About.dart';
import 'Api Services/ApiServices.dart';
import 'package:flutter/services.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'main.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController TextController = TextEditingController();
  late FocusNode focusNode;
  late ScrollController listController;
  bool isTyping = false;
  final chatMessages = [];
  Widget icon = Icon(Icons.send);
  var selectedItem = '';
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    TextController = TextEditingController();
    focusNode = FocusNode();
    listController = ScrollController();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    TextController.dispose();
    listController.dispose();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Couldn\'t check connectivity status');
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    copy() {
      final value = ClipboardData(text: "${sharedPref?.getString("resp")}");
      Clipboard.setData(value);
    }

    showConectivity() {}
    return Scaffold(
      backgroundColor: Color(0xff343541),
      appBar: AppBar(
        backgroundColor: Color(0xff4444654),
        title: Text(
          'ChatGpt',
          style: TextStyle(
            fontFamily: "Kanit,",
          ),
        ),
        actions: [
          Theme(
            data: ThemeData.dark().copyWith(
              primaryColor: Color(0xff4444654),
            ),
            child: PopupMenuButton(onSelected: (value) {
              // your logic
              setState(() {
                selectedItem = value.toString();
                Get.to(About());
              });
              print(value);
              Navigator.pushNamed(context, value.toString());
            }, itemBuilder: (BuildContext bc) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      Text("About"),
                      SizedBox(
                        width: 1.w,
                      ),
                      Icon(Icons.info_outline),
                    ],
                  ),
                  value: '/about',
                ),
              ];
            }),
          )
        ],
        leading: Padding(
          padding: EdgeInsets.all(1.h),
          child: Image.asset(
            'assets/images/openai_logo.jpg',
          ),
        ),
      ),
      body: _connectionStatus.toString() == 'ConnectivityResult.none'
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset('assets/images/no-internet.json', width: 45.w),
                  Text(
                    'No Internet',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontFamily: "RobotoMono"),
                  )
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                chatMessages.length == 0
                    ? Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset('assets/images/vpn.json', width: 75.w),
                            Transform.translate(
                              offset: Offset(0, -4.h),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Text(
                                  'Launch any VPN app to be able to use ChatGPT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontFamily: "Kanit",
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : Flexible(
                        child: ListView.builder(
                            controller: listController,
                            itemCount: chatMessages.length,
                            itemBuilder: (c, i) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    //alignment: Alignment.centerRight,
                                    //width: double.infinity,
                                    margin: EdgeInsets.all(3.w),
                                    padding: int.parse(chatMessages[i]
                                                    ["chatIndex"]
                                                .toString()) ==
                                            0
                                        ? EdgeInsets.only(
                                            top: 1.h,
                                            bottom: 1.h,
                                            right: 2.w,
                                            left: 3.w)
                                        : EdgeInsets.only(
                                            top: 1.h,
                                            bottom: 1.h,
                                            left: 2.w,
                                          ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: int.parse(chatMessages[i]
                                                      ["chatIndex"]
                                                  .toString()) ==
                                              0
                                          ? BorderRadius.only(
                                              topLeft: Radius.circular(15.sp),
                                              bottomRight:
                                                  Radius.circular(15.sp),
                                              bottomLeft:
                                                  Radius.circular(15.sp))
                                          : BorderRadius.only(
                                              topRight: Radius.circular(15.sp),
                                              bottomRight:
                                                  Radius.circular(15.sp),
                                              bottomLeft:
                                                  Radius.circular(15.sp)),
                                      color: int.parse(chatMessages[i]
                                                      ["chatIndex"]
                                                  .toString()) ==
                                              0
                                          ? Color(0xff5D9C59)
                                          : Color(0xff4444654),
                                    ),
                                    child: int.parse(chatMessages[i]
                                                    ["chatIndex"]
                                                .toString()) ==
                                            0
                                        ? Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                textAlign: TextAlign.end,
                                                chatMessages[i]["msg"]
                                                    .toString(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontFamily: "Kanit",
                                                ),
                                              ),
                                              SizedBox(
                                                width: 2.w,
                                              ),
                                              Image.asset(
                                                'assets/images/person.png',
                                                height: 25.sp,
                                                width: 25.sp,
                                              ),
                                            ],
                                          )
                                        : Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Image.asset(
                                                'assets/images/chat_logo.png',
                                                height: 25.sp,
                                                width: 25.sp,
                                              ),
                                              SizedBox(
                                                width: 1.w,
                                              ),
                                              Expanded(
                                                child: DefaultTextStyle(
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12.sp,
                                                      fontFamily: "RobotoMono"),
                                                  child: AnimatedTextKit(
                                                      isRepeatingAnimation:
                                                          false,
                                                      repeatForever: false,
                                                      displayFullTextOnTap:
                                                          true,
                                                      totalRepeatCount: 1,
                                                      animatedTexts: [
                                                        TyperAnimatedText(
                                                          chatMessages[i]["msg"]
                                                              .toString()
                                                              .trim(),
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.copy,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  Get.snackbar("Copied", "",
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                      backgroundColor:
                                                          Color(0xff5D9C59),
                                                      icon: Icon(
                                                          Icons.copy_outlined),
                                                      borderRadius: 50.sp,
                                                      padding: EdgeInsets.only(
                                                        top: 2.5.h,
                                                        left: 5.w,
                                                      ),
                                                      margin: EdgeInsets.only(
                                                        bottom: 10.h,
                                                        left: 30.w,
                                                        right: 30.w,
                                                      ));
                                                  final value = ClipboardData(
                                                      text:
                                                          "${sharedPref?.getString("resp")}");
                                                  Clipboard.setData(value);
                                                },
                                              ),
                                            ],
                                          ),
                                  ),
                                ],
                              );
                            }),
                      ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  color: Color(0xff4444654),
                  padding: EdgeInsets.only(
                    bottom: 1.h,
                    top: 1.h,
                    left: 4.w,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 5.5.h,
                          padding: EdgeInsets.only(left: 3.w, right: 2.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.sp),
                            border: Border.all(
                              color: Colors.white,
                              width: 2.sp,
                            ),
                          ),
                          child: TextField(
                            focusNode: focusNode,
                            onSubmitted: (value) {
                              //SEND MESSAGE
                            },
                            style: TextStyle(color: Colors.white),
                            controller: TextController,
                            decoration: InputDecoration.collapsed(
                              hintText: 'How Can I Help You ?',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.sp,
                                fontFamily: "Kanit",
                              ),
                              filled: true,
                              fillColor: Color(0xff4444654),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 3.w,
                          right: 3.w,
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff5D9C59),
                          child: IconButton(
                            onPressed: () async {
                              setState(() {
                                icon = SpinKitThreeBounce(
                                  color: Colors.white,
                                  size: 11.sp,
                                );
                                isTyping = true;
                                chatMessages.add(
                                  {
                                    "msg": "${TextController.text}",
                                    "chatIndex": 0,
                                  },
                                );
                                print('${chatMessages.last["msg"]}');
                                TextController.clear();
                                focusNode.unfocus();
                              });
                              isTyping = true;
                              final send = await ApiServices.SendMessage(
                                message: '${chatMessages.last["msg"]}',
                              );

                              if (send != null) {
                                setState(() {
                                  icon = Icon(Icons.send);
                                  isTyping = false;
                                  scrollListToEND();
                                  chatMessages.add(
                                    {
                                      "msg": "$send",
                                      "chatIndex": 1,
                                    },
                                  );
                                  sharedPref?.setString("resp", send);
                                  scrollListToEND();
                                });
                              } else
                                print('error');
                            },
                            icon: icon,
                            color: Colors.white,
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

  void scrollListToEND() {
    listController.animateTo(
      listController.position.maxScrollExtent + 100.h,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }
}
