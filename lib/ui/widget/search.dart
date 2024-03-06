import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'search');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 15,
        ),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(children: [
              Icon(
                CupertinoIcons.search,
                color: Color.fromARGB(255, 243, 164, 16),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text('Buscar...'),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
