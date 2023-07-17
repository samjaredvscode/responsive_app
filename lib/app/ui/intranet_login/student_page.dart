import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_app/app/utils/utils.dart';

class StudentPage extends HookWidget {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final dniController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Alumno'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormFieldBase(
                      labelText: 'DNI',
                      hintText: 'Escriba su DNI',
                      controller: dniController,
                      maxLength: 8,
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                    TextFormFieldBase(
                      labelText: 'Contraseña',
                      hintText: 'Escriba su contraseña',
                      controller: passwordController,
                      maxLength: 18,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        fixedSize: const Size(double.maxFinite, 56),
                      ),
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                          fontSize: text.labelLarge!.fontSize,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
