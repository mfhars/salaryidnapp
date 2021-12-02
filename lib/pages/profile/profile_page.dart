import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_3/pages/models/login_karyawan.dart';
import 'package:flutter_app_3/pages/providers/auth_providers.dart';
import 'package:flutter_app_3/theme/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  Widget buttonProfile(IconData iconFirst, String title, IconData secondIcon) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      height: 67,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: kGreyColor),
      child: Row(
        children: <Widget>[
          Icon(iconFirst),
          SizedBox(
            width: 20,
          ),
          Expanded(child: Text(title)),
          Icon(secondIcon)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    LoginKaryawanModel loginKaryawanModel = authProvider.loginKaryawanModel;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('images/img_profile.png'),
          ),
          SizedBox(height: 20),
          Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text('Nama: Fulan'),
              Text(loginKaryawanModel.namaKaryawan!),
              //  Text('Status: Magang')],
              Text(loginKaryawanModel.status!)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          buttonProfile(Icons.settings_accessibility, 'Perbarui Profil',
              Icons.arrow_forward_ios),
          SizedBox(
            height: 20,
          ),
          buttonProfile(
              Icons.change_history, 'Ubah Kata Sandi', Icons.arrow_forward_ios),
          SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                showDialog(
                    context: (context),
                    builder: (context) {
                      return CupertinoAlertDialog(
                        title: Text('Keluar'),
                        content: Text('Really?'),
                        actions: [
                          CupertinoDialogAction(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('batal'))),
                          CupertinoDialogAction(
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/sign-in');
                                  },
                                  child: Text('Yes')))
                        ],
                      );
                    });
              },
              child: buttonProfile(
                  Icons.exit_to_app, 'Keluar', Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
