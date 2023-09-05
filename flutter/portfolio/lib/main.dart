import 'package:flutter/material.dart';

void main()=> runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Demo task"),
        ),
        body: const ContainerTop(),
      ),
    );
  }
}

class ContainerTop extends StatefulWidget {
  const ContainerTop({super.key});

  @override
  State<ContainerTop> createState() => _ContainerTopState();
}

class CardInfo{
  String name;
  String url;

  CardInfo({required this.name, required this.url});
}

class _ContainerTopState extends State<ContainerTop> {
  int selectedContainerIndex = -1;

  final  List<CardInfo> containerValues =[
    CardInfo(
    name : "Luffy \n Bounty : 3,000,000,000",
      url : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFu1fGjAxYXqI3Am8otix7xAHLZxJn_HtWVGnCG642NUSYkEbSg10jdVcbU8jMcpc2eGmU&s',
    ),
    CardInfo(
      name : "Zoro \n Bounty : 1,111,000,000",
      url : 'https://e0.pxfuel.com/wallpapers/540/732/desktop-wallpaper-roronoa-zoro-for-iphone-and-android-zoro-android-thumbnail.jpg',
    ),
    CardInfo(
      name : "Sanji \n Bounty : 1,024,000,000",
      url : 'https://onepiece.store/wp-content/uploads/2021/05/Sanji-Merch-1.png',
    ),
    CardInfo(
      name : "Shanks \n Bounty : 4,384,000,000",
      url : 'https://w0.peakpx.com/wallpaper/1015/737/HD-wallpaper-one-piece-anime-shanks-thumbnail.jpg',
    ),
    CardInfo(
      name : "Ace \n Bounty : 5,000,000",
      url : 'https://www.myanimeguru.com/wp-content/uploads/2023/04/image-66-4-700x700.jpg.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: containerValues.length,
              itemBuilder: (context , index){
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedContainerIndex = index;
                    });
                  },

                  child: Container(
                    width: 180,
                    margin: const EdgeInsets.all(20),
                    color: selectedContainerIndex == index ? Colors.blueAccent : Colors.grey,
                    child: Image.network(containerValues[index].url,
                    fit: BoxFit.fill,),

                  ),
                );
              }
            ),
          ),
        ),
        Container(
          height: 100,
          child: const Center(
            child: Text("You have selected this character ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
              ),
          ),

        ),
        selectedContainerIndex != -1
            ? Container(
          height: 150,
          padding: const EdgeInsets.all(10),
            color: Colors.black,
          child: Center(
            child: Text(
              '${containerValues[selectedContainerIndex].name}',
              style: const TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
            : const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
