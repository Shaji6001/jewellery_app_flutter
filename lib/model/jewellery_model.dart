/// _id : "604f69ab5cd35d2b68e2ec72"
/// shopName : "TajMahal"
/// customerName : "shop1, Agra"
/// customerPhoneno : "2278009111"
/// goldRate : "1015"
/// goldWeight : "150"
/// goldPrice : "2010"

class JewelleryModel {
  String _id;
  String _shopName;
  String _customerName;
  String _customerPhoneno;
  String _goldRate;
  String _goldWeight;
  String _goldPrice;

  String get id => _id;
  String get shopName => _shopName;
  String get customerName => _customerName;
  String get customerPhoneno => _customerPhoneno;
  String get goldRate => _goldRate;
  String get goldWeight => _goldWeight;
  String get goldPrice => _goldPrice;

  JewelleryModel(
      {String id,
      String shopName,
      String customerName,
      String customerPhoneno,
      String goldRate,
      String goldWeight,
      String goldPrice}) {
    _id = id;
    _shopName = shopName;
    _customerName = customerName;
    _customerPhoneno = customerPhoneno;
    _goldRate = goldRate;
    _goldWeight = goldWeight;
    _goldPrice = goldPrice;
  }

  JewelleryModel.fromJson(dynamic json) {
    _id = json["_id"];
    _shopName = json["shopName"];
    _customerName = json["customerName"];
    _customerPhoneno = json["customerPhoneno"];
    _goldRate = json["goldRate"];
    _goldWeight = json["goldWeight"];
    _goldPrice = json["goldPrice"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["_id"] = _id;
    map["shopName"] = _shopName;
    map["customerName"] = _customerName;
    map["customerPhoneno"] = _customerPhoneno;
    map["goldRate"] = _goldRate;
    map["goldWeight"] = _goldWeight;
    map["goldPrice"] = _goldPrice;
    return map;
  }
}
