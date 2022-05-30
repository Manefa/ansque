class InputValidator{

  static String? emailValidate(String? email){
    if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email!)) return "email invalide";
    return null;
  }

  static String? passwordLength(String? password) {
    if (password!.isEmpty) return "Ce champ est requis";
    if (password.length < 6) return "Au minimum 6 caractere";
    return null;
  }
}