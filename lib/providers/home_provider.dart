import 'package:bank_app_flutter/model/MonthList.dart';
import 'package:bank_app_flutter/prefs/UserPreferences.dart';
import 'package:bank_app_flutter/storage/controllers/expences_db_controller.dart';
import 'package:bank_app_flutter/storage/controllers/monthlist_db_controller.dart';
import 'package:bank_app_flutter/utlies/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

enum SingingCharacter { Arabic, English }

class HomeProvider extends ChangeNotifier {

  HomeProvider() {

    print("provider initilized");
    // monthList = readJsonData();
    initDataBase();
    // if (!UserPreferences.instance.isListInit()) {
    //   monthList = readJsonData();
    //   UserPreferences.instance.saveList(readJsonData());
    //   // print(UserPreferences.instance.getList());
    // } else {
    //   monthList = UserPreferences.instance.getList();

    // }
  }
  void initDataBase() async{
    var dbM = await _dbController.read();
    var exs = await _dbEController.read();

    print("ids monthly");
    dbM.forEach((element) {
      print(element.id);
      // print(element.salaryDate);
    });
    print("initialises expenses");
    exs.forEach((element) {
      print(element.toString());
      // print(element.salaryDate);
    });
    print('read monthList');
    if(dbM.length > 0){

      print('monthList exist');
      print(dbM[0].totalCash);
      monthList = dbM[0];
      monthList.expences = exs;
    }else{
      monthList = readJsonData();
      int newId = await _dbController.create(monthList);
      if (newId != 0) {
        print('create monthList');
        monthList.id = newId;
        int newEId = 0;

        print('create expenses');
        monthList.expences.forEach((expences) async{
          print(expences.toString());
          newEId = await _dbEController.create(expences);
          if (newEId != 0) {
            // TODO: is it gurantee monthList.expences[?].id changed?????
            expences.id = newEId;
          }
        });
      }
    }
    reCalcExpSum();
    notifyListeners();
  }

  SingingCharacter character = SingingCharacter.Arabic;
  // DateTime salaryDate;
  MonthList monthList;
  MonthListDbController _dbController = MonthListDbController();ExpencesDbController _dbEController = ExpencesDbController();
  double aVisaLimit1 = 0.0;
  double aVisaLimit2 = 0.0;
  double availbeCash = 0.0;

  /*
   * Screen Actions
   * Show/Hide Expences Radio Button
   */
  bool isDeleteEnable = false;
  changeDeleteEnable() {
    this.isDeleteEnable = !this.isDeleteEnable;
    notifyListeners();
  }

  /*
   * Main Screen Actions
   *
   */
  changeSalaryAmount(String value) {
    // TODO: Check not to be less than remaining amount

    monthList.salaryAmount = double.parse(value);
    saveList(isPlan: true);
    notifyListeners();
  }

  getRemainingAmount() {
    return monthList.salaryAmount - this.getSumSaveExpencesCashAmount();
  }

  getSumSaveExpencesCashAmount() {
    return (monthList.saveAmount +
        monthList.sumExpencesAmount +
        monthList.cashAmount);
  }

  changeSaveAmount(value) {
    // TODO: Check not to be grater than remaining amount

    monthList.saveAmount = double.parse(value);
    saveList(isPlan: true);
    notifyListeners();
  }

  changeExpensesAmount(String value, int i) {
    // TODO: Check not to be grater than remaining amount
    monthList.expences[i].amount = double.parse(value);
    saveList(isPlan: true);
    reCalcExpSum();
    notifyListeners();
  }

  changeExpensesType(String value, int i) {
    // TODO: Check not to be grater than remaining amount
    monthList.expences[i].type = value;
    saveList(isPlan: true);
    notifyListeners();
  }
  changeCashAmount(value) {
    // TODO: Check not to be Less than remaining amount
    monthList.cashAmount = double.parse(value);
    saveList(isPlan: true);
    notifyListeners();
  }

  var reverse;
  changeTotalSave(value) {
    // TODO: Check not to be grater than remaining amount
    reverse = {"type": "save", "index": 0, "old_value": monthList.totalSave};
    monthList.totalSave += double.parse(value);
    saveList();
    notifyListeners();
  }

  changeTotalExpenses(String value, int i) {
    reverse = {
      "type": "expences",
      "index": i,
      "old_value": monthList.expences[i].total
    };
    // TODO: Check not to be grater than remaining amount
    monthList.expences[i].total += double.parse(value);

    reCalcExpSum();
    saveList();
    notifyListeners();
  }

