import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

//anasayfa
class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: const Color(0xff3a434d),
      ),
      drawer: const NavDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(left: 45),
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 600,
            width: 600,
            child: GridView.count(
              crossAxisCount: 2,
              scrollDirection: Axis.horizontal,
              children: List.generate(2, (index) {
                return CardWidget(
                  object: listobjects[index],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

//sayfadaki kartlar
class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, this.object}) : super(key: key);
  final ListObject? object;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Get.toNamed(object!.function);
      }),
      child: Card(
        color: const Color(0xfff4ac47),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                object!.title,
                style: const TextStyle(color: Color(0xff3a434d)),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Icon(
                object!.icon,
                color: const Color(0xff3a434d),
                size: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//cart özellikleri classı
class ListObject {
  const ListObject(this.title, this.icon, this.function);
  final String title;
  final IconData icon;
  final String function;
}

//statik elemanlar
const List<ListObject> listobjects = <ListObject>[
  ListObject("BMI CALCULATOR", Icons.calculate, "/bmicalculator"),
  ListObject("DAILY PROGRAM", Icons.fitness_center, "/dailyprogram")
];

//drawer (yan tarafta açılan sekme)
class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xfff4ac47),
            ),
            child: Center(
              child: Row(
                children: const [
                  Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Codes Insider",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text("Home"),
            leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Profile"),
            leading: IconButton(
              icon: Icon(Icons.account_circle),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("Contact"),
            leading: IconButton(
              icon: Icon(Icons.contact_page),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
