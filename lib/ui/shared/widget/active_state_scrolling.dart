import 'package:dio_traning/core/provider/userProvider.dart';
import 'package:dio_traning/ui/shared/widget/person_state_top_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActiveStateHorisantalSocrolling extends StatelessWidget {
  ActiveStateHorisantalSocrolling({required this.name, required this.imageUrl, required this.itemCount});
  final String name;
  final String imageUrl;
  final int itemCount;
  @override
  Widget build(BuildContext context) {

        return SizedBox(
          height: 90,
          child: ListView.builder(
               scrollDirection: Axis.horizontal,
               itemCount: itemCount,
               itemBuilder: (context, index){
                 return PersonStateTopList(name: name, imageUrl: imageUrl,);
               },
             )

        );

    }
  }


// SizedBox(
// width: 20,
// ),
// PersonStateTopList(),
// SizedBox(
// width: 20,
// ),
// PersonStateTopList(),
// SizedBox(
// width: 20,
// ),
// PersonStateTopList(),
// SizedBox(
// width: 20,
// ),
// PersonStateTopList(),
// SizedBox(
// width: 20,
// ),
// PersonStateTopList(),
// SizedBox(
// width: 20,
// ),