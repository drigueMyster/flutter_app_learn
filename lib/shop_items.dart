import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ShopItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShopItemState();
  }
}

class ShopItemState extends State<ShopItem> {
  static String routeName = "shopItem";
 // FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
//    var initializationSettingsAndroid =
//        new AndroidInitializationSettings("@mipmap/ic_launcher");
//    var initializationSettingsIOS = new IOSInitializationSettings();
//    var initializationSettings = new InitializationSettings(
//        initializationSettingsAndroid, initializationSettingsIOS);
//    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//    flutterLocalNotificationsPlugin.initialize(initializationSettings);
//  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Text(
          "Shop Items (3)",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Material(
                  shadowColor: Colors.black,
                  borderRadius: BorderRadius.circular(35.0),
                  elevation: 15.0,
                  color: Colors.black,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 15.0, bottom: 15.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            //_showNotificationWithDefaultSound();
                          },
                          child: Text(
                            "ADD A NEW ITEM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: _firstCard(),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: _secondCard(),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Method 2
//  Future _showNotificationWithDefaultSound() async {
//    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//        '1', 'Hope', 'your channel description',
//        importance: Importance.Max, priority: Priority.High);
//    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
//    var platformChannelSpecifics = new NotificationDetails(
//        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    print('Showing en cours ...');
//    await flutterLocalNotificationsPlugin.show(
//      1,
//      'Alerte info',
//      'Hope juste a fullstack',
//      platformChannelSpecifics,
//    );
//
//   // await flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails)
//  }

  Widget _firstCard() {
    return Material(
      shadowColor: Colors.blue,
      borderRadius: BorderRadius.circular(10.0),
      elevation: 15.0,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Nike Jordan III",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text("4.6 ★",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 45.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                Material(
                    shadowColor: Colors.blue,
                    borderRadius: BorderRadius.circular(60.0),
                    elevation: 20.0,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Image(
                          image: NetworkImage(
                              "https://rukminim1.flixcart.com/image/714/857/jpinjbk0/shoe/8/h/4/ar4840-010-9-lotto-black-original-imaewa2sjfnjh6up.jpeg?q=50"),
                          height: 50.0,
                        ),
                      ),
                    )),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text("Bought 1,361 for a profit of "),
                    Material(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.0),
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "\$ 13K",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Widget _secondCard() {
    return

        /// Review
        Padding(
      padding: EdgeInsets.only(top: 160.0, left: 32.0),
      child: Material(
        elevation: 12.0,
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF84fab0), Color(0xFF8fd3f4)],
                  end: Alignment.topLeft,
                  begin: Alignment.bottomRight)),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 4.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.purple,
                child: Text('AI'),
              ),
              title: Text('Ivascu Adrian ★★★★★', style: TextStyle()),
              subtitle: Text(
                  'The shoes were shipped one day before the shipping date, but this wasn\'t at all a problem :). The shoes are very comfortable and good looking',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle()),
            ),
          ),
        ),
      ),
    );
  }
}
