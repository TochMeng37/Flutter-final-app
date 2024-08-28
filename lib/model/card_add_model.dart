class AddCardResponse {
  String? status;
  List<Products>? products;

  AddCardResponse({this.status, this.products});

  AddCardResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? productName;
  String? description;
  String? price;
  String? image;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
      this.productName,
      this.description,
      this.price,
      this.image,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
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
