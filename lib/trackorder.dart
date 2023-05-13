import 'package:flutter/material.dart';

class OrderStatus {
  final String station;
  final String time;
  final bool checked;

  OrderStatus(
      {required this.station, required this.time, this.checked = false});
}

class TrackOrder extends StatefulWidget {
  final String? time;
  final bool? isLastLocation;
  TrackOrder({required this.time ,this.isLastLocation});

  @override
  _TrackOrderPageState createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrder> {
  final List<OrderStatus> _orderStatuses = [];

  @override
  void initState() {
    _orderStatuses.add(OrderStatus(station: 'Order Placed', time: widget.time!, checked:true));
    _orderStatuses.add(OrderStatus(station: 'Processing', time: widget.time!, checked: true));
    _orderStatuses.add(OrderStatus(station: 'Shipped', time: widget.time!, checked: widget.isLastLocation!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF1c1c1c),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          color:Colors.white,
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:Row(
          children: [
            Text("Track Order",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
          ],
        ),
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
