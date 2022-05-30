import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:ansque/src/core/themes/dimens.dart';
import 'package:ansque/src/flows/shared/components/button.dart';
import 'package:ansque/src/flows/shared/components/file_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hi_icons/flutter_hi_icons.dart';

import '../../shared/components/line_info.dart';

class RequestDetailScreen extends StatefulWidget {
  const RequestDetailScreen({Key? key}) : super(key: key);

  static const String path = "/requestDetail";

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: Dimens.padding),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Details de la requete",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  const SizedBox(height: Dimens.regularSpace),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Consulter les details de la requette",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  const SizedBox(height: Dimens.regularSpace * 3),
                  const LineInfo(title: 'ID :', value: "37D7NF"),
                  const SizedBox(height: Dimens.regularSpace),
                  const LineInfo(title: 'Objet de la requete :', value: "Demande de moratoire"),
                  const SizedBox(height: Dimens.regularSpace),
                  const LineInfo(title: 'Date de depot :', value: "26 mars 2022"),
                  const SizedBox(height: Dimens.regularSpace),
                  const LineInfo(title: 'Statut :', value: "En attente"),
                  const SizedBox(height: Dimens.regularSpace * 2),
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
                  const FileCard(
                    icon: Icon(
                      HiIcons.download_1_light_outline,
                      color: Colors.black,
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
                  const FileCard(
                    icon: Icon(
                      HiIcons.download_1_light_outline,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Button.secondary(
                    title: "Annuler la requete",
                    onPressed: (){

                    },
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
