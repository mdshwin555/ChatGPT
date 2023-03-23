import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343541),
      appBar: AppBar(
        backgroundColor: Color(0xff4444654),
        title: Text(
          'About',
          style: TextStyle(
            fontFamily: "Kanit",
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 4.h,
              child: Image.asset(
                'assets/images/chatgpt-icon.png',
                height: 65.sp,
              ),
            ),
            Positioned(
              top: 16.h,
              child: Center(
                child: Text(
                  'ChatGPT',
                  style: TextStyle(
                    letterSpacing: 1.sp,
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 22.h,
              child: Container(
                width: 90.w,
                child: Text(
                  'ChatGPT is a powerful AI bot that engages in human-like dialogue based on a prompt. It is designed to respond in a natural, intuitive way and has numerous potential uses. The bot gained viral attention shortly after its release in November 2022 and achieved 1 million users within a few days.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Kanit",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: 53.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/openal.png',
                    height: 15.h,
                  ),
                  Transform.translate(
                    offset: Offset(-7.w, 0),
                    child: Text(
                      'OpenAl',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 70.h,
              child: Container(
                width: 90.w,
                child: Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
                top: 74.h,
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15.sp,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.phone,
                        color: Color(0xff343541),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      '+963 968 55 76 74 ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
            Positioned(
              bottom: 1.h,
              child: Text(
                '© Al Mouayad Shwin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
