import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_1/components/custom_textfield.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController message = TextEditingController();
  File? _selectedImage;
  List<String> menuItems = ['Camera', 'Gallery'];

  Future _pickImaheFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  Future _pickImaheFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (p0, p1, p2) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/photo_2024-05-03_20-09-05.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.grey.withOpacity(0.3),
                      height: 10.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.arrow_back),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white),
                                child: Icon(Icons.person),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16.sp),
                                  ),
                                  Text(
                                    'Online',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.sp),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              PopupMenuButton<String>(
                                onSelected: (value) {
                                  if (value == 'Settings') {
                                  } else if (value == 'Help') {}
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<String>>[
                                  PopupMenuItem<String>(
                                    value: 'View Travel Profile',
                                    child: Text('View Travel Profile'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Order Qr Create',
                                    child: Text('Order Qr Create'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Done Order',
                                    child: Text('Done Order'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Mute Notification',
                                    child: Text('Mute Notification'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Block',
                                    child: Text('Block'),
                                  ),
                                  PopupMenuItem<String>(
                                    value: 'Clear Chat',
                                    child: Text('Clear Chat'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: ListView()),
                    Container(
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: customTextFormField(
                              color: Colors.transparent,
                              text: '  Enter The Message...',
                            ),
                          ),
                          PopupMenuButton<String>(
                            itemBuilder: (BuildContext context) {
                              return menuItems.map((String item) {
                                return PopupMenuItem<String>(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList();
                            },
                            onSelected: (String selectedItem) {
                              if (selectedItem == 'Camera') {
                                _pickImaheFromCamera();
                              } else {
                                _pickImaheFromGallery();
                              }
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.mic,
                              color: Colors.amber,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(8),
                            height: 5.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color.fromARGB(255, 14, 144, 146),
                            ),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
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
        );
      },
    );
  }
}
