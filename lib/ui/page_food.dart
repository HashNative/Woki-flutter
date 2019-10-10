import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui_collections/model/models.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:flutter_ui_collections/widgets/widgets.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  Screen size;
  int _selectedIndex = 1;

  List<Property> premiumList =  List();
  List<Property> featuredList =  List();
  var citiesList = ["Wellawatte", "Bambalapitiya", "Dehiwala ", "Pettah","Kirulapone","Mt.Lavinia","Borella","Nugegoda"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    premiumList
    ..add(Property(propertyName:"Pop Corn Chicken Meal", propertyLocation:"KFC ", image:"food-1.jpg", propertyPrice:"10,000 LKR"))
    ..add(Property(propertyName:"Fillet Tower Burger", propertyLocation:"KFC ", image:"food-2.jpg", propertyPrice:"12,500 LKR"))
    ..add(Property(propertyName:"Chicken Sawan", propertyLocation:"Almass ", image:"food-3.jpg", propertyPrice:"9,850 LKR"))
    ..add(Property(propertyName:"Fried Rice", propertyLocation:"Hotel de pilawoos ", image:"food-4.jpg", propertyPrice:"18,500 LKR"))
    ..add(Property(propertyName:"N.G Tower", propertyLocation:"Town Hall ", image:"hall_2.jpeg", propertyPrice:"7,300 LKR"))
    ..add(Property(propertyName:"Vishwas CityRise", propertyLocation:"Kollupitiya ", image:"hall_1.jpg", propertyPrice:"5,300 LKR"))
    ..add(Property(propertyName:"Gift City", propertyLocation:"Bambalapitiya ", image:"hall_2.jpeg", propertyPrice:"6,300 LKR"))
    ..add(Property(propertyName:"Velone City", propertyLocation:"Wellawatte ", image:"feature_1.jpg", propertyPrice:"7,300 LKR"))
    ..add(Property(propertyName:"PabelBay", propertyLocation:"Dehiwala ", image:"hall_1.jpg", propertyPrice:"12,000 LKR"))
    ..add(Property(propertyName:"Sapath Hexa Tower", propertyLocation:"Bambalapitiya", image:"feature_3.jpg", propertyPrice:"5,500 LKR"));



  }

  @override
  Widget build(BuildContext context) {
    size = Screen(MediaQuery.of(context).size);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: backgroundColor),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[upperPart()],
            ),
          ),
        ),
      ),
    );
  }

  Widget upperPart() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: UpperClipper(),
          child: Container(
            height: size.getWidthPx(240),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [colorCurve, foodColorCurveSecondary],
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: size.getWidthPx(36)),
              child: Column(
                children: <Widget>[
                  titleWidget(),
                  SizedBox(height: size.getWidthPx(10)),
                  upperBoxCard(),
                ],
              ),
            ),
            leftAlignText(
                text: "Hot Offers",
                leftPadding: size.getWidthPx(16),
                textColor: textPrimaryColor,
                fontSize: 16.0),
            HorizontalList(
              children: <Widget>[
                for (int i = 0; i < premiumList.length; i++)
                  propertyCard(premiumList[i])
              ],
            ),
            leftAlignText(
                text: "Upcomming Offers",
                leftPadding: size.getWidthPx(16),
                textColor: textPrimaryColor,
                fontSize: 16.0),
            HorizontalList(
              children: <Widget>[
                for (int i = 0; i < premiumList.length; i++)
                  propertyCard(premiumList.reversed.toList()[i])

              ],
            )
          ],
        ),
      ],
    );
  }

  Text titleWidget() {
    return Text("What food offers\nyou want to explore?",
        style: TextStyle(
            fontFamily: 'Exo2',
            fontSize: 24.0,
            fontWeight: FontWeight.w900,
            color: Colors.white));
  }

  Card upperBoxCard() {
    return Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(
            horizontal: size.getWidthPx(20), vertical: size.getWidthPx(16)),
        borderOnForeground: true,
        child: Container(
          height: size.getWidthPx(150),
          child: Column(
            children: <Widget>[
              _searchWidget(),
              leftAlignText(
                  text: "Top Foods :",
                  leftPadding: size.getWidthPx(16),
                  textColor: textPrimaryColor,
                  fontSize: 16.0),
              HorizontalList(
                children: <Widget>[
                  for(int i=0;i<citiesList.length;i++)
                    buildChoiceChip(i, citiesList[i])
                ],
              ),
            ],
          ),
        ));
  }

  BoxField _searchWidget() {
    return BoxField(
        controller: TextEditingController(),
        focusNode: FocusNode(),
        hintText: "Select by Food, area or locality.",
        lableText: "Search...",
        obscureText: false,
        onSaved: (String val) {},
        icon: Icons.search,
        iconColor: foodColorCurve);
  }

  Padding leftAlignText({text, leftPadding, textColor, fontSize, fontWeight}) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text??"",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'Exo2',
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.w500,
                color: textColor)),
      ),
    );
  }

  Card propertyCard(Property property) {
    return Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        borderOnForeground: true,
        child: Container(
            height: size.getWidthPx(150),
            width: size.getWidthPx(170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0)),
                    child: Image.asset('assets/${property.image}',
                        fit: BoxFit.fill)),
                SizedBox(height: size.getWidthPx(8)),
                leftAlignText(
                    text: property.propertyName,
                    leftPadding: size.getWidthPx(8),
                    textColor: colorCurve,
                    fontSize: 14.0),
                leftAlignText(
                    text: property.propertyLocation,
                    leftPadding: size.getWidthPx(8),
                    textColor: Colors.black54,
                    fontSize: 12.0),
                SizedBox(height: size.getWidthPx(4)),
                leftAlignText(
                    text: property.propertyPrice,
                    leftPadding: size.getWidthPx(8),
                    textColor: colorCurve,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w800),
              ],
            )));
  }

  Padding buildChoiceChip(index, chipName) {
    return Padding(
      padding: EdgeInsets.only(left: size.getWidthPx(8)),
      child: ChoiceChip(
        backgroundColor: backgroundColor,
        selectedColor: colorCurve,
        labelStyle: TextStyle(
            fontFamily: 'Exo2',
            color:
                (_selectedIndex == index) ? backgroundColor : textPrimaryColor),
        elevation: 4.0,
        padding: EdgeInsets.symmetric(
            vertical: size.getWidthPx(4), horizontal: size.getWidthPx(12)),
        selected: (_selectedIndex == index) ? true : false,
        label: Text(chipName),
        onSelected: (selected) {
          if (selected) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}
