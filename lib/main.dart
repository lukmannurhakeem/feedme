import 'package:feed_me/constant/color_constant.dart';
import 'package:feed_me/controller/bot_controller.dart';
import 'package:feed_me/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderController()),
        ChangeNotifierProvider(
          create: (context) => BotController(context.read<OrderController>()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: McDonaldsOrderApp(),
    );
  }
}

class McDonaldsOrderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderController = context.watch<OrderController>();
    final botController = context.watch<BotController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.primaryColor,
        title: Text(
          'McDonald\'s Order Management',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorConstant.tertiaryColor),
        ),
      ),
      body: Column(
        children: [
          // Buttons for Orders and Bots
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.secondaryColor,
                ),
                onPressed: () => orderController.addOrder('Normal'),
                child: Text(
                  'New Normal Order',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.secondaryColor,
                ),
                onPressed: () => orderController.addOrder('VIP'),
                child: Text(
                  'New VIP Order',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.secondaryColor,
                ),
                onPressed: botController.addBot,
                child: Text(
                  '+ Bot',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstant.secondaryColor,
                ),
                onPressed: botController.removeBot,
                child: Text(
                  '- Bot',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ],
          ),

          // Pending and Complete Orders Display
          Expanded(
            child: Row(
              children: [
                // Pending Orders
                Expanded(
                  child: Column(
                    children: [
                      Text('PENDING', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Expanded(
                        child: ListView.builder(
                          itemCount: orderController.pendingOrders.length,
                          itemBuilder: (context, index) {
                            final order = orderController.pendingOrders[index];
                            return ListTile(
                              title: order.type == 'VIP'
                                  ? Text(
                                      'Order : ${order.id} (${order.type})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: ColorConstant.vipColor),
                                    )
                                  : Text(
                                      'Order : ${order.id} (${order.type})',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // Complete Orders
                Expanded(
                  child: Column(
                    children: [
                      Text('COMPLETE', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Expanded(
                        child: ListView.builder(
                          itemCount: orderController.completeOrders.length,
                          itemBuilder: (context, index) {
                            final order = orderController.completeOrders[index];
                            return ListTile(
                              title: order.type == 'VIP'
                                  ? Text(
                                      'Order : ${order.id} (${order.type})',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: ColorConstant.vipColor),
                                    )
                                  : Text(
                                      'Order : ${order.id} (${order.type})',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bots Display
          Text('Bots:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Wrap(
            children: botController.bots
                .map(
                  (bot) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Chip(
                      label: Text('Bot : ${bot.id} (${bot.status})'),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
