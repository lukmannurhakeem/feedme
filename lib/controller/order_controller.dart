import 'package:feed_me/model/order_model.dart';
import 'package:flutter/material.dart';

class OrderController extends ChangeNotifier {
  int _orderCounter = 0;
  final List<OrderModel> _pendingOrders = [];
  final List<OrderModel> _completeOrders = [];

  List<OrderModel> get pendingOrders => _pendingOrders;
  List<OrderModel> get completeOrders => _completeOrders;

  void addOrder(String type) {
    _orderCounter++;
    final newOrder = OrderModel(_orderCounter, type);

    if (type == 'VIP') {
      // Insert VIP orders before normal orders
      final normalIndex = _pendingOrders.indexWhere((order) => order.type == 'Normal');
      if (normalIndex == -1) {
        _pendingOrders.add(newOrder);
      } else {
        _pendingOrders.insert(normalIndex, newOrder);
      }
    } else {
      _pendingOrders.add(newOrder);
    }

    notifyListeners();
  }

  OrderModel? getNextOrder() {
    if (_pendingOrders.isNotEmpty) {
      return _pendingOrders.removeAt(0);
    }
    return null;
  }

  void completeOrder(OrderModel order) {
    _completeOrders.add(order);
    notifyListeners();
  }
}
