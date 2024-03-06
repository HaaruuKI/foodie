import 'package:flutter/material.dart';
import 'package:foodie/ui/pages/menu/widget/menu_comida_widget.dart';
import 'package:foodie/ui/widget/btn_back.dart';

class MenuComida extends StatelessWidget {
  const MenuComida({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: btnBack(context),
      ),
      body: MenuComidaWidget(),
      // StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance.collection('products').snapshots(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }

      //     return ListView.builder(
      //       itemCount: snapshot.data?.docs.length,
      //       itemBuilder: (context, index) {
      //         DocumentSnapshot product = snapshot.data!.docs[index];
      //         return ListTile(
      //           title: Text(product['name']),
      //           subtitle: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text('Price: ${product['price']}'),
      //               Text('Category: ${product['category']}'),
      //               // Text('Description: ${product['description']}'),
      //             ],
      //           ),
      //           leading: Image.network(product['img_url']),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}
