// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:zatayo/constant/app_color.dart';
// import 'package:zatayo/view/common_widget/common_container_widget.dart';
// import 'package:zatayo/view/common_widget/common_text_widget.dart';
//
// class MyFriendScreen extends StatefulWidget {
//   const MyFriendScreen({super.key});
//
//   @override
//   State<MyFriendScreen> createState() => _MyFriendScreenState();
// }
//
// class _MyFriendScreenState extends State<MyFriendScreen> {
//   List<Contact> _contacts = [];
//   bool _isLoading = false;
//
//   Future<void> _fetchContacts() async {
//     if (_isLoading) return;
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       final PermissionStatus permissionStatus = await Permission.contacts.request();
//
//       if (permissionStatus == PermissionStatus.granted) {
//         final contacts = await FlutterContacts.getContacts(withProperties: true);
//         setState(() {
//           _contacts = contacts;
//         });
//       } else {
//         _showPermissionDeniedDialog();
//       }
//     } catch (e) {
//       _showErrorDialog('Error fetching contacts: $e');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   void _showPermissionDeniedDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Permission Required'),
//         content: const Text(
//           'Contacts permission is required to fetch contacts. '
//               'Please enable it in settings.',
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               openAppSettings();
//             },
//             child: const Text('Open Settings'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Error'),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     _fetchContacts();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const CommonTextWidget(
//           text: "My Friends",
//           fontSize: 18,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xFF111214),
//                     Color(0xFF6D1F06),
//                   ],
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(height: 20),
//                     const ContainerWidget(
//                       borderRadius: 4,
//                       borderColor: Colors.transparent,
//                       borderWidth: 0,
//                       backgroundColor: Color(0xFF222222),
//                       width: double.infinity,
//                       height: 56,
//
//                     ),
//                     const SizedBox(height: 20),
//                     const CommonTextWidget(
//                       text: 'Contact',
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     const SizedBox(height: 10),
//
//                     const SizedBox(height: 20),
//
//
//                     Expanded(
//                       child: _isLoading
//                           ? const Center(child: CircularProgressIndicator())
//                           : _contacts.isEmpty
//                           ? const Center(
//                         child: Text(
//                           'No contacts available',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       )
//                           : ListView.builder(
//                         itemCount: _contacts.length,
//                         itemBuilder: (context, index) {
//                           final contact = _contacts[index];
//                           final phones = contact.phones;
//                           return  Container(
//                             height: 71,
//
//                             child: Column(
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Expanded(
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Expanded(
//                                             child: Row(
//                                               children: [
//                                                 CircleAvatar(
//                                                   child: Icon(Icons.person),
//                                                 ),
//                                                 SizedBox(width: 8,),
//                                                 Expanded(
//                                                   child: Column(
//                                                     mainAxisAlignment: MainAxisAlignment.center,
//                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                     children: [
//                                                       Row(
//                                                         children: [
//                                                           Expanded(child: CommonTextWidget(text: contact.displayName,
//                                                             overflow: TextOverflow.ellipsis,
//                                                           )),
//                                                         ],
//                                                       ),
//                                                       const Row(
//                                                         children: [
//                                                           ContainerWidget(borderRadius: 3,
//                                                             width: 10,
//                                                             height: 10,
//                                                             borderWidth: 0,
//                                                             borderColor: Colors.transparent,
//                                                             backgroundColor: Colors.red,
//                                                           ),
//                                                           Icon(Icons.arrow_drop_down_outlined),
//
//                                                         ],
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//
//
//                                           const ContainerWidget(borderRadius: 9,
//                                             height: 35,
//                                             width: 80,
//                                             borderColor: Colors.transparent,
//                                             borderWidth: 0,
//                                             backgroundColor: AppColor.kSecondaryButtonColor,
//                                             child: Row(
//                                               children: [
//                                                 Padding(
//                                                   padding: EdgeInsets.symmetric(horizontal: 5),
//                                                   child: Icon(
//                                                       Icons.person_add_alt_1
//                                                   ),
//                                                 ),
//                                                 CommonTextWidget(text: "Add",
//                                                   fontSize: 18,
//                                                   fontWeight: FontWeight.w500,
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//
//
//                                         ],
//                                       ),
//                                     ),
//                                     Row(
//                                       children: [
//                                         const SizedBox(
//                                           width: 20,
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.symmetric(vertical: 10),
//                                           child: Container(
//                                             height: 45,
//                                             width: 2,
//                                             color: Colors.grey,
//                                           ),
//                                         ),
//                                         const Padding(
//                                           padding: EdgeInsets.symmetric(horizontal: 20),
//                                           child: Icon(Icons.close,
//                                             color: Colors.grey,
//                                           ),
//                                         )
//                                       ],
//                                     )
//
//                                   ],
//                                 ),
//                                 Container(
//                                   width: double.infinity,
//                                   height: 1,
//                                   color: Colors.grey,
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
