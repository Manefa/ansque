import 'package:ansque/src/core/assets.dart';
import 'package:ansque/src/core/themes/dimens.dart';
import 'package:flutter/material.dart';

class FileCard extends StatelessWidget {
  const FileCard({Key? key, required this.icon}) : super(key: key);

  final Widget icon;

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: Dimens.regularSpace, vertical: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  height: Dimens.regularSpace * 5,
                  width: Dimens.regularSpace * 5,
                  child: Image.asset(
                      Assets.pdfImage
                  ),
                ),
                const SizedBox(width: Dimens.regularSpace / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Demande de moratoire",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    const SizedBox(height: Dimens.regularSpace / 2),
                    Text(
                      "123 ko",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          fontSize: 12
                      ),
                    )
                  ],
                )
              ],
            ),
            InkWell(
              borderRadius: BorderRadius.circular(4.0),
              splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
              highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.9),
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: icon,
              ),
            )
          ],
        ),
      ),
    );
  }
}