  changeTotalCash(value) {
    // TODO: Check not to be grater than remaining amount
    reverse = {"type": "cash", "index": 0, "old_value": monthList.totalCash};
    monthList.totalCash += double.parse(value);
    saveList();

    notifyListeners();
  }

  resetValues() {
    monthList.expences.forEach((element) {
      element.total = 0.0;
      element.amount = 0.0;
    });
    monthList.salaryAmount = 0.0;
    monthList.totalCash = 0.0;
    monthList.cashAmount = 0.0;
    monthList.sumExpencesAmount = 0.0;
    monthList.sumTotalExpences = 0.0;
    monthList.totalMonthly = 0.0;
    monthList.mounthlyAmount = 0.0;
    monthList.totalSave = 0.0;
    monthList.saveAmount = 0.0;
    saveList(isPlan: true);
    reCalcExpSum();
    notifyListeners();
  }
  resetTotalValues() {
    monthList.expences.forEach((element) {
      element.total = 0.0;
    });
    monthList.totalCash = 0.0;
    monthList.sumTotalExpences = 0.0;
    monthList.totalMonthly = 0.0;
    monthList.totalSave = 0.0;

    reCalcExpSum();
    notifyListeners();
  }
  Future newMonth() async{
    // monthList.expences.forEach((element) {
    //   element.total = 0.0;
    // });
    // monthList.totalCash = 0.0;
    // monthList.sumTotalExpences = 0.0;
    // monthList.totalMonthly = 0.0;
    // monthList.totalSave = 0.0;

    // reCalcExpSum();
    await resetTotalValues();
    // monthList = UserPreferences.instance.getPlanList();
    saveList(isNew: true);
    notifyListeners();
  }

  void reverseValue() {
    switch (reverse["type"]) {
      case "save":
        print("save");
        monthList.totalSave = reverse["old_value"];
        break;
      case "expences":
        print("ex");
        monthList.expences[reverse["index"]].total = reverse["old_value"];
        break;
      case "cash":
        print("cha");
        monthList.totalCash = reverse["old_value"];
        break;
    }
    saveList();
    notifyListeners();
  }

