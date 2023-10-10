import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/utility.dart';
import '../../data/models/home_data_model.dart'as model;
import 'color_converter.dart';


ListView displayGuideline() {
  return (
      ListView.builder(
        // this is the main listview builder the vertical axis direcrtion
        itemCount: objList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              height: 270,
              // width: 550,
              color: Colors.grey.shade300,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      // this is the nested listvew bulder for the specific cards
                      scrollDirection: Axis.horizontal,
                      itemCount: objList[index].items!.length,
                      itemBuilder: (context, num) {
                        model.ItemsModel it = objList[index].items![num];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 10,
                                color: colorConverter(
                                    it.defaultProperties!.color!.themeColor!),
                              ),
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 3, color: Colors.amber),
                                  color: colorConverter(
                                      it.defaultProperties!.color!
                                          .backgroundColor!),
                                ),

                                child: Text(
                                  "${objList[index].items![num].id}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  //**************************
                  Visibility(
                    visible: objList[index]!.showOnlySubCategory!,
                    child: Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: objList[index].subCategory!.items1?.length,
                        itemBuilder: (context, number) {
                          model.Items1Model item = objList[index].subCategory!
                              .items1![number];

                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 10,
                                  color: colorConverter(
                                      item.defaultProperties!.color!
                                          .themeColor!),

                                ),
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Colors.deepPurple),
                                    color: colorConverter(
                                        item.defaultProperties!.color!
                                            .backgroundColor!),
                                  ),

                                  child: Text(
                                    "${objList[index].subCategory!
                                        .items1![number].id}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ) // ***************************************


                ],
              ),
            ),
          );


          // Text("data ${objList[index].categoryName}");
        },
      )
  );
}