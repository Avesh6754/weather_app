import 'package:flutter/material.dart';

import '../../provider/HomeProvider.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.txtSearch,
    required this.provoiderfalse,
  });

  final TextEditingController txtSearch;
  final Homeprovider provoiderfalse;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: txtSearch,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(4),
              prefixIcon: IconButton(
                onPressed: () {
                  provoiderfalse.searchCity(txtSearch.text);
                },icon:Icon(Icons.search),
                color: Colors.white,
              ),
              hintText: 'Search City Weather',
              hintStyle: TextStyle(color: Colors.white),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.white,
                  )),
            ),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 10,),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/fav');
          },
          child: Container(
            height: 47,
            width: 47,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.white,width: 1)
            ),
            child: Icon(Icons.bookmark_border,color: Colors.white,)
          ),
        )
      ],
    );
  }
}