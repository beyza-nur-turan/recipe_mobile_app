import 'package:flutter/material.dart';
import 'package:loginn/constants.dart';

class ReportError extends StatefulWidget {
  @override
  _ReportErrorState createState() => _ReportErrorState();
}

class _ReportErrorState extends State<ReportError> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _errorMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: usePurple,
        title: Text('Hata Bildir'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hata açıklaması',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _errorMessageController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Lütfen hatayı açıklayın',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen hata açıklamasını girin.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Adınız',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Lütfen adınızı girin',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen adınızı girin.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'E-posta adresiniz',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Lütfen e-posta adresinizi girin',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Lütfen e-posta adresinizi girin.';
                  } else if (!value.contains('@')) {
                    return 'Lütfen geçerli bir e-posta adresi girin.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50.0),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 50), backgroundColor: usePurple),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitForm();
                    }
                  },
                  child: const Text(
                    'Gönder',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    // Hata bildirimini göndermek için kullanılacak kodlar burada yer alacaktır.
    // Örneğin, hata bildirimi API'si aracılığıyla sunucuya gönderilebilir.
    print('Hata Bildirimi: ${_errorMessageController.text}');
    print('Ad: ${_nameController.text}');
    print('E-posta: ${_emailController.text}');
  }
}
