import 'package:mobx/mobx.dart';
import 'package:mobx_flutterando/models/client.dart';

part 'controller.g.dart';
/*Se você passar com o (), você está passando o valor que é retornado por essa função como parâmetro.
  Mas se você passar sem o (), você está pasasndo uma referência a essa função, são coisas bem diferentes*/

/*Se você passar como parâmetro da função getRandomString(),
é a mesma coisa que você passar o valor de stringToReturn, mas se você passar sem o (),
 você está passando a função que será executada quando essa Action ocorrer

String getRandomString() {
    String stringToReturn = "10000";

    stringToReturn += " - patos";

    return stringToReturn;
}


 */
class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid{
    return validateEmail() == null && validateName() ==null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Campo obrigatório";
    }
    return null;
  }

  String validateEmail() {
   if (client.email == null || client.email.isEmpty || (!client.email.contains("@"))) {
    return "Campo obrigatório";
   }
   return null;
  }
}


========

pub global activate slidy

slidy --version



slidy start
slidy install dio rxdart shared_preferences
