import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tudo_assignment/configs/constants/app_constants.dart';
import 'package:tudo_assignment/configs/styles/app_colors.dart';
import 'package:tudo_assignment/models/character_list_model.dart';
import 'package:get/get.dart';
import 'package:tudo_assignment/views/pages/detail_view.dart';

class CharacterListComponents extends StatefulWidget {
  final ListofCharacter? lists;
  const CharacterListComponents({Key? key, this.lists}) : super(key: key);

  @override
  State<CharacterListComponents> createState() => _CharacterListComponentsState();
}

class _CharacterListComponentsState extends State<CharacterListComponents> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: AppConstants.screenHorizontalPadding,
          vertical: AppConstants.screenVerticalPadding),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.orange.shade100,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(3, 3))
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 80,
                  height: 100,
                  child: Image(
                    image: NetworkImage(widget.lists!.img.toString()),
                    fit: BoxFit.cover,
                  )),
              ]),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.lists!.name.toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDarkColor,
                          fontSize: 18),
                    ),
                    Text(widget.lists!.birthday == "Unknown" ? "Unknown" : DateFormat.yMMMd("en_US").format(
                    (DateFormat('dd-MM-yyyy').parse(widget.lists!.birthday))),

                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDarkColor,
                          fontSize: 14),
                    ),


                  ],
                ),
              ),
          const Spacer(),
          Column(

            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 25,),
              InkWell(
                onTap: (){
                  Get.to(()=>DetailedPage(
                    char_id:widget.lists!.charId,
                    name:widget.lists!.name,
                    birthday:widget.lists!.birthday,
                    occupation:widget.lists!.occupation,
                    img:widget.lists!.img,
                    status:widget.lists!.status,
                    nickname:widget.lists!.nickname,
                  ));
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryButtonColor,
                        borderRadius: BorderRadius.circular(50)
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(Icons.arrow_forward, color: Colors.white,),
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
