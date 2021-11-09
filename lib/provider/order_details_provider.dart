import 'package:driver_toot/models/new_order_model.dart';
import 'package:driver_toot/models/order_details.dart';
import 'package:driver_toot/servise/api_order.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderDetailsProvider extends ChangeNotifier {
  OrderDetailsProvider(NewOrder order) {
    getOrderDetails(order.id);
  }
  OrderDetailsModel order = new OrderDetailsModel();

  String? lang;
  update() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString("lang")!;
    notifyListeners();
  }

  void getOrderDetails(int? id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString("lang") ?? "en";
    ApiOrder.instance.getOrderDetails(id, lang ?? "en").then((newOrder) {
      order = newOrder!;
      notifyListeners();
    });
  }
}
