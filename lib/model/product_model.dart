class ProductResponse {
  String? status;
  List<DataResponse>? data;

  ProductResponse({this.status, this.data});

  ProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <DataResponse>[];
      json['data'].forEach((v) {
        data!.add(new DataResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataResponse {
  int? id;
  String? productName;
  String? description;
  String? price;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  DataResponse(
      {this.id,
      this.productName,
      this.description,
      this.price,
      this.image,
      this.userId,
      this.createdAt,
      this.updatedAt});

  DataResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
