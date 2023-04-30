import 'package:flutter/material.dart';

class OrderStatus {
  final String station;
  final String time;
  final bool checked;

  OrderStatus(
      {required this.station, required this.time, this.checked = false});
}

class TrackOrder extends StatefulWidget {
  @override
  _TrackOrderPageState createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrder> {
  final List<OrderStatus> _orderStatuses = [
    OrderStatus(
        station: 'Order Placed', time: '2023-04-16 10:30 AM', checked: true),
    OrderStatus(station: 'Processing', time: '2023-04-16 11:00 AM'),
    OrderStatus(station: 'Shipped', time: '2023-04-16 2:00 PM'),
    OrderStatus(station: 'Out for Delivery', time: '2023-04-17 9:00 AM'),
    OrderStatus(station: 'Delivered', time: '2023-04-17 11:30 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track Order'),
      ),
      body: ListView.builder(
        itemCount: _orderStatuses.length,
        itemBuilder: (context, index) {
          final orderStatus = _orderStatuses[index];
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: Checkbox(
                    value: orderStatus.checked,
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderStatus.station,
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      orderStatus.time,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
