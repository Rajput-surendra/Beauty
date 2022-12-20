import 'package:barber/apiservice/Apiservice.dart';
import 'package:barber/apiservice/Retro_Api.dart';
import 'package:barber/appbar/app_bar_only.dart';
import 'package:barber/common/common_view.dart';
import 'package:barber/common/widget.dart';
import 'package:barber/constant/appconstant.dart';
import 'package:barber/constant/preferenceutils.dart';
import 'package:barber/drawer/drawer_only.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../bottombar.dart';

class About extends StatefulWidget {
  @override
  _About createState() => new _About();
}

class _About extends State<About> {
  bool datavisible = false;
  bool nodatavisible = true;
  bool _loading = false;
  String? footer1 = "";
  String? footer2 = "";
  String image = "";
  String? appversion = "";
  String? termsdata = "";
  String name = "User";

  @override
  void initState() {
    super.initState();
    PreferenceUtils.init();

    // Future.delayed(Duration.zero, () {
    //   AppConstant.onLoading(context);
    // });
    AppConstant.CheckNetwork().whenComplete(() => CallApiForSettings());
    name = PreferenceUtils.getString(AppConstant.username);
  }

  void CallApiForSettings() {
    setState(() {
      _loading = true;
    });
    RestClient(Retro_Api().Dio_Data()).settings().then((response) {
      setState(() {
          _loading = false;
        if (response.success = true) {
          datavisible = true;
          nodatavisible = false;
          termsdata = response.data!.termsConditions;
          footer1 = response.data!.footer1;
          footer2 = response.data!.footer2;
          image = response.data!.imagePath! + response.data!.blackLogo!;
          appversion = response.data!.appVersion;
        } else {
          datavisible = false;
          nodatavisible = true;
          AppConstant.toastMessage("No Data");
        }
      });
    }).catchError((Object obj) {
      setState(() {
        _loading = false;
      });
      print("error:$obj");
      print(obj.runtimeType);
      //AppConstant.toastMessage("Internal Server Error");
    });
  }

  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: _loading,
        opacity: 1.0,
        color: Colors.transparent.withOpacity(0.2),
        progressIndicator: SpinKitFadingCircle(color: Color(AppConstant.pinkcolor)),
        child: new SafeArea(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
            appBar: appbar(context, 'About App', _drawerscaffoldkey, false)
                as PreferredSizeWidget?,
            body: Scaffold(
              resizeToAvoidBottomInset: true,
              key: _drawerscaffoldkey,
              drawer: new DrawerOnly(name),
              body: new Stack(children: <Widget>[
                Visibility(
                  visible: datavisible,
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 60),

                    // child: Text("Hello"),

                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.75,
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              CachedNetworkImage(
                                height: 70,
                                width: 80,
                                imageUrl: image,
                                alignment: Alignment.center,
                                placeholder: (context, url) =>
                                    SpinKitFadingCircle(
                                        color: Color(AppConstant.pinkcolor)),
                                errorWidget: (context, url, error) =>
                                    Image.asset("images/no_image.png"),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  appversion!,
                                  style: TextStyle(
                                      color: Color(0xFFa3a3a3),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Text(
                                    footer1!,
                                    style: TextStyle(
                                        color: Color(0xFFa3a3a3),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(top: 1),
                                  child: Text(
                                    footer2!,
                                    style: TextStyle(
                                        color: Color(0xFFa3a3a3),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                Visibility(
                  visible: nodatavisible,
                  child: Container(
                    margin:
                        EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 60),

                    // child: Text("Hello"),

                    child: Center(
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.75,
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: <Widget>[
                              Image.asset(
                                "images/nodata.png",
                                alignment: Alignment.center,
                                width: 150,
                                height: 100,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "No Data",
                                  style: TextStyle(
                                      color: Color(0xFFa3a3a3),
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                ),
                kIsWeb?buildFooter(context,100.w):SizedBox(),
                new Container(alignment: Alignment.bottomCenter, child: Body()),
              ]),
            ),
          ),
        ),
      );
  }

  bool status =false;
  Widget buildFooter(BuildContext context,double width){
    return  Container(
      color:Color(AppConstant.pinkcolor),
      width: width,
      child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:<Widget>[
            SizedBox(height: 80,),
            Center(
              child: Wrap(
                children: <Widget>[
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: width<480?CrossAxisAlignment.center:CrossAxisAlignment.start,
                      mainAxisAlignment: width<480?MainAxisAlignment.center:MainAxisAlignment.start,
                      children: [
                        Image(image: AssetImage("images/logo.png"),height: 20.w,width: 20.w,),
                        SizedBox(height: 20,),
                        Container(

                          child: Row(
                            crossAxisAlignment: width<480?CrossAxisAlignment.center:CrossAxisAlignment.start,
                            mainAxisAlignment: width<480?MainAxisAlignment.center:MainAxisAlignment.start,

                            children: [

                              MouseRegion(
                                onEnter: (value) {
                                  setState(() {
                                    status=true;
                                  });
                                },
                                onExit: (value) {
                                  setState(() {
                                    status=false;
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: status?Colors.green:Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8.0),
                                    child: FaIcon(FontAwesomeIcons.facebook,color: status?Colors.white:Colors.black,)),
                              ),
                              MouseRegion(
                                onEnter: (value) {
                                  setState(() {
                                    status=true;
                                  });
                                },
                                onExit: (value) {
                                  setState(() {
                                    status=false;
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: status?Colors.green:Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8.0),
                                    child: FaIcon(FontAwesomeIcons.instagram,color: status?Colors.white:Colors.black,)),
                              ),
                              MouseRegion(
                                onEnter: (value) {
                                  setState(() {
                                    status=true;
                                  });
                                },
                                onExit: (value) {
                                  setState(() {
                                    status=false;
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: status?Colors.green:Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8.0),
                                    child: FaIcon(FontAwesomeIcons.twitter,color: status?Colors.white:Colors.black,)),
                              ),
                              MouseRegion(
                                onEnter: (value) {
                                  setState(() {
                                    status=true;
                                  });
                                },
                                onExit: (value) {
                                  setState(() {
                                    status=false;
                                  });
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: status?Colors.green:Colors.transparent,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(8.0),
                                    child: FaIcon(FontAwesomeIcons.pinterest,color: status?Colors.white:Colors.black,)),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 30,)
                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: width<480?CrossAxisAlignment.center:CrossAxisAlignment.start,
                      mainAxisAlignment: width<480?MainAxisAlignment.center:MainAxisAlignment.start,
                      children: [
                        text("OUR SERVICE",fontSize: 6.0.sp,fontFamily: fontBold,),

                        SizedBox(height: 20,),
                        NavBarItem2(
                          text: "Terms and Conditions",
                          status: width<500?true:false,
                        ),
                        SizedBox(height: 12,),
                        NavBarItem2(
                          text: "Privacy Policy",
                          status: width<500?true:false,
                        ),
                        SizedBox(height: 12,),
                        NavBarItem2(
                          text: "Top Offers",
                          status: width<500?true:false,
                        ),
                        SizedBox(height: 12,),
                        NavBarItem2(
                          text: "Invite a Friends",
                          status: width<500?true:false,
                        ),
                        SizedBox(height: 30,),

                      ],
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: width<480?CrossAxisAlignment.center:CrossAxisAlignment.start,
                      mainAxisAlignment: width<480?MainAxisAlignment.center:MainAxisAlignment.start,
                      children: [
                        text("Contact",fontSize: 6.0.sp,fontFamily: fontBold,),

                        SizedBox(height: 20,),
                        ContactItem(
                          text: "+256 779 267762 | +256 723 111078",
                          icon: FontAwesomeIcons.phoneSquare,
                          status: width<500?true:false,
                        ),
                        SizedBox(height: 12,),
                        ContactItem(
                          text: "jeremy@matchstick.ug",
                          icon: FontAwesomeIcons.voicemail,
                          status: width<500?true:false,
                        ),
                        SizedBox(height: 12,),
                        ContactItem(
                          text: "Matchstick 256 Studio Plot",
                          icon: FontAwesomeIcons.home,
                          status: width<500?true:false,
                        ),
                        SizedBox(height: 30,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 80,),
            Container(
                color: Colors.green,
                alignment: Alignment.center,
                width: width,
                height: 50,
                child: Text('© 2021 Beauty Salon, All Rights Reserved.',style: TextStyle(fontWeight:FontWeight.w300, fontSize: 12.0, color: Color(0xFFFFFFFF)),)),
          ]
      ),
    );
  }

  Future<bool> _onWillPop() async {
    Navigator.pop(context);

    return (await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => new BottomBar(0)))) ??
        false;
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        child: CustomView(),
      ),
    );
  }
}
