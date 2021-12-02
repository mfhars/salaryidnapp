import 'package:flutter/material.dart';
import 'package:flutter_app_3/theme/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class SalaryPage extends StatelessWidget {
  const SalaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Data Karyawan',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              color: primaryColor,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 67,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.grey)],
              color: Colors.white,
              border: Border.all(),
            ),
            child: Row(
              children: <Widget>[
                Text('1.'),
                SizedBox(
                  width: 15,
                ),
                Text('Fulan'),
                SizedBox(
                  width: 50,
                ),
                Text('2021-11-19'),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/detail-salary');
                    },
                    icon: Icon(Icons.equalizer))
              ],
            ),
          )
        ],
      ),
    );
  }
}
