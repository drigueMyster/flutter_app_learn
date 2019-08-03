import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'shop_items.dart';

class DashBoardApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DashBoardAppState();
  }
}

class DashBoardAppState extends State<DashBoardApp> {
  static String routeName = "/dashboard";

  final List<List<double>> charts =
  [
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4],
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4,],
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4]
  ];
  static final List<String> chartDropdownItems = [ 'Last 7 days', 'Last month', 'Last year' ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        title: Row(
          children: <Widget>[
            Hero(
                tag: "showImg",
                child: CircleAvatar(
                  foregroundColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                      "https://media.licdn.com/dms/image/C5603AQG91LGP0FpbQw/profile-displayphoto-shrink_200_200/0?e=1570060800&v=beta&t=kKG-WDGKZDXprNwGQoovQjX2MsvQaAfiF2DsOCpe6kA"),
                )
            ),
            Container(
              margin: EdgeInsets.only(left: 5.0),
              child:  Text(
                "Dashboard",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),
              ),
            )
          ],
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("driguemyster.com",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_drop_down, color: Colors.black54),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              _showFirstCard(context),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: _showSecondCard(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: _showThirdCard(context),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: _showLastCard(context),
              ),
            ],
          ),
        ),
      )
    );
  }

  Widget _showFirstCard(BuildContext context) {
    return Material(
      shadowColor: Colors.blue,
      borderRadius: BorderRadius.circular(10.0),
      elevation: 10.0,
      child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Total Views",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "265K",
                      style: TextStyle(color: Colors.black, fontSize: 34.0),
                    )
                  ],
                ),
                Material(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.timeline,
                      color: Colors.white,
                      size: 30.0,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _showSecondCard(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Material(
              shadowColor: Colors.blue,
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                margin: EdgeInsets.all(10.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Material(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(40.0),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Icon(
                                Icons.settings_applications,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            )),
                        Text("General",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text("Images & Videos",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Colors.blue,
                elevation: 10.0,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Material(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(40.0),
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Icon(
                                  Icons.notifications_none,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                              )),
                          Text("Notifications",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold)),
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text("All notifications",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _showThirdCard(BuildContext context){
    return Material(
      borderRadius: BorderRadius.circular(10.0),
      elevation: 10.0,
      shadowColor: Colors.blue,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Revenue", style: TextStyle(color: Colors.green, fontSize: 18.0, fontWeight: FontWeight.bold),),
                    Text("\$160K", style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),)
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 8.0),
                  child: Row(
                    children: <Widget>[
                      DropdownButton
                        (
                          isDense: true,
                          value: actualDropdown,
                          onChanged: (String value) => setState(()
                          {
                            actualDropdown = value;
                            actualChart = chartDropdownItems.indexOf(value); // Refresh the chart
                          }),
                          items: chartDropdownItems.map((String title)
                          {
                            return DropdownMenuItem
                              (
                              value: title,
                              child: Text(title, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w400, fontSize: 14.0)),
                            );
                          }).toList()
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(bottom: 4.0)),
            Sparkline
              (
              data: charts[actualChart],
              lineWidth: 5.0,
              lineColor: Colors.greenAccent,
            )
          ],
        ),
      ),
    );
  }

  Widget _showLastCard(BuildContext context) {
    return Material(
      shadowColor: Colors.blue,
      borderRadius: BorderRadius.circular(10.0),
      elevation: 10.0,
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ShopItemState.routeName);
        },
        child: Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "Show Items",
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "173",
                        style: TextStyle(color: Colors.black, fontSize: 34.0),
                      )
                    ],
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.pink,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.store,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  )
                ],
              ),
            )),
      )
    );
  }
}
