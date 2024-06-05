import 'dart:convert';

Autogenerated autogeneratedFromJson(String str) =>
    Autogenerated.fromJson(json.decode(str));

String autogeneratedToJson(Autogenerated data) => json.encode(data.toJson());

class Autogenerated {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  Autogenerated({this.products, this.total, this.skip, this.limit});

  factory Autogenerated.fromJson(Map<String, dynamic> json) => Autogenerated(
        products: List<Products>.from(
            json['products'].map((x) => Products.fromJson(x))),
        total: json['total'],
        skip: json['skip'],
        limit: json['limit'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}

class Products {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<dynamic>? tags;
  String? brand;
  String? sku;
  int? weight;
  Dimensions? dimensions;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  List<Reviews>? reviews;
  String? returnPolicy;
  int? minimumOrderQuantity;
  Meta? meta;
  List<dynamic>? images;
  String? thumbnail;

  Products(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.discountPercentage,
      this.rating,
      this.stock,
      this.tags,
      this.brand,
      this.sku,
      this.weight,
      this.dimensions,
      this.warrantyInformation,
      this.shippingInformation,
      this.availabilityStatus,
      this.reviews,
      this.returnPolicy,
      this.minimumOrderQuantity,
      this.meta,
      this.images,
      this.thumbnail});

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        price: json['price'].toDouble(),
        discountPercentage: json['discountPercentage'].toDouble(),
        rating: json['rating'].toDouble(),
        stock: json['stock'],
        tags: json['tags'],
        brand: json['brand'],
        sku: json['sku'],
        weight: json['weight'],
        dimensions: Dimensions.fromJson(json['dimensions']),
        warrantyInformation: json['warrantyInformation'],
        shippingInformation: json['shippingInformation'],
        availabilityStatus: json['availabilityStatus'],
        reviews:
            List<Reviews>.from(json["reviews"].map((x) => Reviews.fromJson(x))),
        returnPolicy: json['returnPolicy'],
        minimumOrderQuantity: json['minimumOrderQuantity'],
        meta: Meta.fromJson(json['meta']),
        images: json['images'],
        thumbnail: json['thumbnail'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    data['discountPercentage'] = discountPercentage;
    data['rating'] = rating;
    data['stock'] = stock;
    data['tags'] = tags;
    data['brand'] = brand;
    data['sku'] = sku;
    data['weight'] = weight;
    if (dimensions != null) {
      data['dimensions'] = dimensions!.toJson();
    }
    data['warrantyInformation'] = warrantyInformation;
    data['shippingInformation'] = shippingInformation;
    data['availabilityStatus'] = availabilityStatus;
    if (reviews != null) {
      data['reviews'] = reviews!.map((v) => v.toJson()).toList();
    }
    data['returnPolicy'] = returnPolicy;
    data['minimumOrderQuantity'] = minimumOrderQuantity;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['images'] = images;
    data['thumbnail'] = thumbnail;
    return data;
  }
}

class Dimensions {
  double? width;
  double? height;
  double? depth;

  Dimensions({this.width, this.height, this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json['width'].toDouble(),
        height: json['height'].toDouble(),
        depth: json['depth'].toDouble(),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['width'] = width;
    data['height'] = height;
    data['depth'] = depth;
    return data;
  }
}

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
      this.comment,
      this.date,
      this.reviewerName,
      this.reviewerEmail});

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        rating: json['rating'],
        comment: json['comment'],
        date: json['date'],
        reviewerName: json['reviewerName'],
        reviewerEmail: json['reviewerEmail'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rating'] = rating;
    data['comment'] = comment;
    data['date'] = date;
    data['reviewerName'] = reviewerName;
    data['reviewerEmail'] = reviewerEmail;
    return data;
  }
}

class Meta {
  String? createdAt;
  String? updatedAt;
  String? barcode;
  String? qrCode;

  Meta({this.createdAt, this.updatedAt, this.barcode, this.qrCode});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        barcode: json['barcode'],
        qrCode: json['qrCode'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['barcode'] = barcode;
    data['qrCode'] = qrCode;
    return data;
  }
}
