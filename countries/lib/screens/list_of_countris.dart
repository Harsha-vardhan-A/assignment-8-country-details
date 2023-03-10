// import 'dart:convert';

import 'package:countries/screens/display_country.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:countries/provider-files/getting_details.dart';
import 'package:provider/provider.dart';
class ListOfCountries extends StatefulWidget {
  const ListOfCountries({super.key});

  @override
  State<ListOfCountries> createState() => _ListOfCountriesState();
}

class _ListOfCountriesState extends State<ListOfCountries> {
  // late List allCountries=[];
  // String searchVal='';
  // List searchedList=[];
  // var country = context.watch<GettingDetails>();
  // var a= GettingDetails().getCountries();
  // a.getCountries();
  // var a=Provider.of<GettingDetails>().getCountries();
  // var country;
    // var newProvider=Provider.of<GettingDetails>(context);
  GettingDetails getdetails =  GettingDetails();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails.getCountries();
    // print(getdetails.allCountries);
    setState(() {
      // getdetails.getCountries();
      // getdetails.searchedList=getdetails.allCountries;
      // print(getdetails.allCountries);
    });
    // country = context.watch<GettingDetails>();
    // var a=Provider.of<GettingDetails>(context);
    // a.getCountries();
    // String data = await rootBundle.loadString('countries/Jsonfile/country-data.json');
    // final res=await jsonDecode(data);
    // allCountries=res;
    // getCountries();
    
    // a.getCountries();
    // print(a.searchedList);
  }
  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  //   // var a=Provider.of<GettingDetails>(context).getCountries();
    
  //     // country.getCountries();
  // }
  // getCountries()async{
    
  //   String data = await rootBundle.loadString('Jsonfile/country-data.json');
  //   final res=await jsonDecode(data);
   
  //   setState(() {
  //      allCountries=res;
  //      searchedList=res;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    // var country = context.watch<GettingDetails>();
    // print("list of countries build");
    // country.getCountries();
    // var a=GettingDetails();
    // a.getCountries();
    return Consumer<GettingDetails>(
      builder: (BuildContext context, providerInstance, Widget? child) => Scaffold(
        appBar: EasySearchBar(
              title: Text("Countries",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),), 
              backgroundColor: Colors.black26,
              onSearch: (val){
                // print(val);
                // setState(() {
                //   // country.getCountries();
                //   country.getSearch(val);
    
                // });
                providerInstance.getSearch(val);
                // print("mani ${country.searchedList}");
                // setState(() {
                //   searchVal=val;
                //   searchedList=[];
                //   for(var item in allCountries)
                //   {
                //     if(item["countryName"].toLowerCase().contains(searchVal.toLowerCase()))
                //     {
                //       searchedList.add(item);
                //     }
                //   }
                // });
              },
              
            ),
        body: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            alignment: Alignment.center,
            child: ListView.builder(
              itemCount: providerInstance.searchedList.length,
              // country.searchedList.length,
              itemBuilder: (context, index) {
                // print("delhi ${country.searchedList.length}");
                // print(country.searchedList);
                return ListTile(
                  title: TextButton(
                    // style:ButtonStyle(),
                    child: Text("${providerInstance.searchedList[index]['countryName']} -- ${providerInstance.searchedList[index]['capital']}",style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w700,color: Colors.white),),
                    onPressed: () {
                      Navigator.pushNamed(context, '/display',arguments: CountryData(providerInstance.searchedList[index]['countryName'], providerInstance.searchedList[index]['capital'], providerInstance.searchedList[index]['flag'],index));
                      // print(country.searchedList[index]);
                    },
                    style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 137, 135, 135))),
                    ),
                );
              },
              
            ),
          ),
        ),
      
      ),
      
    );
  }
}