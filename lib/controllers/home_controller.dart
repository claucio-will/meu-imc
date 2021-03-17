import 'package:rx_notifier/rx_notifier.dart';

class HomeController {
  var age = RxNotifier<int>(0);
  var weight = RxNotifier<int>(0);
  var height = RxNotifier<double>(0);
  var message = RxNotifier<String>('');
  var imcText = RxNotifier<String>('');
  var imcNumber = RxNotifier<String>('');
  var messageWarning = '';

  String calcImc() {
    final heightConvert = height.value / 100;
    final imc = weight.value / (heightConvert * heightConvert);
    if (imc < 18.6) {
      message.value = 'Abaixo do Peso ';
      imcText.value = '18.6 kg/m2';
      imcNumber.value = '${imc.toStringAsPrecision(3)}';
      messageWarning = 'Abaixo';
    } else if (imc >= 18.6 && imc < 24.9) {
      message.value = 'Peso Ideal';
      imcText.value = '18.6 - 24.9 kg/m2';
      imcNumber.value = '${imc.toStringAsPrecision(3)}';
      messageWarning = 'Ideal';
    } else if (imc >= 24.9 && imc < 29.9) {
      message.value = 'Levemente Acima do Peso';
      imcText.value = '24.9 - 29.9 kg/m2';
      imcNumber.value = '${imc.toStringAsPrecision(3)}';
      messageWarning = 'Acima';
    } else if (imc >= 29.9 && imc < 34.9) {
      message.value = 'Obesidade Grau I';
      imcText.value = '29.9 - 34.9 kg/m2';
      imcNumber.value = '${imc.toStringAsPrecision(3)}';
      messageWarning = 'Obesidade I';
    } else if (imc >= 34.9 && imc < 39.9) {
      message.value = 'Obesidade Grau II';
      imcText.value = '34.9 - 39.9 kg/m2';
      imcNumber.value = '${imc.toStringAsPrecision(3)}';
      messageWarning = 'Obesidade II';
    } else if (imc >= 40) {
      message.value = 'Obesidade Grau III';
      imcText.value = '40 kg/m2';
      imcNumber.value = '${imc.toStringAsPrecision(3)}';
      messageWarning = 'Obesidade III';
    }

    return message.value;
  }

  void resetForm() {
    height.value = 0;
    weight.value = 0;
    age.value = 0;
  }

  void increment() {
    weight.value++;
  }

  void decrement() {
    weight.value--;
  }

  void incrementAge() {
    age.value++;
  }

  void decrementAge() {
    age.value--;
  }
}
