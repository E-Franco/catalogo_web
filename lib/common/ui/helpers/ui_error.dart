enum UIError {
  invalidField,
  requiredField
}

extension UIErrorExtension on UIError {
  String description(String field) {
    switch(this) {
      case UIError.invalidField: return '$field inválido';
      case UIError.requiredField: return '$field é obrigatório';
      default: return 'Erro inesperado, tente novamente mais tarde';
    }
  }
}