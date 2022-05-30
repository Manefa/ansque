import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:ansque/src/core/themes/dimens.dart';
import 'package:ansque/src/flows/app_pilot.dart';
import 'package:ansque/src/flows/request/request_pilot.dart';
import 'package:ansque/src/flows/shared/components/line_info.dart';
import 'package:ansque/src/shared/logic/app_cubit.dart';
import 'package:ansque/src/shared/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hi_icons/flutter_hi_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String path = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
            child: Column(
              children: [
                const SizedBox(height: Dimens.regularSpace * 2),
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, state){
                    return Row(
                      children: [
                        Container(
                          height: Dimens.regularSpace * 5,
                          width: Dimens.regularSpace * 5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                                state.user!.email.substring(0, 2).toUpperCase(),
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: Dimens.regularSpace),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Salut",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            Text(
                              state.user!.email,
                              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: Dimens.regularSpace * 3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Requete en cours de traitement",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.regularSpace * 3),
                InkWell(
                  onTap: (){
                    RequestPilot.goToDetailScreen(context: context);
                  },
                  child: const _RequestCard(
                    requestStatus: RequestStatus.wait,
                  ),
                ),
                const SizedBox(height: Dimens.regularSpace * 2),
                const _RequestCard(
                  requestStatus: RequestStatus.wait,
                ),
                const SizedBox(height: Dimens.regularSpace * 3),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Requete traiter",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                const SizedBox(height: Dimens.regularSpace * 3),
                const _RequestCard(
                  requestStatus: RequestStatus.success,
                ),
                const SizedBox(height: Dimens.regularSpace * 2),
                const _RequestCard(
                  requestStatus: RequestStatus.fail,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: InkWell(
          onTap: (){
            AppPilot.showCreateRequest(context: context);
          },
          child: Container(
            height: Dimens.regularSpace * 8,
            width: Dimens.regularSpace * 8,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle
            ),
            child: const Icon(
              HiIcons.add_bold
            ),
          ),
        ),
        onPressed: (){

        },
      ),
    );
  }
}

enum RequestStatus {
  wait,
  success,
  fail,
}

class _RequestCard extends StatelessWidget {
  const _RequestCard({Key? key, required this.requestStatus}) : super(key: key);

  final RequestStatus requestStatus;

  @override
  Widget build(BuildContext context) {

    late BoxDecoration decoration;
    late String title;

    switch (requestStatus) {
      case RequestStatus.wait:
        decoration = BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(4.0),
        );
        title = "En attente...";

        break;
      case RequestStatus.fail:
        decoration = BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(4.0),
        );
        title = "Refuser";

        break;
      case RequestStatus.success:
          decoration =  BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(4.0),
          );

          title = "Accepter";

        break;
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius:BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.15),
          )
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.regularSpace, vertical: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                LineInfo(title: 'ID :', value: 'R49HD93'),
                SizedBox(height: Dimens.regularSpace / 2),
                LineInfo(title: 'Date :', value: 'Deposer le 22 mai 2022'),
                SizedBox(height: Dimens.regularSpace / 2),
                LineInfo(title: 'Objet :', value: 'Notes de CC incompletes'),
              ],
            ),
            Container(
              decoration: decoration,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.regularSpace, vertical: Dimens.regularSpace),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


