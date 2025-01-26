

class ProductModel {
  int? id;
  String? name;
  String? description;
  String? price;
  int? stock;
  String? status;
  int? categoryId;
  String? createdAt;
  String? updatedAt;
  bool? isWishList;
  num rate = 0;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stock,
        this.status,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    status = json['status'];
    categoryId = json['category_id'];
    isWishList = json['in_wishlist'];
    rate = json['average_rating'] ?? 0;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}





