import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recommended",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
          Text("See more"),
        ],
      ),
      SizedBox(height: 0),
      SizedBox(
        height: 350,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(7, (index) {
              return Container(
                width: 150,
                height: 250,
                margin: const EdgeInsets.only(right: 15),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Card background and content
                    Container(
                      margin: const EdgeInsets.only(top: 50), // Adjust margin to push content down
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 70.0), // Adjust padding to match new margin
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                                vertical: 8.0,
                              ),
                              child: Column(
                                  
                                children: [
                                  SizedBox(height: 49),
                                  
Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                
                                children: [

                                  Text(
                                    'Card ${index + 1}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                     
                                    ),
                                  ),
                                  SizedBox(height: 1),
                                  Row(
                                    children: [
                                      Icon(Icons.star, size: 12, color: Colors.amber),
                                      SizedBox(width: 2),
                                      Text(
                                        '4.9',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF6B6B6B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$15",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.add, color: Colors.white, size: 18),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                                ],
                              
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Image on top of card without Positioned
               Transform.translate(
  offset: const Offset(0, -25), // Move image up by 50 pixels
  child: Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: 200,
      width: 140,
      margin: const EdgeInsets.only(bottom: 10), // Adjust margin to overflow image slightly
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/bookCover.png",
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
)

                  ],
                ),
              );
            }),
          ),
        ),
      ),
    ],
  ),
),



//Best selller

Padding(
  padding: const EdgeInsets.all(12.0),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Bestseller",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 22,
            ),
          ),
          Text("See more"),
        ],
      ),
      SizedBox(height: 0),
      SizedBox(
        height: 200,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(7, (index) {
              return Container(
                width: 200,
                height: 140,
                margin: const EdgeInsets.only(right: 15),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Card background and content
                    Container(
                      margin: const EdgeInsets.only(top: 50), // Adjust margin to push content down
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 0.0), // Adjust padding to match new margin
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 8.0,
                              ),
                              child: Row(
                                  
                                children: [
                                  SizedBox(height: 0,width: 100,),
                                  
Container(
  width: 80,
  child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                  children: [
  
                                    Text(
                                      'Milk ${index + 1}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                     
                                      ),
                                    ),
                                    SizedBox(height: 1),
                                    Row(
                                      children: [
                                        Icon(Icons.star, size: 12, color: Colors.amber),
                                        SizedBox(width: 2),
                                        Text(
                                          '4.9',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF6B6B6B),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$15",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(Icons.add, color: Colors.white, size: 18),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
),

                                ],
                              
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // Image on top of card without Positioned
               Transform.translate(
  offset: const Offset(-47, -5), // Move image up by 50 pixels
  child: Align(
    alignment: Alignment.topCenter,
    child: Container(
      height: 800,
      width: 100,
      margin: const EdgeInsets.only(bottom: 10), // Adjust margin to overflow image slightly
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          "assets/bookCover.png",
          fit: BoxFit.cover,
        ),
      ),
    ),
  ),
)

                  ],
                ),
              );
            }),
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
