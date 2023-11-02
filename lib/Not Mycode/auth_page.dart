import 'package:flutter/material.dart';
import 'package:not_whatsapp/Not%20Mycode/constants.dart';
import 'package:not_whatsapp/Not%20Mycode/custom_button.dart';
import 'package:not_whatsapp/Not%20Mycode/routes_name.dart';
import 'package:not_whatsapp/Not%20Mycode/size_extension.dart';
import 'package:not_whatsapp/Not%20Mycode/utils.dart';
import 'strings.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: scaffoldBgColor,
        centerTitle: true,
        elevation: 0,
        title: Text(
          KStrings.enterPhoneTitle,
          style: TextStyle(
            fontSize: 16.sp,
            color: primaryColor,
          ),
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert, color: subTitleTextColor),
              color: scaffoldBgColor,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              itemBuilder: (context) {
                return <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text("Link as companion device"),
                  ),
                  PopupMenuItem(
                    child: Text("Help"),
                  ),
                ];
              })
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text.rich(
                  textAlign: TextAlign.center,
                  selectionColor: Colors.blue,
                  TextSpan(
                      text: KStrings.verifyAccountText,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: textColor,
                      ),
                      children: [
                        TextSpan(
                          text: KStrings.myNumber,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.sp,
                          ),
                        ),
                      ])),
              Utils.verticalSpace(10),
              Expanded(
                  child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Image.asset(
                  'assets/pngwing.com.png',
                ),
              )),
              Center(
                child: SizedBox(
                  width: size.width * 0.7,
                  child: Row(
                    children: [
                      // Expanded(
                      //     child: TextField(
                      //   decoration: InputDecoration(
                      //     contentPadding: EdgeInsets.zero,
                      //     // prefixIcon: Icon(
                      //     //   Icons.add,
                      //     //   size: 20,
                      //     // ),
                      //     hintText: " +91",
                      //   ),
                      // )),
                      Expanded(
                          child: SizedBox(
                        width: size.width * 0.7,
                        child: DropdownButton<String>(
                            hint: Text("+91"),
                            isExpanded: true,
                            alignment: Alignment.center,
                            items: [
                              DropdownMenuItem(
                                child: Text("+91"),
                                value: "+91",
                              ),
                              DropdownMenuItem(
                                child: Text("+971"),
                                value: "+971",
                              ),
                              DropdownMenuItem(
                                child: Text("+966"),
                                value: "+966",
                              ),
                              DropdownMenuItem(
                                child: Text("+974"),
                                value: "+974",
                              ),
                            ],
                            onChanged: (v) {}),
                      )),
                      Utils.horizontalSpace(10),
                      Expanded(
                          flex: 3,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: KStrings.phontHint,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Utils.verticalSpace(20),
              Text(
                KStrings.carrierCharge,
                style: TextStyle(
                  color: subTitleTextColor,
                ),
              ),
              Spacer(),
              SizedBox(
                  width: 100,
                  child: CustomButton(
                      text: "Next",
                      textSize: 16,
                      press: () {
                        Navigator.pushNamed(context, RouteNames.mainScreen);
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
