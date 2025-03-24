import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Center(
          child: const Text("Home Page",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white

          ),),
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: CustomScrollView(
         slivers: [
           SliverToBoxAdapter(
             child: Column(
               children: [
                 Card(
                   child: ListTile(
                     title:  const Text("Earning"),
                     subtitle: Text("NGN"),
                   ),
                 ),
                 const Divider(
                   thickness: 5,
                 ),
                 Card(
                   child: ListTile(
                     title:  const Text("Referral code"),
                     subtitle: Text("NGN"),
                     trailing: IconButton(onPressed: (){},
                         icon: Icon(Icons.copy_outlined),
                     ),
                   ),
                 ),
                 const Divider(
                   thickness: 5,
                 ),
                 Card(
                   child: Column(
                     children: [
                       Padding(padding: const EdgeInsets.all(60),
                       child: const Text(
                           "Invite your friends to earn NGN500",
                       textAlign: TextAlign.center),
                       ),
                       Container(
                         child: TextButton(onPressed: (){
                           String sharelink = "Join our app  ";
                         },
                             child: const  Text("Share link"),),
                       ),
                       const Divider(
                         thickness: 5,
                       ),
                       Container(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text("Referral"),
                             Text("30")
                           ],
                         ),
                       ),
                       ...List.generate(4,(index) {
                         return Container(
                           height: 60,
                           margin: const EdgeInsets.only(bottom: 5),
                           child: ListTile(
                             leading: CircleAvatar(),
                             title: const Text("Email address "),
                           ),
                         );
                       } ,),
                     ],
                   ),
                 )
               ],
             ),
           )
         ],
        ),
      ) ,
    );
  }
}
