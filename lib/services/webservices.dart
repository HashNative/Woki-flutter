import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_ui_collections/model/models.dart';
import 'package:flutter_ui_collections/services/services.dart';
import 'package:flutter_ui_collections/utils/utils.dart';
import 'package:http/http.dart' as http;

class WebServices {
  ApiListener mApiListener;

  final JsonDecoder _decoder = new JsonDecoder();

  WebServices(this.mApiListener);

  //This Function executed after any Success call of API
  void _onSuccessResponse(Object mObject) {
    mApiListener.onApiSuccess(mObject);
  }

  // This Function executed after any failure call of API

  void _onFailureResponse(Object mThrowable) {
    // Call on failure method of ApiListener Interface
    mApiListener.onApiFailure(mThrowable);
  }

  // This Function executed when internet connection is not available
  void _onNoInternetConnection() {
    mApiListener.onNoInternetConnection();
  }

  // This Function will get list of Photos from web-server.
  void getListOfPhotos(BuildContext context) async {
    if (await Utils.checkConnection()) {
      http.get(
        Constants.PHOTOSURL + Constants.PHOTOS,
        headers: {
          'Authorization': "Client-ID " + Constants.accessKey,
        },
      ).then((http.Response response) {
        final String res = response.body;
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          _onFailureResponse(new Exception("Error while fetching data"));
        } else {
          final parsed = json.decode(res).cast<Map<String, dynamic>>();
          List<PhotoResponse> photosList = parsed
              .map<PhotoResponse>((json) => PhotoResponse.fromJson(json))
              .toList();
          _onSuccessResponse(photosList);
        }
      });
    } else {
      _onNoInternetConnection();
      Utils.showAlert(context, "Flutter", "Internet is not connected.", () {
        Navigator.pop(context);
      }, true);
    }
  }

 Future<List<Data>> getData() async{

      var user = await http.get("https://www.hashnative.com/alloffers");
      var jsonData = json.decode(user.body);

      List<Data> datas = [];

      for (var d in jsonData){

      Data data = Data(d["id"],d["name"],d["location"],d["offer_item"],d["offer_price"],d["logo"],d["contact"],d["radius"]);
        datas.add(data);
      }
      return datas;
  }


}


class Data {
   final String id;
  final String name;
  final String location;
  final String offerItem;
  final String offerPrice;
  final String logo;
  final String contact;
  final String radius;
 

  Data(this.id, this.name, this.location, this.offerItem, this.offerPrice, this.logo, this.contact, this.radius);




}

