import 'dart:async';
import 'package:feed_me/model/order_model.dart';
import 'package:flutter/material.dart';
import 'order_controller.dart';

class Bot {
  final int id;
  String status = 'IDLE'; // IDLE or PROCESSING
  OrderModel? currentOrder;

  Bot(this.id);
}

class BotController extends ChangeNotifier {
  final OrderController orderController;
  int _botCounter = 0;
  final List<Bot> _bots = [];

  BotController(this.orderController);

  List<Bot> get bots => _bots;

  void addBot() {
    _botCounter++;
    final bot = Bot(_botCounter);
    _bots.add(bot);
    _processOrders(bot);
    notifyListeners();
  }

  void removeBot() {
    if (_bots.isNotEmpty) {
      final bot = _bots.removeLast();
      if (bot.currentOrder != null) {
        // Return current processing order to the pending queue
        orderController.pendingOrders.insert(0, bot.currentOrder!);
        orderController.notifyListeners();
      }
      notifyListeners();
    }
  }

  void _processOrders(Bot bot) {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (bot.currentOrder == null && orderController.pendingOrders.isNotEmpty) {
        bot.currentOrder = orderController.getNextOrder();
        bot.status = 'PROCESSING';
        notifyListeners();

        Timer(Duration(seconds: 10), () {
          if (bot.currentOrder != null) {
            orderController.completeOrder(bot.currentOrder!);
            bot.currentOrder = null;
            bot.status = 'IDLE';
            notifyListeners();
          }
        });
      }
    });
  }
}
