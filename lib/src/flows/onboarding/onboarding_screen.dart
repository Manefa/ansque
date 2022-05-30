import 'package:ansque/i18n/generated/intl.g.dart';
import 'package:ansque/src/core/assets.dart';
import 'package:ansque/src/core/themes/app_theme.dart';
import 'package:ansque/src/core/themes/dimens.dart';
import 'package:ansque/src/flows/app_pilot.dart';
import 'package:ansque/src/flows/shared/components/button.dart';
import 'package:ansque/src/services/status_bar_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String path = "/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int activeIndex = 0;
  late final PageController pageController;

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      StatusBarManager.setColor(
        iconBrightness: Brightness.dark,
        color: AppTheme.defaultTheme.scaffoldBackgroundColor,
      );
    });

    pageController = PageController(initialPage: activeIndex);
    super.initState();
  }

  void _scrollTo(int index) {
    setState(() {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInExpo,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimens.regularSpace * 2),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: activeIndex == 0 ? 1 : 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      I18n.onboarding.skip,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    onPressed: () {
                      if (activeIndex < 1) {
                        _scrollTo(++activeIndex);
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                  children: [
                    _OnboardingModel(
                      title: I18n.onboarding.firstStep,
                      image: Assets.mailSentCuate,
                    ),
                    _OnboardingModel(
                      title: I18n.onboarding.secondStep,
                      image: Assets.followingCuate,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const SizedBox(height: Dimens.regularSpace),
                    _Dots(activeIndex: activeIndex, length: 2),
                    const Spacer(flex: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: activeIndex < 1 ? 0 : 1,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Button.withIcon(
                              title: I18n.onboarding.previous,
                              iconButton: true,
                              defaultPosition: false,
                              outline: false,
                              onPressed: () {
                                if (activeIndex > 0) {
                                  _scrollTo(--activeIndex);
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Button.withIcon(
                              title: activeIndex < 1 ? I18n.onboarding.next : I18n.onboarding.start,
                              iconButton: true,
                              defaultPosition: true,
                              outline: false,
                              onPressed: () {
                                if(activeIndex == 1){
                                  AppPilot.goToLogin(context: context);
                                }

                                if (activeIndex < 1) {
                                  _scrollTo(++activeIndex);
                                }
                              }),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingModel extends StatelessWidget {
  const _OnboardingModel({Key? key, required this.image, required this.title})
      : super(key: key);

  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              child: Image.asset(image),
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 24),
          ),
        ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({
    Key? key,
    required this.activeIndex,
    required this.length,
  }) : super(key: key);

  final int length;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(length, (index) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInExpo,
            width: activeIndex == index ? 32.0 : 10.0,
            height: 10.0,
            margin: const EdgeInsets.all(Dimens.padding / 4),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(activeIndex == index ? 1.0 : 0.5),
              borderRadius: BorderRadius.circular(60.0),
            ),
          );
        })
      ],
    );
  }
}
