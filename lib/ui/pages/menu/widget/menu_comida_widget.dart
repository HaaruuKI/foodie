import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuComidaWidget extends StatelessWidget {
  const MenuComidaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: snapshot.data?.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot product = snapshot.data!.docs[index];
            return ListTile(
              title: Text(product['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: ${product['price']}'),
                  Text('Category: ${product['category']}'),
                  // Text('Description: ${product['description']}'),
                ],
              ),
              leading: Image.network(product['img_url']),
            );
          },
        );
      },
    );
  }
}
