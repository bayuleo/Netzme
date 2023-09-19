mixin class Validation {
  String? repasswordRequired(String? pass, String pass2) {
    if (pass == null) {
      return 'Password wajib diisi';
    } else if (pass.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (pass != pass2) {
      return 'Password tidak sama!';
    } else {
      return null;
    }
  }

  String? passwordRequired(String? pass) {
    final alphaNumeric = RegExp(r'[a-zA-Z0-9]+');
    if (pass == null) {
      return 'Password wajib diisi';
    } else if (pass.isEmpty) {
      return 'Password tidak boleh kosong';
    } else if (!alphaNumeric.hasMatch(pass)) {
      return 'Password harus berisi Huruf dan angka';
    } else if (pass.length < 8) {
      return 'Password minimal 8 Karakter';
    } else {
      return null;
    }
  }

  String? inputRequired(String? value) {
    if (value == null) {
      return 'Wajib diisi';
    } else if (value.isEmpty) {
      return 'Tidak boleh kosong';
    } else {
      return null;
    }
  }

  String? nikRequired(String? value) {
    if (value == null) {
      return 'Wajib diisi';
    } else if (value.isEmpty) {
      return 'Tidak boleh kosong';
    } else if (value.length != 16) {
      return 'Panjang NIK harus 16 karakter';
    } else {
      return null;
    }
  }

  String? nameRequired(String? name) {
    if (name == null) {
      return 'Nama wajib diisi';
    } else if (name.isEmpty) {
      return 'Nama tidak boleh kosong';
    } else {
      return null;
    }
  }

  String? emailRequired(String? email) {
    final emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (email == null) {
      return 'Email wajib diisi';
    } else if (email.isEmpty) {
      return 'Email tidak boleh kosong';
    } else if (!emailRegexp.hasMatch(email)) {
      return 'Email tidak tidak valid!';
    } else {
      return null;
    }
  }

  String? emailOptional(String? pass) {
    final emailRegexp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (pass == null || pass.isEmpty) {
      return null;
    } else if (!emailRegexp.hasMatch(pass)) {
      return 'Email tidak tidak valid!';
    } else {
      return null;
    }
  }
}
