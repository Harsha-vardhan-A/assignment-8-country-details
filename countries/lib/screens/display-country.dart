import 'package:flutter/material.dart';

class CountryData{
  final Map all={};
  final String name;
  final String capital;
  final String flag;
  CountryData(this.name, this.capital, this.flag) ;
}
class DisplayCountry extends StatefulWidget {
  DisplayCountry({super.key,this.name, this.capital, this.flag});
  String? name;
  String? capital;
  String? flag;
  @override
  State<DisplayCountry> createState() => _DisplayCountryState();
}

class _DisplayCountryState extends State<DisplayCountry> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as CountryData;
    return Scaffold(
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
            // Text(args.name,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700)),
            // Text(args.capital,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700))
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
    );
    
  }
}