class JsonData {
  String lang;
  String sallaryDate;
  int sallaryAmount;
  int totalCash;
  int cashAmount;
  int sumExpences;
  int sumTotalExpences;
  int totalMonthly;
  int mounthlyAmount;
  int totalSave;
  int saveAmount;
  List<Expences> expences;

  JsonData(
      {this.lang,
        this.sallaryDate,
        this.sallaryAmount,
        this.totalCash,
        this.cashAmount,
        this.sumExpences,
        this.sumTotalExpences,
        this.totalMonthly,
        this.mounthlyAmount,
        this.totalSave,
        this.saveAmount,
        this.expences});

  JsonData.fromJson(Map<String, dynamic> json) {
    lang = json['lang'];
    sallaryDate = json['sallary_date'];
    sallaryAmount = json['sallary_amount'];
    totalCash = json['totalCash'];
    cashAmount = json['cashAmount'];
    sumExpences = json['sumExpences'];
    sumTotalExpences = json['sumTotalExpences'];
    totalMonthly = json['totalMonthly'];
    mounthlyAmount = json['mounthlyAmount'];
    totalSave = json['totalSave'];
    saveAmount = json['saveAmount'];
    if (json['expences'] != null) {
      expences = new List<Expences>();
      json['expences'].forEach((v) {
        expences.add(new Expences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lang'] = this.lang;
    data['sallary_date'] = this.sallaryDate;
    data['sallary_amount'] = this.sallaryAmount;
    data['totalCash'] = this.totalCash;
    data['cashAmount'] = this.cashAmount;
    data['sumExpences'] = this.sumExpences;
    data['sumTotalExpences'] = this.sumTotalExpences;
    data['totalMonthly'] = this.totalMonthly;
    data['mounthlyAmount'] = this.mounthlyAmount;
    data['totalSave'] = this.totalSave;
    data['saveAmount'] = this.saveAmount;
    if (this.expences != null) {
      data['expences'] = this.expences.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Expences {
  int id;
  String type;
  int amount;
  int total;
  bool isSelect;

  Expences({this.id, this.type, this.amount, this.total, this.isSelect});

  Expences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
    total = json['total'];
    isSelect = json['isSelect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['total'] = this.total;
    data['isSelect'] = this.isSelect;
    return data;
  }
}