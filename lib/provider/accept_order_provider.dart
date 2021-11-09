import 'package:driver_toot/models/new_order_model.dart';
import 'package:driver_toot/servise/api_order.dart';
import 'package:flutter/material.dart';

class AcceptOrderProvider extends ChangeNotifier {
  AcceptOrderProvider() {
    // acceptOrder(order.id);
  }
  NewOrdersModel order = new NewOrdersModel();

  void acceptOrder(int? id) {
    ApiOrder.instance
      ..acceptOrder(id).then((newOrder) {
        order = newOrder!;
        notifyListeners();
      });
  }

// void addToFav(Movie movie){
//   movie.isfav = !movie.isfav;
//   notifyListeners();
// }
//
// void removeMovie (Movie movie){
//   movies.remove(movie);
//
//   notifyListeners();
// }
}
