import 'package:flutter/material.dart';
import 'package:flutter_video_player_demo/video_items.dart';
import 'package:video_player/video_player.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Page',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('3D虛擬主播新聞播報'),
        ),
        body: _FirstPage(),
      ),
    );
  }
}

class _FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:SingleChildScrollView(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('新聞種類',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Color.fromARGB(255, 150, 150, 150),
                  fontSize: 50.0,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dotted
              ),
            ),
            Container(
              width: 200,
              height: 50,
              child: RaisedButton.icon(
                elevation: 20,
                icon: Icon(Icons.search),
                label:Text("政治",
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => PoliticsPage()));
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child:ListView(
                  scrollDirection: Axis.horizontal,
                  children:[
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/pol1.jpg'),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/pol2.jpg'),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/pol3.jpg'),
                        ],
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(width: 10,height: 10),
            Container(
              width: 200,
              height: 50,
              child: RaisedButton.icon(
                elevation: 20,
                icon: Icon(Icons.search),
                label:Text("財經",
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => FinancePage()));
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child:ListView(
                  scrollDirection: Axis.horizontal,
                  children:[
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/fin1.jpg'),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/fin2.jpg'),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/fin3.jpg'),
                        ],
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(width: 10,height: 10),
            Container(
              width: 200,
              height: 50,
              child: RaisedButton.icon(
                elevation: 20,
                icon: Icon(Icons.search),
                label:Text("健康",
                  style: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => HealthPage()));
                },
              ),
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 20.0),
                height: 200.0,
                child:ListView(
                  scrollDirection: Axis.horizontal,
                  children:[
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/heal1.jpg'),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/heal2.jpg'),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 20,
                      child: Row(
                        children: [
                          Image.asset('assets/images/heal3.jpg'),
                        ],
                      ),
                    ),
                  ],
                )
            ),
            SizedBox(width: 10,height: 10),
          ],
        ),
      ),
    );
  }
}

class FinancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('財經'),
      ),
      body: ListView(
        children: <Widget>[
          Text('語言',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Color.fromARGB(255, 150, 150, 150),
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
            ),
          ),
          SizedBox(width: 10,height: 50),
          Container(
            width: 200,
            height: 100,
            child: RaisedButton.icon(
              elevation: 20,
              icon: Icon(Icons.smart_display),
              label:Text("中文",
                  style:new TextStyle(
                    color: Colors.brown,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  )
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FinancePage_CH()));
              },
            ),
          ),
          SizedBox(width: 10,height: 100),
          Container(
            width: 200,
            height: 100,
            child: RaisedButton.icon(
              elevation: 20,
              icon: Icon(Icons.smart_display),
              label:Text("台語",
                  style:new TextStyle(
                    color: Colors.brown,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  )
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FinancePage_TW()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class FinancePage_TW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('財經新聞'),
      ),
      body: ListView(
      children: <Widget>[
        Text(
          '財經-台語版',
          style: TextStyle(
              color: Colors.brown,
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted
          ),
          textAlign: TextAlign.center,
        ),
        VideoItems(
          videoPlayerController: VideoPlayerController.asset(
            'assets/videos/news_tw_17.mp4',
          ),
          looping: true,
          autoplay: false,
        ),
      ],
    ),
    );
  }
}

class FinancePage_CH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('財經新聞'),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            '財經-中文版',
            style: TextStyle(
                color: Colors.brown,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
            ),
            textAlign: TextAlign.center,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/videos/news_ch_17.mp4',
            ),
            looping: true,
            autoplay: false,
          ),
        ],
      ),
    );
  }
}

class PoliticsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('政治'),
      ),
      body: ListView(
        children: <Widget>[
          Text('語言',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Color.fromARGB(255, 150, 150, 150),
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
            ),
          ),
          SizedBox(width: 10,height: 50),
          Container(
            width: 200,
            height: 100,
            child: RaisedButton.icon(
              elevation: 20,
              icon: Icon(Icons.smart_display),
              label:Text("中文",
                  style:new TextStyle(
                    color: Colors.brown,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  )
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PoliticsPage_CH()));
              },
            ),
          ),
          SizedBox(width: 10,height: 100),
          Container(
            width: 200,
            height: 100,
            child: RaisedButton.icon(
              elevation: 20,
              icon: Icon(Icons.smart_display),
              label:Text("台語",
                  style:new TextStyle(
                    color: Colors.brown,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  )
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PoliticsPage_TW()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PoliticsPage_TW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('政治新聞'),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            '政治-台語版',
            style: TextStyle(
                color: Colors.brown,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
            ),
            textAlign: TextAlign.center,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
              'assets/videos/news_tw_1.mp4',
            ),
            looping: true,
            autoplay: false,
          ),
        ],
      ),
    );
  }
}

class PoliticsPage_CH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('政治新聞'),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            '政治-中文版',
            style: TextStyle(
                color: Colors.brown,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
            ),
            textAlign: TextAlign.center,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
                'assets/videos/news_ch_1.mp4'),
            looping: false,
            autoplay: false,
          ),
        ],
      ),
    );
  }
}

class HealthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('健康'),
      ),
      body: ListView(
        children: <Widget>[
          Text('語言',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Color.fromARGB(255, 150, 150, 150),
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
            ),
          ),
          SizedBox(width: 10,height: 50),
          Container(
            width: 200,
            height: 100,
            child: RaisedButton.icon(
              elevation: 20,
              icon: Icon(Icons.smart_display),
              label:Text("中文",
                style:new TextStyle(
                  color: Colors.brown,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                )
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HealthPage_CH()));
              },
            ),
          ),
          SizedBox(width: 10,height: 100),
          Container(
            width: 200,
            height: 100,
            child: RaisedButton.icon(
              elevation: 20,
              icon: Icon(Icons.smart_display),
              label:Text("台語",
                  style:new TextStyle(
                    color: Colors.brown,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                  )
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HealthPage_TW()));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HealthPage_TW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('健康新聞'),
      ),
      body: ListView(
        children: <Widget>[
          Text(
            '健康-台語版',
            style: TextStyle(
                color: Colors.brown,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dotted
            ),
            textAlign: TextAlign.center,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
                "assets/videos/news_tw_21.mp4"),
            looping: true,
            autoplay: false,
          ),
        ],
      ),
    );
  }
}

class HealthPage_CH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('健康新聞'),
      ),
      body: ListView(
        children: <Widget>[
          Text(
          '健康-中文版',
            style: TextStyle(
              color: Colors.brown,
              fontSize: 25.0,
              fontWeight: FontWeight.w700,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dotted
            ),
          textAlign: TextAlign.center,
          ),
          VideoItems(
            videoPlayerController: VideoPlayerController.asset(
                "assets/videos/news_ch_21.mp4"),
            looping: true,
            autoplay: false,
          ),
        ],
      ),
    );
  }
}