  /*
   * DatePicker Calender settings
   *
   */
  setDate(BuildContext context) async {
    DateTime selected = await showDatePicker(
      context: context,
      initialDate: monthList.salaryDate == null
          ? DateTime.now()
          : DateTime.parse(monthList.salaryDate),
      firstDate: DateTime.now(),
      lastDate: DateTime(2035),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.MAIN_COLOR,
            accentColor: AppColors.MAIN_COLOR,
            colorScheme: ColorScheme.light(primary: AppColors.MAIN_COLOR),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child,
        );
      },
    );
    monthList.salaryDate = selected == null
        ? monthList.salaryDate
        : convertToArabicNumber(DateFormat('yyyy-MM-dd').format(selected));
    this.saveList();
    notifyListeners();
  }

  String convertToArabicNumber(String number) {
    String res = '';

    final arabics = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    final latins = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    number.characters.forEach((element) {
      int count = 0;
      if (element != "-" && element != "\\" && element != "/") {
        bool found = false;
        arabics.forEach((n) {
          // print(n);
          if (element == n) {
            res += latins[count];
            found = true;
          }
          count++;
        });
        if (!found) {
          res += element;
        }
      } else {
        res += element;
      }
      // res += arabics[int.parse(element)];
    });
    return res;
  }

  /*
   * Expenses Table actions
   *
   */
  addExpense() {
    monthList.expences.add(Expences.fromJson({
      "id": monthList.expences.length,
      "type": null,
      "amount": 0.0,
      "total": 0.0,
      "isSelect": false
    }));
    notifyListeners();
  }

  removeExpense() {
    monthList.expences.removeWhere((element) => element.isSelect);
    saveList(isPlan: true);
    reCalcExpSum();
    notifyListeners();
  }

  reCalcExpSum() {
    double sum_amount = 0.0;
    double sum_total = 0.0;
    int counter = 1;
    monthList.expences.forEach((element) {
      element.id = counter++;
      sum_amount += element.amount;
      sum_total += element.total;
    });
    monthList.sumExpencesAmount = sum_amount;
    monthList.sumTotalExpences = sum_total;
    print(monthList);
    notifyListeners();
  }

  String tresutl = "";
  /*
   * Calc actions
   *
   */
  String result = "0";
  String tNumber = "0";
  String equation = "0";
  setNumber(String number) {
    var after = tNumber.split(".");
    if (equation == "0" && number != ".") {
      tNumber = number;
      equation = number;
      evalEquation();
    } else if ((after.length < 2 && number != "." && after[0].length > 7) ||
        (after.length > 1 && (after[1].length > 1 || number == "."))) {
    } else {
      tNumber = tNumber + number;
      equation = equation + number;
      evalEquation();
    }
    notifyListeners();
  }
  // setNumber(String number) {
  //   var after = result.split(".");
  //   if (result == "0" && number != ".") {
  //     result = number;
  //     equation = number;
  //   } else if ((after.length < 2 && number != "." && after[0].length > 7) ||
  //       (after.length > 1 && (after[1].length > 1 || number == "."))) {
  //   } else {
  //     result = result + number;
  //     equation = equation + number;
  //     evalEquation();
  //  }
  //  notifyListeners();
  // }
  evalEquation(){
    Parser p = Parser();
    ContextModel cm = ContextModel();
    Expression exp = p.parse(equation);
    tNumber = "0";
    result = exp.evaluate(EvaluationType.REAL, cm).toString();
    print(exp);
    print(exp.evaluate(EvaluationType.REAL, cm));
  }

  getClacResult() {
    var split_number = result.split(".");
    if (split_number.length > 1) {
      return NumberFormat('###,##0').format(int.parse(split_number[0])) +
          "." +
          split_number[1];
    }
    return NumberFormat('###,##0').format(int.parse(result));
  }

  clearNumber() {
    result = "0";
    equation = "0";
    tNumber = "0";
    notifyListeners();
  }

  clearOnesNumber() {
    Parser p = Parser();
    ContextModel cm = ContextModel();

    equation = equation.substring(0, equation.length - 1);
    if(equation.length == 0){
      equation = "0";
      tNumber = "0";
      result = "0";
    }else if(equation[equation.length -1] == '+' || equation[equation.length -1] == '-' || equation[equation.length -1] == '.'){
      Expression exp = p.parse(equation.substring(0, equation.length - 1));
      result = exp.evaluate(EvaluationType.REAL, cm).toString();
    }else{
      evalEquation();
    }
    notifyListeners();
  }
  addOp(String op){
    if(equation == "0"){

    }else if(equation[equation.length -1] == '+' || equation[equation.length -1] == '-'){

    }else{
      equation = equation + op;
    }
    notifyListeners();
  }
  /*
   * Languages
   *
   */
  getLanguage(BuildContext context) {
    character = context.locale == Locale('ar')
        ? SingingCharacter.Arabic
        : SingingCharacter.English;
    notifyListeners();
  }

  setLanguage(SingingCharacter lang, BuildContext context) async {
    this.character = lang;
    String newLanguage = lang == SingingCharacter.Arabic ? 'ar' : 'en';
    context.setLocale(Locale(newLanguage));
    notifyListeners();
  }

  /*
   * initial data
   *
   */
  readJsonData() {
    return MonthList.fromJson({
      "lang": "ar",
      "salaryDate": null,
      "salaryAmount": 0.0,
      "salaryInit": 0.0,
      "totalCash": 0.0,
      "cashAmount": 0.0,
      "cashInit": 0.0,
      "sumExpencesAmount": 0.0,
      "sumTotalExpences": 0.0,
      "totalMonthly": 0.0,
      "mounthlyAmount": 0.0,
      "totalSave": 0.0,
      "saveAmount": 0.0,
      "saveInit": 0.0,
      "expences": [
        {"id": 1, "type": null, "init": 0.0, "amount": 0.0, "total": 0.0, "isSelect": false},
        // {"id": 2, "type": null, "init": 0.0,"amount": 0.0, "total": 0.0, "isSelect": false}
      ]
    });
  }

  /*
   * save list
   *
   */
  void saveList({bool isNew = false, bool isPlan = false}) async{
    /// TODO: save language to shared pref
    // UserPreferences.instance.saveList(monthList);
    /// TODO: save monthlost to DB
    if(isPlan){
      savePlanToDB();
    }else if(isNew) {
      saveNewToDB();
    }else{
      saveToDB();
    }

  }
  void saveToDB() async{
    print("regular save start");
    print(monthList.totalCash);
    bool updated = await _dbController.update(monthList);
    if (updated) {
      print("monthlist updated");
    }
    await _dbEController.deleteAll();
    monthList.expences.forEach((element) async {

      print(element.toString());
      updated = await _dbEController.update(element);
      if (updated) {
      } else {
        var id = await _dbEController.create(element);
        element.id = id;
      }
    });

    var dbM = await _dbController.read();

    print('read monthList');
    if(dbM.length > 0){
      print("from saveToDB id");
      print(dbM[0].id);
      dbM.forEach((element) {

        print("from loop id");
        print(element.id);
      });
    }
  }
  void saveNewToDB() async{
    print("New month save start");
      monthList.salaryAmount = monthList.salaryInit;
      monthList.saveAmount = monthList.saveInit;
      monthList.cashAmount = monthList.cashInit;
    bool updated = await _dbController.update(monthList);
    if (updated) {
      print("monthlist updated");
    }
    await _dbEController.deleteAll();
    monthList.expences.forEach((element) async {
      print(element.toString() );
            element.amount = element.init;
      updated = await _dbEController.update(element);
      if (updated) {
      } else {
        var id = await _dbEController.create(element);
        element.id = id;
      }
    });
    reCalcExpSum();
    notifyListeners();
  }
  // void saveNewToDB() async{
  //   await _dbController.deleteAll();
  //   await _dbEController.deleteAll();
  //   monthList.salaryAmount = monthList.salaryInit;
  //   monthList.saveAmount = monthList.saveInit;
  //   monthList.cashAmount = monthList.cashInit;
  //   int newId = await _dbController.create(monthList);
  //   if (newId != 0) {
  //     monthList.expences.forEach((element) async {
  //       element.amount = element.init;
  //         var id = await _dbEController.create(element);
  //         element.id = id;
  //     });
  //   }
  // }
  void savePlanToDB() async{
    print("plan save start");
    await _dbController.deleteAll();
    await _dbEController.deleteAll();
    monthList.salaryInit = monthList.salaryAmount;
    monthList.saveInit = monthList.saveAmount;
    monthList.cashInit = monthList.cashAmount;
    int newId = await _dbController.create(monthList);
    if (newId != 0) {
      monthList.id = newId;
      monthList.expences.forEach((element) async {
        print(element.toString());
        element.init = element.amount;
          var id = await _dbEController.create(element);
          element.id = id;
      });
    }
  }
  void savePlanList() async {
    await resetTotalValues();
    UserPreferences.instance.savePlanList(monthList);
  }

  /*
   * Get reminder date
   *
   */
  String getReminderDate() {
    DateTime salaryDate = DateTime.parse(monthList.salaryDate);
    DateTime nowDate = DateTime.now();
    int diff = daysBetween(nowDate, salaryDate);
    if (diff < 0) {
    } else {}
    return diff.toString();
  }

  int daysBetween(DateTime from, DateTime to) {
    DateTime now = DateTime.now();
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  void addAdditionalValue(double addedValue, int currentItemSelected1, {bool save = true}) {
    if (currentItemSelected1 == 0) {
      monthList.saveAmount += addedValue;
    } else if (currentItemSelected1 == 1) {
      monthList.cashAmount += addedValue;
    } else {
      monthList.expences[currentItemSelected1 - 2].amount += addedValue;
      reCalcExpSum();
    }
    if(save)
      saveList();
    notifyListeners();
  }

  double getFromSelectedItemReminderAmount(int selectedItem) {
    double diff;
    if (selectedItem == 0) {
      diff = (monthList.saveAmount - monthList.totalSave);
    } else if (selectedItem == 1) {
      diff = (monthList.cashAmount - monthList.totalCash);
    } else {
      diff = (monthList.expences[selectedItem - 2].amount -
          monthList.expences[selectedItem - 2].total);
    }

    return diff;
  }

  void transfareAmount(
      int fromCurrentItemSelected, int toCurrentItemSelected, double value) {
    addAdditionalValue(value * -1, fromCurrentItemSelected,save: false);
    addAdditionalValue(value, toCurrentItemSelected,save: false);
    saveList();
    notifyListeners();
  }

  validateMonthlyIncome() async {
    bool is_empty_type = false;
    if (monthList.salaryAmount <= 0) {
      return "You have to enter the value of the source of the monthly salary"
          .tr();
    }
    monthList.expences.forEach((element) {
      if (element.type == "" || element.type == null) {
        is_empty_type = true;
      }
    });
    if (is_empty_type) {
      return "There are expenses items that need to be named".tr();
    }
    return true;
  }

  void printList() {
    monthList.expences.forEach((element) {
      print("${element.isSelect} -> ${element.type}");
    });
  }

  
}
