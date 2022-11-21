class CatModel {
  bool? status;
  CatModelData? data;

  CatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = CatModelData.fromJson(json['data']);
  }
}

class CatModelData {
  int? currentPage;

  List<DataOfCatModelData> data = [];

  CatModelData.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    json['data'].forEach((e) {
      data.add(DataOfCatModelData.fromJson(e));
    });
  }
}

class DataOfCatModelData {
  int? id;
  String? name;
  String? image;

  DataOfCatModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
