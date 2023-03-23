import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {

  void launchwhatsapp()async{

    String whatsapp="whatsapp://send?phone=+963968557674&text=Hello";
  }
  calling()async{
    const call = 'tel:+218919247183';
    if( await canLaunch(call)){
      await launch(call);
    }else{
      throw 'Could not launch $call';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff343541),
        appBar: AppBar(
          backgroundColor: Color(0xff4444654),
          title: Text('ContactUs'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Transform.translate(
              offset: Offset(0, 20.h),
              child: Container(
                height: 90.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35.sp),
                    )),
              ),
            ),
            Positioned(
              top: 5.h,
              left: 25.w,
              child: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 50.sp,
                ),
                radius: 75.sp,
              ),
            ),
            Positioned(
              top: 30.h,
              left: 23.w,
              child: Text(
                'Al Mouayad Shwin',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Positioned(
              top: 37.h,
              left: 12.w,
              child: Container(
                width: 35.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.sp),
                  ),
                  border: Border.all(
                    color: Color(0xff343541),
                    width: 1.8.sp,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.message_outlined),
                    Text(
                      'Message',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 37.h,
              left: 54.w,
              child: GestureDetector(
                onTap: (){
                  calling();
                },
                child: Container(
                  width: 35.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.sp),
                    ),
                    border: Border.all(
                      color: Color(0xff343541),
                      width: 1.8.sp,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone),
                      Text(
                        'Call',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50.h,
              left: 12.w,
              child: GestureDetector(
                onTap: (){
                  launchwhatsapp();
                },
                child: Container(
                  width: 78.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.sp),
                    ),
                    border: Border.all(
                      color: Color(0xff343541),
                      width: 1.8.sp,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Whatsapp',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 40.w,
                      ),
                      Icon(Icons.phone),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 62.h,
              left: 12.w,
              child: Container(
                width: 78.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.sp),
                  ),
                  border: Border.all(
                    color: Color(0xff343541),
                    width: 1.8.sp,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Telegram',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Icon(Icons.phone),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 74.h,
              left: 12.w,
              child: Container(
                width: 78.w,
                height: 10.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.sp),
                  ),
                  border: Border.all(
                    color: Color(0xff343541),
                    width: 1.8.sp,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Facebook',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    Icon(Icons.phone),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
