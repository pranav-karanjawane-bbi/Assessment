import 'package:json_ui_clean_architecture/features/home_data/domain/entities/home_data.dart';

class HomeDataModel extends HomeData{

    const HomeDataModel({
    int? id,
    String? categoryName,
    bool? showOnlySubCategory,
    String? sequenceNo,
    List<ItemsModel>? items,
    SubCategoryModel? subCategory,
  }) : super(id: id, categoryName: categoryName, showOnlySubCategory: showOnlySubCategory, sequenceNo: sequenceNo, items: items, subCategory: subCategory );


   factory HomeDataModel.fromJson(Map<String, dynamic> json){
     var items = <ItemsModel>[];
     if(json['items'] != null){

       json['items'].forEach((v){
         items.add(ItemsModel.fromJson(v));
       });
     }
     var subCategory = json['subCategory'] != null
         ? SubCategoryModel.fromJson(json['subCategory']) : null;


     return HomeDataModel(
         id : json['id'],
         categoryName : json['categoryName'],
         showOnlySubCategory : json['showOnlySubCategory'],
         sequenceNo : json['sequenceNo'],
          items:  items,
       subCategory: subCategory,
         );
   }

   Map<String, dynamic>toJson(){
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



class ItemsModel extends Items{

   ItemsModel({
    String? id,
    List <String>? tag,
    DefaultPropertiesModel? defaultProperties,
}) : super(id: id, tag: tag, defaultProperties: defaultProperties);

   factory ItemsModel.fromJson(Map<String, dynamic> json){

     var defaultProperties = json['defaultProperties'] != null
         ? DefaultPropertiesModel.fromJson(json['defaultProperties'])
         :null;

     return ItemsModel (
         id : json['id'],
         tag : json['tag'].cast<String>(),
       defaultProperties: defaultProperties,
     );
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



class DefaultPropertiesModel extends DefaultProperties{

  DefaultPropertiesModel({
    bool? enabled,
    ColorModel? color,
    OnClickModel? onClick,
}) :super(enabled: enabled, color: color, onClick: onClick);

  factory DefaultPropertiesModel.fromJson(Map<String, dynamic> json){
    return DefaultPropertiesModel(
        color : json['color'] != null ? ColorModel.fromJson(json['color']) : null,
        enabled : json['enabled'],
        onClick : json['onCLick'] != null ? OnClickModel.fromJson(json['onClick']) : null,
    );
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



class ColorModel extends Color{

  ColorModel({
    String? backgroundColor,
    String? themeColor,
    String? textColor,
}) : super(backgroundColor: backgroundColor, themeColor: themeColor, textColor: textColor);

  factory ColorModel.fromJson(Map<String, dynamic> json){
    return ColorModel(
        backgroundColor : json['backgroundColor'],
        themeColor : json['themeColor'],
        textColor : json['textColor'],
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['backgroundColor'] = backgroundColor;
    data['themeColor'] = themeColor;
    data['textColor'] = textColor;
    return data;
  }
}




class OnClickModel extends OnClick{

  OnClickModel({
    String? target,
    String? parameter,
}) : super(target: target, parameter: parameter);

  factory OnClickModel.fromJson(Map<String, dynamic>json ){
    return OnClickModel(
        target : json['target'],
        parameter : json['parameter'],
    );
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = {};
    data['target'] = target;
    data['parameter'] = parameter;
    return data;
  }
}



class SubCategoryModel extends SubCategory{

  SubCategoryModel({
    String? title,
    String? sequenceNo,
    bool? showSubCategoriesAsSeparateCarousel,
    List<Items1Model>? items1,
}):super(title: title, sequenceNo: sequenceNo, showSubCategoriesAsSeparateCarousel: showSubCategoriesAsSeparateCarousel, items1: items1);

  factory SubCategoryModel.fromJson(Map<String, dynamic>json ){
    var showSubCategoriesAsSeparateCarousel =
    json['showSubCategoriesAsSeparateCarousel'];
    var items1 = <Items1Model>[];
    if (json['items'] != null) {

      json['items'].forEach((v) {
        items1.add(Items1Model.fromJson(v));
      });
    }
    return SubCategoryModel(
        title : json['title'],
        sequenceNo : json['sequenceNo'],
      showSubCategoriesAsSeparateCarousel: showSubCategoriesAsSeparateCarousel,
      items1: items1,
    );
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



class Items1Model extends Items1{

  Items1Model({
    String? id,
    String? name,
    DefaultProperties? defaultProperties,
}):super(id: id, name: name, defaultProperties: defaultProperties);

  factory Items1Model.fromJson(Map<String,dynamic>json){
    return Items1Model(
        id : json['id'],
        name : json['name'],
        defaultProperties : DefaultPropertiesModel.fromJson(json['defaultProperties']),
    );
  }

  Map<String, dynamic>toJson(){
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['defaultProperties'] = defaultProperties;
    return data;
  }
}