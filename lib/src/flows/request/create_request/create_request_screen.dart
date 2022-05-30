import 'dart:io';

import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:ansque/src/core/themes/dimens.dart';
import 'package:ansque/src/flows/request/create_request/create_request_cubit.dart';
import 'package:ansque/src/flows/shared/components/button.dart';
import 'package:ansque/src/flows/shared/components/file_card.dart';
import 'package:ansque/src/flows/shared/components/k_text_field.dart';
import 'package:ansque/src/shared/locator.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hi_icons/flutter_hi_icons.dart';
import 'package:open_file/open_file.dart';

class CreateRequestScreen extends StatefulWidget {
  const CreateRequestScreen({Key? key}) : super(key: key);

  static const String path = "/createRequest";

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {
  late final TextEditingController objetController;

  @override
  void initState() {
    objetController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateRequestCubit(requestRepository: locator()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
              child: BlocConsumer(
                listener: (context, state){

                },
                builder: (context, state){
                  return Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Nouvelle requete",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      const SizedBox(height: Dimens.regularSpace),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Creer et deposer une nouvelle requette",
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      const SizedBox(height: Dimens.regularSpace * 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Objet de la requete*",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(color: AppColors.grey),
                        ),
                      ),
                      const SizedBox(height: Dimens.regularSpace / 2),
                      KTextField(
                        controller: objetController,
                        prefixIcon: const Icon(
                          HiIcons.document_align_left_6_light_outline,
                          color: Colors.black,
                        ),
                        hintText: "Demande de moratoire",
                      ),
                      const SizedBox(height: Dimens.regularSpace * 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lettre",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: Dimens.regularSpace * 2),
                      FileCard(
                        icon: Icon(
                          HiIcons.close_bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(height: Dimens.regularSpace * 3),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Pieces jointes",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: Dimens.regularSpace * 2),
                      FileCard(
                        icon: Icon(
                          HiIcons.close_bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(
                        height: Dimens.regularSpace * 5,
                      ),
                      DottedBorder(
                        dashPattern: const [6, 6],
                        child:  SizedBox(
                          height: Dimens.regularSpace * 10,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: Dimens.doublePadding * 4),
                                child: Button.circleButton(
                                  isCircleButton: true,
                                  color: Colors.black,
                                  onPressed: (){
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Container(
                                                  height: Dimens.regularSpace * 10,
                                                  width: MediaQuery.of(context).size.width,
                                                  color: Colors.white,
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                      children: [
                                                        _FileType(
                                                          icon: HiIcons.message_35_light_outline,
                                                          type: "Lettre",
                                                          onPressed: () {

                                                          },
                                                        ),
                                                        _FileType(
                                                          icon: HiIcons.attachment_bold,
                                                          type: "Pieces jointes",
                                                          onPressed: (){

                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                    );
                                  },
                                ),
                              ),
                              const Text(
                                  "Ajouter un fichier"
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FileType extends StatelessWidget {
  const _FileType({Key? key, required this.icon, required this.type, required this.onPressed}) : super(key: key);

  final IconData icon;
  final String type;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onPressed,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              const SizedBox(width: Dimens.regularSpace * 2),
              Text(
                type,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
