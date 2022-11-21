class HomeModel {
  bool? status;
  HomeModelData? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeModelData.fromJson(json['data']);
  }
}

class HomeModelData {
  List<HomeModelBanner> banners = [];
  List<HomeModelProduct> products = [];

  HomeModelData.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((e) {
      banners.add(HomeModelBanner.fromJson(e));
    });
    json['products'].forEach((e) {
      products.add(HomeModelProduct.fromJson(e));
    });
  }
}

class HomeModelBanner {
  int? id;
  String? image;

  HomeModelBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class HomeModelProduct {
  int? id;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name;
  bool? inFavorites;
  bool? inCart;

  HomeModelProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
