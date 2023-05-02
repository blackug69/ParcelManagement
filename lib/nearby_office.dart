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
            Text("Nearby Parcel Offices",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
          ],
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.only(top: 16),
        itemCount: parcelOffices.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
            color: Color(0xFF1c1c1c),
            shape: RoundedRectangleBorder(
                side: new BorderSide(color: Colors.grey, width: 3.0),
                borderRadius:  BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                    bottomLeft: Radius.circular(24.0),
                    bottomRight: Radius.circular(24.0))
            ),
            elevation: 8,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(parcelOffices[index].companyName,style: TextStyle(color: Colors.white),),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 6,),
                  Text('Mobile Number: ${parcelOffices[index].mobileNumber}',style: TextStyle(color: Colors.grey)),
                  Text('Address: ${parcelOffices[index].address}',style: TextStyle(color: Colors.grey)),
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
