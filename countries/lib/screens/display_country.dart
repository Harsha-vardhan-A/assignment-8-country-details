// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:countries/provider-files/getting_details.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:responsive_layout_builder/responsive_layout_builder.dart';
class CountryData{
  final Map all={};
  final String name;
  final String capital;
  final String flag;
  final int indexOfCountry;
  CountryData(this.name, this.capital, this.flag, this.indexOfCountry) ;
}
class DisplayCountry extends StatefulWidget {
  DisplayCountry({super.key,this.name, this.capital, this.flag,this.indexOfCountry});
  String? name;
  String? capital;
  String? flag;
  int? indexOfCountry;
  @override
  State<DisplayCountry> createState() => _DisplayCountryState();
}

class _DisplayCountryState extends State<DisplayCountry> {
  final stateName = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var country=context.watch<GettingDetails>();
    final args = ModalRoute.of(context)!.settings.arguments as CountryData;
  
    return Consumer<GettingDetails>(builder: (context, providetInstance, child) => Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(args.flag),
            Container(
              // alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(args.name,style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w700)),
                  const Text(" - ",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700)),
                  Text(args.capital,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.w600))
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(20,0,20,0),
              decoration: BoxDecoration(
                
              ),
              child: 
              ListView.builder(
                
                itemCount: providetInstance.searchedList[args.indexOfCountry]['states'].length,
                itemBuilder: (BuildContext context, int index) {
                  return  Text('${providetInstance.searchedList[args.indexOfCountry]["states"][index]}',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300),);
                },

              ),
            ),
            // Text(

            //   '${providetInstance.searchedList[args.indexOfCountry]["states"]}'
            //   ),
            ElevatedButton(
              onPressed: (){
                showDialog(
                  context: context, 
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Add State"),
                      actions: [
                        TextField(
                          decoration: InputDecoration(hintText: "state name"),
                          controller: stateName,
                         
                        ),
                        ElevatedButton(
                          onPressed: (){
                            
                              providetInstance.addState(stateName.text, args.indexOfCountry);
                              Navigator.pop(context);
                              stateName.text='';
                              
                          }, 
                          child: Text("add"),
                        ),
                      ],
                    );
                  },
                );
                // country.addState(, index);
              }, 
              child: Text("Add State")),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black26,
        child: Icon(Icons.arrow_back_ios,),
        onPressed: (){
        Navigator.pop(context);
        }
      ),
      )
    );
    
  }
}