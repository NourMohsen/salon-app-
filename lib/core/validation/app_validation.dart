
class AppValidation {
  static emailValidation() => (String? email) {
          if (!RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(email!.trim())) {
          return 'البريد الالكتروني غير صحيح';
        }
      };


  static phoneNumberValidation() => (String? phone) {
        if (phone!.isEmpty) {
          return 'برجاء كتابة رقم الجوال';
        } else if (phone.length < 7) {
          return 'رقم الجوال يجب أن يكون على الاقل 7 أرقام';
        } else if (!RegExp(r'^(?:\+9660?|00966|009660?|9660?|0)?5(\d{8})$').hasMatch(phone)) {
          return 'رقم الجوال غير صحيح';
        }
      };



  static nameValidation() => (value) {
    if (value == null || value.isEmpty) {
      return 'برجاء كتابة الاسم بالكامل.';
    }
  };

}
