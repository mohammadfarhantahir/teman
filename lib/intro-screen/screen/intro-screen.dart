import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';


class IntroductionScreen extends StatefulWidget {
  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<String> titles = [
    "Welcome to Page 1",
    "Discover Page 2",
    "Learn Page 3",
  ];

  List<String> descriptions = [
    "This is the first page description.",
    "This is the second page description.",
    "This is the third page description.",
  ];

  List<String> imageUrls = [
    "https://raptorassistant.com/teman/assets/introductionscreen/intro1.png",
    "https://raptorassistant.com/teman/assets/introductionscreen/intro2.jpeg",
    "https://raptorassistant.com/teman/assets/introductionscreen/itnro3.png",
  ];

  void _navigateToNextPage() {
    if (_currentPage < titles.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    else if(_currentPage==2){
      print('on last page');
      Navigator.pushNamed(context, '/WelcomeScreen'); // Navigate to the dashboard



    }
  }

  void _navigateToHomeScreen() {
    Navigator.pushNamed(context, '/WelcomeScreen'); // Navigate to the dashboard


    // Navigate to your home screen or the next screen after the introduction
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  backgroundColor: Colors.greenAccent.shade200,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: titles.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildPage(
                imageUrls[index],
                titles[index],
                descriptions[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: _navigateToHomeScreen,
                    child: Text("Skip"),
                  ),
                  Row(
                    children: List.generate(
                      titles.length,
                          (index) => _buildIndicator(_currentPage == index),
                    ),
                  ),
                  TextButton(
                    onPressed: _navigateToNextPage,
                    child: Text(_currentPage == titles.length - 1 ? "Done" : "Next"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String imageUrl, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        SizedBox(height: 30.0),
        Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'TemanOverload',
              //   fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildIndicator(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
