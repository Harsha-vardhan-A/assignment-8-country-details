import 'dart:convert';

import 'package:countries/screens/display-country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
class ListOfCountries extends StatefulWidget {
  const ListOfCountries({super.key});

  @override
  State<ListOfCountries> createState() => _ListOfCountriesState();
}

class _ListOfCountriesState extends State<ListOfCountries> {
  late List allCountries=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // String data = await rootBundle.loadString('countries/Jsonfile/country-data.json');
    // final res=await jsonDecode(data);
    // allCountries=res;
    getCountries();
  }
  String searchVal='';
  List searchedList=[];
  getCountries()async{
    
    String data = await rootBundle.loadString('Jsonfile/country-data.json');
    final res=await jsonDecode(data);
   
    setState(() {
       allCountries=res;
       searchedList=res;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EasySearchBar(
            title: Text("Countries",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),), 
            backgroundColor: Colors.black26,
            onSearch: (val){
              // print(val);
              setState(() {
                searchVal=val;
                searchedList=[];
                for(var item in allCountries)
                {
                  if(item["countryName"].toLowerCase().contains(searchVal.toLowerCase()))
                  {
                    searchedList.add(item);
                  }
                  // print(item["countryName"].toLowerCase().contains(searchVal.toLowerCase()));
                  // print(searchedList);
                }
              });
              // searchedList=[];
            },
            
          ),
      body: Container(
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.center,
          child: ListView.builder(
            itemCount: searchedList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: TextButton(
                  child: Text("${searchedList[index]['countryName']} -- ${searchedList[index]['capital']}",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),),
                  onPressed: () {
                    Navigator.pushNamed(context, '/display',arguments: CountryData(searchedList[index]['countryName'], searchedList[index]['capital'], searchedList[index]['flag']));
                    // print(searchedList);
                  },
                  style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 137, 135, 135))),
                  ),
                // subtitle: Text("hi hello"),
              );
            },
            
          ),
        ),
      ),
    );
  }
}