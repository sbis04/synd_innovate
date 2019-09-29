// import 'package:flutter/material.dart';

// class ShareBottomSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BottomSheet(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.horizontal(
//           left: Radius.circular(10.0),
//           right: Radius.circular(10.0),
//         ),
//       ),
//       builder: (context) {
//         return Container(
//           height: 200.0,
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 30.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   /// Whatsapp logo button
//                   logoButton(
//                     text: "WhatsApp",
//                     iconPath: 'whatsapp-social-media-icon.jpg',
//                     onTapped: null,
//                   ),

//                   /// Facebook logo button
//                   logoButton(
//                     text: "Facebook",
//                     iconPath: 'facebook-logo.jpg',
//                     onTapped: null,
//                   ),

//                   /// Instagram logo button
//                   logoButton(
//                     text: "Instagram",
//                     iconPath: 'instagram-social-media-icon.jpg',
//                     onTapped: null,
//                   ),

//                   /// Download logo
//                   Column(
//                     children: <Widget>[
//                       IconButton(
//                         iconSize: 40.0,
//                         icon: Icon(Icons.file_download),
//                         onPressed: () => print("Tapped download"),
//                       ),
//                       Text("Download")
//                     ],
//                   ),
//                 ],
//               )
//             ],
//           ),
//         );
//       },
//       backgroundColor: Colors.white,
//       onClosing: () {},
//     );
//   }

//   Widget logoButton({String text, String iconPath, Function onTapped}) {
//     return Column(
//       children: <Widget>[
//         IconButton(
//           iconSize: 40.0,
//           icon: Image.asset(
//             'assets/icons/' + iconPath,
//           ),
//           onPressed: onTapped,
//         ),
//         Text(text)
//       ],
//     );
//   }
// }
