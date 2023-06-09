import 'package:flutter/material.dart';

import '../model/member _model.dart';

class MySearchPage extends StatefulWidget {
  const MySearchPage({Key? key}) : super(key: key);

  @override
  State<MySearchPage> createState() => _MySearchPageState();
}

class _MySearchPageState extends State<MySearchPage> {
  bool isLoading = false;
  var searchController = TextEditingController();
  List<Member> items = [];

  @override
  void initState() {
    super.initState();
    items.add(Member("Qodirxon", "kxan@gmail.com"));
    items.add(Member("Jahongir", "jahongir@gmail.com"));
    items.add(Member("G'iyosbek", "giyosbek@gmail.com"));
    items.add(Member("Habibatiy", "habibatiy@gmail.com"));
    items.add(Member("Speaker", "speaker@gmail.com"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Search",
          style: TextStyle(
              fontFamily: "Billabong", fontSize: 25, color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                //search box
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  height: 45,
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(7)),
                  child: TextField(
                    style: const TextStyle(color: Colors.black87),
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                      icon: Icon(
                        Icons.search_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),

                //member list
                Expanded(
                  child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (ctx, index) {
                        return itemOfMember(items[index]);
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemOfMember(Member member) {
    return Container(
      height: 90,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                border: Border.all(
                  width: 1.5,
                  color: const Color.fromRGBO(193, 53, 132, 1),
                )),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22.5),
              child: const Image(
                image: AssetImage("assets/images/ic_person.png"),
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                member.fullName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                member.email,
                style: const TextStyle(color: Colors.black54),
              ),
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: const Center(
                      child: Text('Follow'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
