import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:watchlist_bloc_lib/model/contact_data_model.dart';

Widget listItem(BuildContext context, List<Contact> contactdata) {
  return Container(
    padding: const EdgeInsets.only(top: 15),
    height: MediaQuery.of(context).size.height,
    width: double.infinity,
    child: ListView.builder(
        itemCount: contactdata.length == null ? 0 : contactdata.length,
        itemBuilder: (
          BuildContext context,
          int i,
        ) {
          return userList(context, i, contactdata[i].name,
              contactdata[i].contacts, contactdata[1].url);
        }),
  );
}

Widget userList(
    BuildContext context, int index, String name, String number, String url) {
  return Container(
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      color: Colors.white,
    ),
    width: double.infinity,
    height: 80,
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              const SizedBox(
                height: 6,
              ),
              // Row(
              //   children: <Widget>[
              //     const SizedBox(
              //       width: 5,
              //     ),
              //     Text(ContactData[index]['id'],
              //         style: const TextStyle(
              //             color: Colors.black,
              //             fontSize: 13,
              //             letterSpacing: .3)),
              //   ],
              // ),
              // const SizedBox(
              //   height: 6,
              // ),
              Row(
                children: <Widget>[
                  const SizedBox(
                    width: 5,
                  ),
                  Text(number,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          letterSpacing: .3)),
                ],
              ),
            ],
          ),
        ),
        Center(
          child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(left: 15),
              // child: Text('image'
              child: Image.network("https://picsum.photos/200")),
        ),
      ],
    ),
  );
}
