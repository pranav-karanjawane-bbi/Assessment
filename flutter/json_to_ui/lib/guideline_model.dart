import 'package:flutter/cupertino.dart';

class GuidelineModel{
  int? id;
  String? categoryName;
  bool? showOnlySubCategory;
  String? sequenceNo;
  List<Items>? items;
  SubCategory? subCategory;

  GuidelineModel({
    this.id,
    this.categoryName,
    this.showOnlySubCategory,
    this.sequenceNo,
    this.items,
    this.subCategory
  }
 );

  GuidelineModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categoryName = json['categoryName'];
    showOnlySubCategory = json['showOnlySubCategory'];
    sequenceNo = json['sequenceNo'];

    if(json['items'] != null){
      items = <Items>[];
      json['items'].forEach((v){
        items!.add(Items.fromJson(v));
      });
    }
    subCategory = json['subCategory'] != null
    ? SubCategory.fromJson(json['subCategory']) : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['categoryName'] = categoryName;
    data['showOnlySubCategory'] = showOnlySubCategory;
    data['sequenceNo'] = sequenceNo;

    if(items != null){
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if(subCategory != null){
      data['subCategory'] = subCategory!.toJson();
    }
    return data;
  }
}

class Items{
  String? id;
  List <String>? tag;
  DefaultProperties? defaultProperties;

  Items({
    this.id,
    this.tag,
    this.defaultProperties
});

  Items.fromJson(Map<String, dynamic> json){
    id = json['id'];
    tag = json['tag'].cast<String>();
    defaultProperties = json['defaultProperties'] != null
    ? DefaultProperties.fromJson(json['defaultProperties'])
        :null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['tag']= tag;
    if(defaultProperties != null){
      data['defaultProperties'] = defaultProperties!.toJson();
    }
    return data;
  }
}

class DefaultProperties{
  bool? enabled;
  Color? color;
  OnClick? onClick;

  DefaultProperties({
    this.enabled,
    this.color,
    this.onClick
});

  DefaultProperties.fromJson(Map<String, dynamic> json){
    color = json['color'] != null ? Color.fromJson(json['color']) : null;
    enabled = json['enabled'];
    onClick = json['onCLick'] != null ? OnClick.fromJson(json['onClick']) : null;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['enabled'] = enabled;
    if(color != null){
      data['color'] = color!.toJson();
    }
    if(onClick != null) {
      data['onClick'] = onClick!.toJson();
    }
    return data;
  }
}

class Color{
  String? backgroundColor;
  String? themeColor;
  String? textColor;

  Color({
    this.backgroundColor,
    this.themeColor,
    this.textColor
});

  Color.fromJson(Map<String, dynamic> json){
    backgroundColor = json['backgroundColor'];
    themeColor = json['themeColor'];
    textColor = json['textColor'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['backgroundColor'] = backgroundColor;
    data['themeColor'] = themeColor;
    data['textColor'] = textColor;
    return data;
  }
}

class OnClick{
  String? target;
  String? parameter;

  OnClick({
    this.target,
    this.parameter
});

  OnClick.fromJson(Map<String, dynamic>json){
    target = json['target'];
    parameter = json['parameter'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['target'] = target;
    data['parameter'] = parameter;
    return data;
  }
}

class SubCategory {
  String? title;
  String? sequenceNo;
  bool? showSubCategoriesAsSeparateCarousel;
  List<Items1>? items1;

  SubCategory({
    this.title,
    this.sequenceNo,
    this.showSubCategoriesAsSeparateCarousel,
    this.items1
  });

  SubCategory.fromJson(Map<String, dynamic> json){
    title = json['title'];
    sequenceNo = json['sequenceNo'];
    showSubCategoriesAsSeparateCarousel =
    json['showSubCategoriesAsSeparateCarousel'];
    if (json['items'] != null) {
      items1 = <Items1>[];
      json['items'].forEach((v) {
        items1!.add(Items1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['sequenceNo'] = sequenceNo;
    data['showSubCategoriesAsSeparateCarousel'] =
        showSubCategoriesAsSeparateCarousel;
    if (items1 != null) {
      data['items'] = items1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items1{
  String? id;
  String? name;
  DefaultProperties? defaultProperties;

  Items1({
    this.id,
    this.name,
    this.defaultProperties
});
  Items1.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    defaultProperties = DefaultProperties.fromJson(json['defaultProperties']);
  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['defaultProperties'] = defaultProperties;
    return data;
  }

}