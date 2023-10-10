import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../../data/models/home_data_model.dart';

class HomeData extends Equatable {
   const HomeData({
    this.id,
     this.categoryName,
     this.sequenceNo,
     this.items,
     this.showOnlySubCategory,
     this.subCategory,

});
   final int? id;
   final String? categoryName;
   final bool? showOnlySubCategory;
   final String? sequenceNo;
   final List<ItemsModel>? items;
   final SubCategoryModel? subCategory;



  @override
  // TODO: implement props
  List<Object?> get props => [id,categoryName,showOnlySubCategory,sequenceNo,items,subCategory];

}


class Items {
  String? id;
  List <String>? tag;
  DefaultPropertiesModel? defaultProperties;

  Items({
     this.id,
     this.tag,
    this.defaultProperties
  });

}

class DefaultProperties {
  bool? enabled;
  ColorModel? color;
  OnClickModel? onClick;

  DefaultProperties({
     this.enabled,
     this.color,
     this.onClick,
  });
}

class Color {
  String? backgroundColor;
  String? themeColor;
  String? textColor;

  Color({
    this.backgroundColor,
    this.themeColor,
    this.textColor
  });
}

class OnClick{
  String? target;
  String? parameter;

  OnClick({
    this.target,
    this.parameter
  });
}

class SubCategory {
  String? title;
  String? sequenceNo;
  bool? showSubCategoriesAsSeparateCarousel;
  List<Items1Model>? items1;

  SubCategory({
    this.title,
    this.sequenceNo,
    this.showSubCategoriesAsSeparateCarousel,
    this.items1
  });
}

class Items1 {
  String? id;
  String? name;
  DefaultProperties? defaultProperties;

  Items1({
    this.id,
    this.name,
    this.defaultProperties
  });
}