import 'package:flutter/material.dart';
import 'package:zatayo/view/common_widget/common_app_bar_widget.dart';

class WatchHomeWorkOut extends StatefulWidget {
  static const String routeName = "/watch-home-work-out";

  const WatchHomeWorkOut({super.key});

  @override
  State<WatchHomeWorkOut> createState() => _WatchHomeWorkOutState();
}

class _WatchHomeWorkOutState extends State<WatchHomeWorkOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonAppBarWidget(title: 'Yoga Session'),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/video.png'),
            ),
          ],
        ),
      ),
    );
  }
}
