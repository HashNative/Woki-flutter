
import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/utils/utils.dart';

import 'package:flutter_ui_collections/services/webservices.dart';
import 'package:flutter_ui_collections/services/apilistener.dart';

class PageComingSoon extends StatefulWidget {
  
  @override
  _PageComingSoonState createState() => _PageComingSoonState();
}

class _PageComingSoonState extends State<PageComingSoon> {
  Screen size;
ApiListener mApiListener;
  @override
  void initState() {
    super.initState();
    

  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Ticket",
              style:
              TextStyle(fontFamily: "Exo2", color: backgroundColor)),
          backgroundColor: colorCurve,
        ),
        body: Center(
            child: Container(
                // width: size.getWidthPx(300),
                // height: size.getWidthPx(300),
                // child: Image.asset("assets/icons/icn_coming_soon.png"),
            //     child: RaisedButton(
            //           child: Text("Get Data"),
            //           onPressed: WebServices(this.mApiListener).getData,
            // )  
                ),
            
                )
            
    );
  }

}


