import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/home/home_page.dart';
import 'package:flutter_app_3/pages/models/login_karyawan.dart';
import 'package:flutter_app_3/pages/news/news_page.dart';
import 'package:flutter_app_3/pages/profile/profile_page.dart';
import 'package:flutter_app_3/pages/providers/auth_providers.dart';
import 'package:flutter_app_3/pages/salary/salary_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        setState(() {
          switch (_tabController!.index) {
            case 0:
              appBarTitle = 'Salary.id';
              break;
            case 1:
              appBarTitle = 'Penggajian';
              break;
            case 2:
              appBarTitle = 'Berita';
              break;
            case 3:
              appBarTitle = 'Profil';
              break;

            default:
          }
        });
      });
  }

  var appBarTitle = 'Salary.id';

  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    LoginKaryawanModel loginKaryawanModel = authProvider.loginKaryawanModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0E2392),
        title: Text(
          appBarTitle,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Material(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 19),
            children: <Widget>[
              SizedBox(height: 50),
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('images/img_profile.png'),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // 'Fulan',
                        loginKaryawanModel.namaKaryawan!,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0E2392)),
                        ),
                      ),
                      Text(
                        // 'Status',
                        loginKaryawanModel.status!,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff0E2392)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Divider(
                color: Color(0xffCFCECE),
                thickness: 1,
              ),
              //SizedBox(height: 45,),
              ListTile(
                leading:
                    Icon(Icons.help_center_rounded, color: Color(0xff0E2392)),
                title: Text(
                  'Tentang Us',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff0E2392)),
                  ),
                ),
                onTap: () {
                  ;
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.dark_mode_rounded, color: Color(0xff0E2392)),
                title: Text(
                  'Mode Gelep',
                  style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff0E2392)),
                  ),
                ),
                trailing: CupertinoSwitch(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        //physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          SalaryPage(),
          NewsPage(),
          ProfilePage(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.amber,
        ),
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          labelPadding: EdgeInsets.symmetric(horizontal: 0),
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: Colors.white, width: 0)),
          tabs: <Widget>[
            Tab(
              text: 'Home',
              icon: Icon(Icons.home),
            ),
            Tab(
              text: 'Penggajian',
              icon: Icon(
                Icons.money,
              ),
            ),
            Tab(
              text: 'Berita',
              icon: Icon(Icons.new_releases_rounded),
            ),
            Tab(
              text: 'Profile',
              icon: Icon(Icons.person),
            ),
          ],
          controller: _tabController,
        ),
      ),
    );
  }
}
