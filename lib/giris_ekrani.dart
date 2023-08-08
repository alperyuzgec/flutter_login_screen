import 'package:flutter/material.dart';

class LoginEkran extends StatefulWidget {
  const LoginEkran({super.key});

  @override
  State<LoginEkran> createState() => _LoginEkranState();
}

class _LoginEkranState extends State<LoginEkran> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  bool? checkBoxState = false;
  double sliderDeger = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Center(
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Boş Bırakılamaz';
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return 'Geçerli bir e-posta adresi giriniz';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "E-posta",
                    border: OutlineInputBorder(),
                    helperText: "Buraya E-posta giriniz",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Boş Bırakılamaz';
                    } else if (value.length < 3) {
                      return '3 karakterden kısa olamaz';
                    } else if (value.contains(' ')) {
                      return 'Boşluk bırakılamaz';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: 'Şifre',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.purple,
                      helperText: "Şifre en az 3 karakter"),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Beni Hatırla",
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(width: 110),
                    Checkbox(
                        value: checkBoxState,
                        onChanged: (secildi) {
                          setState(() {
                            checkBoxState = secildi;
                          });
                        })
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 30,
                  width: 200,
                  child: FilledButton(
                    onPressed: () {
                      bool isValid = formKey.currentState!.validate();

                      if (isValid) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                      ;
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                    ),
                    child: Text('Giriş Yap'),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Slider(
                    value: sliderDeger,
                    onChanged: ((yeniDeger) {
                      setState(() {
                        sliderDeger = yeniDeger;
                      });
                    }))
              ]),
            ),
          ),
        ));
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Yapıldı'),
      ),
      body: Center(
        child: Text('Başarılı Giriş'),
      ),
    );
  }
}
