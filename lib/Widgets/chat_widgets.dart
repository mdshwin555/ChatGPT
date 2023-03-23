// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:flutter/services.dart';
//
// class ChatWidget extends StatelessWidget {
//   final String msg;
//   final int chatIndex;
//
//   ChatWidget({
//     required this.msg,
//     required this.chatIndex,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.only(
//             top: 1.h,
//             bottom: 1.h,
//             left: 2.w,
//           ),
//           decoration: BoxDecoration(
//             color: chatIndex == 0 ? Color(0xff343541) : Color(0xff4444654),
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Image.asset(
//                 chatIndex == 0
//                     ? 'assets/images/person.png'
//                     : 'assets/images/chat_logo.png',
//                 height: 25.sp,
//                 width: 25.sp,
//               ),
//               SizedBox(
//                 width: 1.w,
//               ),
//               Expanded(
//                 child: chatIndex == 0
//                     ? Text(
//                         msg,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12.sp,
//                         ),
//                       )
//                     : DefaultTextStyle(
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 12.sp,
//                         ),
//                         child: AnimatedTextKit(
//                             isRepeatingAnimation: false,
//                             repeatForever: false,
//                             displayFullTextOnTap: true,
//                             totalRepeatCount: 1,
//                             animatedTexts: [
//                               TyperAnimatedText(
//                                 msg.trim(),
//                               ),
//                             ]),
//                       ),
//               ),
//               chatIndex == 0
//                   ? const SizedBox.shrink()
//                   : Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         IconButton(
//                           icon: Icon(
//                             Icons.thumb_up_alt_outlined,
//                             color: Colors.white,
//                           ), onPressed: () {  },
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                       ],
//                     ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
