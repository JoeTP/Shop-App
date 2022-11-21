class FavoriteModel {
  bool? status;
  FavoriteModelData? data;

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = FavoriteModelData.fromJson(json['data']);
  }
}

class FavoriteModelData {
  int? currentPage;
  List<DataOfFavoriteModelData> data = [];

  FavoriteModelData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((e) {
      data.add(DataOfFavoriteModelData.fromJson(e));
    });
  }
}

class DataOfFavoriteModelData {
  int? id;
  FavoriteProductModel? product;

  DataOfFavoriteModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = FavoriteProductModel.fromJson(json['product']);
  }
}

class FavoriteProductModel {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;

  FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
  }
}
