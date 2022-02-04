import 'package:bank_app_flutter/screens/custom_screen/add_remove_calculate.dart';
import 'package:bank_app_flutter/screens/salary/drawer/yes_no_custom_dialog.dart';
import 'package:bank_app_flutter/screens/salary/table_of_salary.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class FollowingTheRulesScreen extends StatefulWidget {
  static final routeName = "followingTheRulesScreen";

  @override
  _FollowingTheRulesScreenState createState() =>
      _FollowingTheRulesScreenState();
}

class _FollowingTheRulesScreenState extends State<FollowingTheRulesScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  String result = "0";

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.Back_Ground_COLOR,
      appBar: AppBar(
        backgroundColor: AppColors.Back_Ground_COLOR,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        child: new Image.asset(
                          'assets/images/error_blue.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "الرجاء اتباع التعليمات التالية لتحقيق التوازن المالي : ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "الرجاء زيادة مصاريفك بإضافة قيمة أو الرجاء تخفيض مصاريفك بإزالة قيمة الفائض أو العجز الظاهر لتحقيق التوازن المالي بتحديد المصاريف التي تريد إضافة قيمة لها\ إزالة قيمة منها أو تهانينا لا توجد لديك أي مشكلة وقد تم تحقيق التوازن المالبي؟",
                    maxLines: 4,
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.8),
                        fontSize: 17,
                        fontFamily: "Segoe UI",
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ///////////////////////////////////
                  Row(
                    children: [
                      Text(
                        "حالة التوازن المالي :  ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900),
                      ),
                      Container(
                        height: 28,
                        width: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.Back_Ground_COLOR,
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.MAIN_COLOR, spreadRadius: 1),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "2300",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Segoe UI",
                                color: AppColors.Drawer_COLOR,
                              ),
                            ),
                            Text(
                              " ريال",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Segoe UI",
                                color: AppColors.Drawer_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return YesNoCustomDialog();
                              });
                        },
                        child: AnimatedBuilder(
                          animation: animationController,
                          builder: (context, child) {
                            return Container(
                              decoration: ShapeDecoration(
                                color: Colors.red.withOpacity(0.5),
                                shape: CircleBorder(),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(
                                  6.0 * animationController.value,
                                ),
                                child: child,
                              ),
                            );
                          },
                          child: Container(
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: CircleBorder(),
                            ),
                            child: Container(
                              width: 20,
                              height: 20,
                              child: Image.asset(
                                'assets/images/error_red.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "\" " ,
                        style: TextStyle(
                            color: AppColors.Add_COLOR,
                            fontSize: 16,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "جدولة فائض مالي بقيمة ",
                        style: TextStyle(
                            color: AppColors.Add_COLOR,
                            fontSize: 16,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "500",
                        style: TextStyle(
                            color: AppColors.Add_COLOR,
                            fontSize: 16,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        "  \"",
                        style: TextStyle(
                            color: AppColors.Add_COLOR,
                            fontSize: 16,
                            fontFamily: "Segoe UI",
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Container(
              height: 1.0,
              color: AppColors.Border_COLOR,
            ),
            SizedBox(
              height: 38,
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 7),
              child: Column(
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "قائمة المصاريف الشهرية",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Segoe UI",
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        //border: Border.all(color: AppColors.Border_COLOR),
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(10),
                        //topRight: Radius.circular(10),
                        // bottomRight: Radius.circular(10),
                        // bottomLeft: Radius.circular(10),
                        //),
                        ),
                    child: Table(
                      columnWidths: {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(2),
                        2: FlexColumnWidth(4),
                        3: FlexColumnWidth(4),
                      },
                      border: TableBorder(
                          // horizontalInside: BorderSide(
                          //     width: 1,
                          //     color: AppColors.Border_COLOR,
                          //     style: BorderStyle.solid),
                          // verticalInside: BorderSide(
                          //     width: 1,
                          //     color: AppColors.Border_COLOR,
                          //     style: BorderStyle.solid)
                          ),

                      // border:
                      //     TableBorder.all(color: AppColors.Border_COLOR),
                      children: [
                        TableRow(
                          children: [
                            Container(
                              color: AppColors.Back_Ground_COLOR,
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.Border_COLOR),
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10),
                                ),
                                color: AppColors.MAIN_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "NO",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Tajawal',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.Border_COLOR),
                                color: AppColors.MAIN_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "المصاريف",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.Border_COLOR),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10)),
                                color: AppColors.MAIN_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "المتبقي من قيمةالمصروف الشهري",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(
                            //     bottomRight: Radius.circular(10)),
                            color: AppColors.App_Bar_COLOR,
                          ),
                          children: [
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: AppColors.Back_Ground_COLOR,
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Center(
                                  child: Checkbox(
                                    shape: CircleBorder(),
                                    tristate: false,
                                    // splashRadius: 30,
                                    checkColor: Colors.white,
                                    activeColor: AppColors.MAIN_COLOR,
                                    value: selected1,
                                    onChanged: (value) {
                                      selected1 = !selected1;
                                      setState(() {});
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AddRemoveCalculate(
                                              EnterSurplusOrDeficit:
                                                  "أدخل قيمة الإضافة",
                                              SurplusOrDeficit: "قيمة الفائض",
                                              ValueAfterSurplusOrDeficit:
                                                  "قيمة البند بعد الإضافة",
                                              text: "Add",
                                              textbutton: "Add",
                                            );
                                          }).then((value) {
                                        result = value;
                                        setState(() {});
                                      });
                                    },
                                  ),
                                ),
                              ),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.Border_COLOR),
                                  color: AppColors.No_Table_COLOR,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                        color: AppColors.Text_Table_COLOR),
                                  ),
                                ),
                              ),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.Border_COLOR),
                                color: AppColors.App_Bar_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "فاتورة الجوال والانترنت",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.Text_Table_COLOR),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.Border_COLOR),
                                color: AppColors.App_Bar_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "200.00",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.Text_Table_COLOR),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(
                            //     bottomRight: Radius.circular(10)),
                            color: AppColors.App_Bar_COLOR,
                          ),
                          children: [
                            TableCell(
                              child: Container(
                                decoration: BoxDecoration(
                                  // border: Border.all(),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(0),
                                  ),
                                  color: AppColors.Back_Ground_COLOR,
                                ),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Center(
                                  child: Checkbox(
                                    shape: CircleBorder(),
                                    tristate: false,
                                    // splashRadius: 30,
                                    checkColor: Colors.white,
                                    activeColor: AppColors.MAIN_COLOR,
                                    value: selected2,
                                    onChanged: (value) {
                                      selected2 = !selected2;
                                      setState(() {});
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AddRemoveCalculate(
                                              EnterSurplusOrDeficit:
                                                  "أدخل قيمة التخفيض",
                                              SurplusOrDeficit: "قيمة العجز",
                                              ValueAfterSurplusOrDeficit:
                                                  "قيمة البند بعد التخفيض",
                                              text: "Remove",
                                              textbutton: "Remove",
                                            );
                                          });
                                    },
                                  ),
                                ),
                              ),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            TableCell(
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  border:
                                  Border.all(color: AppColors.Border_COLOR),
                                  color: AppColors.No_Table_COLOR,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Tajawal',
                                        color: AppColors.Text_Table_COLOR),
                                  ),
                                ),
                              ),
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.Border_COLOR),
                                color: AppColors.App_Bar_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "فاتورة الجوال والانترنت",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.Text_Table_COLOR),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.Border_COLOR),
                                color: AppColors.App_Bar_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "200.00",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.Text_Table_COLOR),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10)),
                            color: AppColors.App_Bar_COLOR,
                          ),
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                // border: Border.all(),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(0),
                                ),
                                color: AppColors.Back_Ground_COLOR,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Center(
                                child: Checkbox(
                                  shape: CircleBorder(),
                                  tristate: false,
                                  // splashRadius: 30,
                                  checkColor: Colors.white,
                                  activeColor: AppColors.MAIN_COLOR,
                                  value: selected3,
                                  onChanged: (value) {
                                    selected3 = !selected3;
                                    setState(() {});
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AddRemoveCalculate(
                                            EnterSurplusOrDeficit:
                                                "أدخل قيمة التخفيض",
                                            SurplusOrDeficit: "قيمة العجز",
                                            ValueAfterSurplusOrDeficit:
                                                "قيمة البند بعد التخفيض",
                                            text: "Remove",
                                            textbutton: "Remove",
                                          );
                                        });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                                border:
                                Border.all(color: AppColors.Border_COLOR),
                                color: AppColors.No_Table_COLOR,
                              ),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Text(
                                  "2",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.Text_Table_COLOR),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                border:
                                Border.all(color: AppColors.Border_COLOR),
                                color: AppColors.App_Bar_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "فاتورة الجوال والانترنت",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.Text_Table_COLOR),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10)),
                                border:
                                Border.all(color: AppColors.Border_COLOR),
                                color: AppColors.App_Bar_COLOR,
                              ),
                              child: Center(
                                child: Text(
                                  "200.00",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Tajawal',
                                      color: AppColors.Text_Table_COLOR),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TableOfSaralyScreen()),
                );
              },
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/okk.png"),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
