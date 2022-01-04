import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tudo_assignment/configs/constants/app_constants.dart';
import 'package:tudo_assignment/configs/styles/app_colors.dart';

class DetailedPage extends StatefulWidget {
  int? char_id;
  String? name;
  String? birthday;
  List? occupation;
  String? img;
  String? nickname;
  var status;

  DetailedPage({Key? key, this.char_id,this.name,this.birthday,this.occupation,this.img,this.status,this.nickname}) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detailed Page"),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Image(
                image: NetworkImage(widget.img.toString()),
                fit: BoxFit.fitHeight,
              ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
              minChildSize: 0.2,
              builder: (context, controller) => Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.screenHorizontalPadding,
                      vertical: AppConstants.screenVerticalPadding),
                  child: ListView(
                    controller: controller,
                    children: [
                      Row(
                        children: [
                          const Text("Name: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                          Text(widget.name.toString(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Text("Born on: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          Text(widget.birthday == "Unknown" ? "Unknown" : DateFormat.yMMMEd().format(
                              (DateFormat('dd-MM-yyyy').parse(widget.birthday.toString()))), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                        ],
                      ),
                      const SizedBox(height: 7,),
                      Row(
                        children: [
                          const Text("Also Known As: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          Text(widget.nickname.toString(), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),

                        ],
                      ),
                      const SizedBox(height: 7,),

                      const SizedBox(height: 7,),
                      const Text("Occupancy: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),

                      Text(widget.occupation.toString(), style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,),

                    ],
                  ),
                ),
              )
          )



        ],

      ),
    );
  }
}
