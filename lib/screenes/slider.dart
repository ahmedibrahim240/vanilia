import 'package:flutter/material.dart';
import 'package:vanillia/constants/themes.dart';
import 'package:vanillia/localization/language_constants.dart';
import 'package:vanillia/model/user.dart';
import 'package:vanillia/screenes/wrapper/authenticate/authenticate.dart';

class OnBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (UserData.isSingin == true) {
      return Authenticate();
    } else {
      return OnBoarding();
    }
  }
}

class Slider extends StatelessWidget {
  final String title, contant;
  final String image;
  final String backImage;
  Slider({this.backImage, this.contant, this.image, this.title});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 60),
          Container(
            height: height * .6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                width: width,
              ),
            ),
          ),
          Center(
              child: Text(
            title,
            style: AppTheme.heading.copyWith(color: Color(0xfff880e4f)),
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Text(
                contant,
                style: AppTheme.subHeading.copyWith(
                  height: 1.5,
                  letterSpacing: .07,
                ),
              ),
            ),
          ),
          SizedBox(height: 60),
        ],
      ),
    );
  }
}

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();
  List<Widget> _pages = [
    Slider(
      title: 'لوريم ايبسوم',
      contant:
          'لوريم ايبسوم هو ببساطه نص شكلي يستخمدم في صناعه الطباعه و التنضيد كان النص الوهمي القياسي في الصناعه منذ القرن',
      image: 'lib/images/img2.png',
      backImage: 'lib/images/back2.png',
    ),
    Slider(
      title: 'لوريم ايبسوم',
      contant:
          'لوريم ايبسوم هو ببساطه نص شكلي يستخمدم في صناعه الطباعه و التنضيد كان النص الوهمي القياسي في الصناعه منذ القرن',
      image: 'lib/images/img1.png',
      backImage: 'lib/images/back3.png',
    ),
    Slider(
      title: 'لوريم ايبسوم',
      contant:
          'لوريم ايبسوم هو ببساطه نص شكلي يستخمدم في صناعه الطباعه و التنضيد كان النص الوهمي القياسي في الصناعه منذ القرن',
      image: 'lib/images/img2.png',
      backImage: 'lib/images/back2.png',
    ),
  ];
  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Color(0xfffec51b7),
      ),
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  _pages.length,
                  (int index) {
                    return AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      height: 10,
                      width: (index == _currentPage) ? 30 : 10,
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: (index == _currentPage)
                            ? Color(0xfff880e4f)
                            : Color(0xfff880e4f).withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: (_currentPage == (_pages.length - 1))
                      ? MainAxisAlignment.center
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (_currentPage == (_pages.length - 1)) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (_) => Authenticate(),
                            ),
                          );
                        } else {
                          _controller.nextPage(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeInOutQuint,
                          );
                        }
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 40,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff880e4f),
                        ),
                        child: (_currentPage == (_pages.length - 1))
                            ? Center(
                                child: Text(
                                  getTranslated(context, 'start'),
                                  style: AppTheme.heading
                                      .copyWith(color: Colors.white),
                                ),
                              )
                            : Center(
                                child: Text(
                                  getTranslated(context, 'next_one'),
                                  style: AppTheme.heading
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => Authenticate(),
                          ),
                        );
                      },
                      child: (_currentPage == (_pages.length - 1))
                          ? Container()
                          : Row(
                              children: [
                                Text(
                                  getTranslated(context, 'skip'),
                                  style: AppTheme.heading
                                      .copyWith(color: Color(0xfff880e4f)),
                                ),
                                Transform.rotate(
                                  angle: 180 * 3.14 / 180,
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Color(0xfff880e4f),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
