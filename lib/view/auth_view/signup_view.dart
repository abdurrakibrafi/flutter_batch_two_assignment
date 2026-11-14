import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_colors.dart';
import '../../utils/custom_button_widget.dart';
import '../../utils/custom_loader.dart';
import '../../utils/custom_toast_message.dart';
import '../../utils/cutom_text_filed.dart';
import 'controller/signup_controller.dart';
import 'login_view.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final SignupController signupController = Get.put(SignupController());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool obscurePassword = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Join us to manage your tasks efficiently.',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 28),
              CustomTextField(
                label: 'First Name',
                hint: 'Enter your first name',
                controller: firstNameController,
              ),
              const SizedBox(height: 18),
              CustomTextField(
                label: 'Last Name',
                hint: 'Enter your last name',
                controller: lastNameController,
              ),
              const SizedBox(height: 18),
              CustomTextField(
                label: 'Address',
                hint: 'Enter your address',
                controller: addressController,
              ),
              const SizedBox(height: 18),
              CustomTextField(
                label: 'Email Address',
                hint: 'Enter your email',
                controller: emailController,
              ),
              const SizedBox(height: 18),
              CustomTextField(
                label: 'Password',
                hint: 'Enter your password',
                controller: passwordController,
                obscureText: obscurePassword,
                suffixIcon: IconButton(
                  icon: Icon(
                    obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              Obx(() {
                return signupController.isLoading.value
                    ? const Center(child: CustomLoader())
                    : SizedBox(
                        height: 55,
                        width: double.infinity,
                        child: CustomButtonWidget(
                          btnColor: AppColors.primary,
                          onTap: () {
                            final firstName = firstNameController.text.trim();
                            final lastName = lastNameController.text.trim();
                            final address = addressController.text.trim();
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            if (firstName.isEmpty ||
                                lastName.isEmpty ||
                                address.isEmpty ||
                                email.isEmpty ||
                                password.isEmpty) {
                              CustomToast.showToast(
                                "All fields are required",
                                isError: true,
                              );
                            } else if (!email.contains('@')) {
                              CustomToast.showToast(
                                "Invalid email address",
                                isError: true,
                              );
                            } else {
                              signupController.signUp(
                                firstName: firstName,
                                lastName: lastName,
                                address: address,
                                email: email,
                                password: password,
                              );
                            }
                          },
                          iconWant: false,
                          btnText: 'Sign Up',
                        ),
                      );
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 12),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.off(() => const LoginScreen());
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(color: AppColors.primary, fontSize: 12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
