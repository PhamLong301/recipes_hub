import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cài đặt'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: loginWidget(context),
                  ),
                  const Divider(),
                  InkWell(child: buildSettingItem('Thay đổi ngôn ngữ')),
                  InkWell(child: buildSettingItem('Xóa tài khoản của bạn')),
                  InkWell(child: buildSettingItem('Thay đổi chủ đề')),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 180,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xfff5f7fa), // Light gray background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24), // Rounded corners
                      ),
                      elevation: 1, // Light shadow for subtle depth
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Color(0xff70B9BE), // Icon color matching text
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Đăng xuất',
                          style: TextStyle(
                            color: Color(0xff70B9BE),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loginWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.account_circle, // Replace with a custom icon if needed
              color: Colors.grey[600],
              size: 32,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Đăng nhập vào tài khoản',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSettingItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}
