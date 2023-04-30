import 'package:flutter/material.dart';

class ParcelOffice {
  String companyName;
  String mobileNumber;
  String address;

  ParcelOffice({required this.companyName, required this.mobileNumber, required this.address});
}

class NearbyParcelOffices extends StatelessWidget {
  final List<ParcelOffice> parcelOffices = [
    ParcelOffice(
        companyName: 'Akshar International Center',
        mobileNumber: '9825007034',
        address: 'Balaji Complex, 12 LL, Nehru Park, Vastrapur, Ahemdabad, Gujarat'),
    ParcelOffice(
        companyName: 'Shree Trivedi International-Courier Service',
        mobileNumber: '9824506565',
        address: 'President House, 1, opp. c n vidyalay, Ambavadi, Ahemdabad, Gujarat'),
    ParcelOffice(
        companyName: 'Shree Mahavir Courier Service PVT LTD',
        mobileNumber: '8905879453',
        address: 'LL-22 Gokul Complex(Sankalp Restaurant BLD, Drive In Rd, opp.Gurukul Temple, Memnagar, Ahemdabad'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Parcel Offices'),
      ),
      body: ListView.builder(
        itemCount: parcelOffices.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(parcelOffices[index].companyName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mobile Number: ${parcelOffices[index].mobileNumber}'),
                  Text('Address: ${parcelOffices[index].address}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: NearbyParcelOffices()));
