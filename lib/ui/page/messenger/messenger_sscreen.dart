import 'package:dio_traning/core/provider/userProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/widget/active_state_scrolling.dart';
import '../../shared/widget/person_chat_tile.dart';
import '../../shared/widget/person_state_top_list.dart';
import '../../shared/widget/search_bar.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  // late Future<List<User>> reaeUser;
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<UserProvider>(context, listen: false).getUserProvider();
    super.initState();
    // reaeUser = UserApiController().read();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 20,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Row(
            children: const [
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/man.png'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "Chat",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          actions: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
                ),
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blue,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
                color: Colors.black,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blue,
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.logout,
                      size: 16,
                      color: Colors.white,
                    ))),
            const SizedBox(
              width: 10,
            ),
          ],
        ),


        body: Padding(
            padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
            child:  Consumer<UserProvider>(
              builder: (context, ussos, child) =>SingleChildScrollView(
                child: (
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchBar(),
                    const SizedBox(
                      height: 20,
                    ),
                SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ussos.users.length,
                      itemBuilder: (context, index){
                        return PersonStateTopList(name: ussos.users[index].firstName, imageUrl: ussos.users[index].image,);
                      },
                    )
                ),
                    const SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: ussos.users.length,
                              itemBuilder: (context, index) {
                                return PersonChatTile(
                                  name: ussos.users[index].firstName,
                                  hintMassege: ussos.users[index].jobTitle,
                                  imageUrl: ussos.users[index].image,
                                );
                              },
                            )

                  ],
                )
            ),
              )
        ),
        ));
  }

// else {
// return const Center(
// child: Text('No Data'),
// );
// }
// )
//
// );

}
//
// Future<void> _logout(BuildContext context) async {
//
//     ApiResponce apiResponce = await AuthApiController().logout();
//     if(apiResponce.status == true) {
//
//
//   }
// }
