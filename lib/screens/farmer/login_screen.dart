import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_colors.dart';
import '../../routes/app_routes.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/outlined_button.dart';
import '../../widgets/otp_input.dart';
import '../../utils/validators.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _otpSent = false;
  bool _isLoading = false;
  String _otp = '';

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _sendOtp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // TODO: Call AuthService.sendOtp()
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;
      _otpSent = true;
    });
  }

  Future<void> _verifyOtp() async {
    if (_otp.length != 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid 4-digit OTP')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // TODO: Call AuthService.verifyOtp()
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);
  }

  Future<void> _loginAsFarmer() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // TODO: Call AuthService.loginAsFarmer()
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pushNamed(context, AppRoutes.profileForm);
    }
  }

  Future<void> _loginAsAdmin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // TODO: Call AuthService.loginAsAdmin()
    await Future.delayed(const Duration(seconds: 1));

    setState(() => _isLoading = false);

    if (mounted) {
      Navigator.pushNamed(context, AppRoutes.adminLogin);
    }
  }

  void _resendOtp() {
    // TODO: Call AuthService.sendOtp() again
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('OTP resent successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 48),
                  // Logo
                  Center(
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.eco,
                        size: 44,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tagline
                  const Center(
                    child: Text(
                      'Something for the one who gives us food',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Phone Number Input
                  CustomTextField(
                    label: 'Phone Number',
                    hint: 'Enter your 10-digit phone number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: Validators.validatePhone,
                  ),
                  const SizedBox(height: 24),
                  // Get OTP Button
                  PrimaryButton(
                    text: 'Get OTP',
                    onPressed: _sendOtp,
                    isLoading: _isLoading && !_otpSent,
                  ),
                  // OTP Section (visible after OTP sent)
                  if (_otpSent) ...[
                    const SizedBox(height: 32),
                    const Center(
                      child: Text(
                        'Enter the 4-digit code sent to your phone',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // OTP Input
                    OtpInput(
                      length: 4,
                      onCompleted: (otp) {
                        setState(() => _otp = otp);
                      },
                      onChanged: (otp) {
                        setState(() => _otp = otp);
                      },
                    ),
                    const SizedBox(height: 12),
                    // Resend OTP
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _resendOtp,
                        child: const Text(
                          'Resend OTP',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Verify OTP Button
                    PrimaryButton(
                      text: 'Verify OTP',
                      onPressed: _verifyOtp,
                      isLoading: _isLoading,
                    ),
                  ],
                  const SizedBox(height: 24),
                  // Login as Farmer Button
                  PrimaryButton(
                    text: 'Login as Farmer',
                    onPressed: _loginAsFarmer,
                    isLoading: _isLoading,
                  ),
                  const SizedBox(height: 16),
                  // Login as Admin Button
                  CustomOutlinedButton(
                    text: 'Login as Admin',
                    onPressed: _loginAsAdmin,
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
