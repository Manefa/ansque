import 'package:ansque/src/core/themes/app_colors.dart';
import 'package:ansque/src/core/themes/dimens.dart';
import 'package:ansque/src/datasource/repositories/auth_repository.dart';
import 'package:ansque/src/flows/app_pilot.dart';
import 'package:ansque/src/flows/auth/login/login_cubit.dart';
import 'package:ansque/src/flows/auth/login/login_state.dart';
import 'package:ansque/src/flows/shared/components/button.dart';
import 'package:ansque/src/flows/shared/components/k_text_field.dart';
import 'package:ansque/src/services/input_validator.dart';
import 'package:ansque/src/shared/DialogFactory.dart';
import 'package:ansque/src/shared/ToastMixin.dart';
import 'package:ansque/src/shared/locator.dart';
import 'package:ansque/src/shared/logic/app_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hi_icons/flutter_hi_icons.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) : super(key: key);

  static const String path = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ToastMixin{
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final TextEditingController emailController;
  late final TextEditingController matriculeController;

  @override
  void initState() {
    emailController = TextEditingController(text: kDebugMode ? "backers99@gmail.com": "");
    matriculeController = TextEditingController(text: kDebugMode ? "12345678" : "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        authRepository: locator<AuthRepository>(),
        appCubit: context.read<AppCubit>(),
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if(state is LoginLoading){
                  DialogFactory.showLoadingDialog(context: context);
                }

                if(state is LoginSuccess){
                  DialogFactory.hideDialog(context);
                  AppPilot.goToHome(context: context);
                }

                if(state is LoginError){
                  DialogFactory.hideDialog(context);
                  showToast(
                    context: context,
                    message: state.error.message,
                    type: ToastType.error,
                  );
                }
              },
              builder: (context, state){
                return Form(
                  key: _formKey,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: Dimens.padding),
                      child: Column(
                        children: [
                          const SizedBox(height: Dimens.regularSpace * 2),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Veuillez vous authentifier",
                              style: Theme.of(context).textTheme.headline2!.copyWith(
                                  fontSize: 24
                              ),
                            ),
                          ),
                          const SizedBox(height: Dimens.regularSpace),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Entrer vous identifiant pour vous connecter",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: AppColors.grey
                              ),
                            ),
                          ),
                          const SizedBox(height: Dimens.regularSpace * 3),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Email*",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: AppColors.grey
                              ),
                            ),
                          ),
                          const SizedBox(height: Dimens.regularSpace),
                          KTextField(
                            controller: emailController,
                            prefixIcon: const Icon(
                              HiIcons.message_36_light_outline,
                              color: Colors.black,
                            ),
                            onChanged: context.read<LoginCubit>().onEmailChange,
                            hintText: "Johndoe@gmail.com",
                            validator: InputValidator.emailValidate,
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const SizedBox(height: Dimens.regularSpace * 2),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Matricule*",
                              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                  color: AppColors.grey
                              ),
                            ),
                          ),
                          const SizedBox(height: Dimens.regularSpace),
                          KTextField(
                            controller: matriculeController,
                            prefixIcon: const Icon(
                              Iconsax.lock,
                              color: Colors.black,
                            ),
                            onChanged: context.read<LoginCubit>().onPasswordChange,
                            hintText: "123456",
                            obscureText: true,
                            validator: InputValidator.passwordLength,
                            autoValidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const Spacer(flex: 10),
                          Button.primary(
                            title: "Se connecter",
                            outline: false,
                            onPressed: (){
                              if(_formKey.currentState?.validate() == true){
                                context.read<LoginCubit>().login();
                              }
                            },
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                    ),
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
