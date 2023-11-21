import 'package:flutter/material.dart';



class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  void navigatetopage(){
    if(_currentIndex==0){
      Navigator.pushNamed(context, '/AssistantScreen'); // Navigate to the dashboard

    }
    else if(_currentIndex==1){

    }
    else if(_currentIndex==2){
      Navigator.pushNamed(context, '/WalletScreen'); // Navigate to the dashboard

    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
          navigatetopage();

        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.assistant),
          label: 'Assistant',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.wallet),
          label: 'Wallet',
        ),
      ],
    );
  }
}
