part of home;

class HomeViewMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: GestureDetector(
          // onTap: () => Navigator.pushNamed(context, RouteNames.bottomBar),
          child: Container(
            //setting dimension for widget width
            width: McGyver.rsDoubleW(context, 20),
            //setting dimension for widget height
            height: McGyver.rsDoubleH(context, 15),
            
            color: Colors.red,
            child: Center(
              child: Text(
                'Test',
                style: TextStyle(
                  //making fontsize reponsive to different screen sizes
                  fontSize: McGyver.textSize(context, 3),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
