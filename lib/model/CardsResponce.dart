class CardsResponce {
  List<Card> data;

  CardsResponce({this.data});

  CardsResponce.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<Card>();
      json['data'].forEach((v) {
        data.add(new Card.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Card {
  bool isNew;
  bool isVisible;
  Data data;
  String image;
  String logo;
  String goldId;

  Card({this.isNew, this.isVisible, this.image,this.logo,this.goldId, this.data});

  Card.fromJson(Map<String, dynamic> json) {
    isNew = json['is_new'];
    isVisible = json['is_visible'];
    image = json['image'];
    logo = json['logo'];
    goldId = json['goldId'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_new'] = this.isNew;
    data['is_visible'] = this.isVisible;
    data['image'] = this.image;
    data['logo'] = this.logo;
    data['goldId'] = this.goldId;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String bankName;
  String cardName;
  int limit;
  String type;
  String cardNumber;

  Data({this.bankName, this.cardName, this.limit, this.type, this.cardNumber});

  Data.fromJson(Map<String, dynamic> json) {
    bankName = json['bank_name'];
    cardName = json['card_name'];
    limit = json['limit'];
    type = json['type'];
    cardNumber = json['card_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bank_name'] = this.bankName;
    data['card_name'] = this.cardName;
    data['limit'] = this.limit;
    data['type'] = this.type;
    data['card_number'] = this.cardNumber;
    return data;
  }
}