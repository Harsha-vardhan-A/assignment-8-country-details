import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class GettingDetails extends ChangeNotifier {
  String searchVal = '';
  List dummy = [];
  // List searchedList = [];
  List allCountries = [ 
        {
            "countryName":"India",
            "capital":"Delhi",
            "flag":"assets/images/india.png",
            "states":[]
        },
        {
            "countryName":"Srilanka",
            "capital":"colambo",
            "flag":"assets/images/srilanka.png",
            "states":[]
        },
        {
            "countryName":"Nepal",
            "capital":"Kathmandu",
            "flag":"assets/images/nepal.png",
            "states":[]
        },
        {
            "countryName":"China",
            "capital":"Beijing",
            "flag":"assets/images/china.png",
            "states":[]
        },
        {
            "countryName":"Pakistan",
            "capital":"Islamabad",
            "flag":"assets/images/pakistan.png",
            "states":[]
        },
        {
            "countryName":"USA",
            "capital":"Washington, D.C.",
            "flag":"assets/images/usa.png",
            "states":[]
        },
        {
            "countryName":"Russia",
            "capital":"Masko",
            "flag":"assets/images/russia.png",
            "states":[]
        },
        {
            "countryName":"U.K",
            "capital":"London",
            "flag":"assets/images/uk.png",
            "states":[]
        },
        {
            "countryName":"Bhutan",
            "capital":"Thimphu",
            "flag":"assets/images/bhutan.png",
            "states":[]
        },
        {
            "countryName":"Bangladesh",
            "capital":"Dhaka",
            "flag":"assets/images/bangladesh.png",
            "states":[]
        }
      ];
    List searchedList=[];
  // Future getCountries() async {
  //   String data = await rootBundle.loadString('Jsonfile/country-data.json');
  //   final res = await jsonDecode(data);
  //   allCountries = res;
  //   // print(allCountries);
  //   // searchedList = allCountries;
  //   notifyListeners();
  // }
  getCountries()
  {
    searchedList=allCountries;
  }

  getSearch(String val) {
    getCountries();
    searchVal = val;
    dummy = [];
    if (searchVal.isNotEmpty) {
      for (var item in allCountries) {
        if (item["countryName"]
            .toLowerCase()
            .contains(searchVal.toLowerCase())) {
          dummy.add(item);
        }
      }
      searchedList = dummy;
    } else {
      searchedList = allCountries;
    }
    notifyListeners();
  }

  addState(String state, int index) {
    // print(state);
    // searchedList[index]['states'].add(state);
    if(state.isNotEmpty)

    {
      for(int i=0;i<allCountries.length;i++)
      {
        if(allCountries[i]['countryName']==searchedList[index]['countryName'])
        {
          allCountries[i]['states'].add(state);
          break;
        }
      }
    }
    
  }
}
