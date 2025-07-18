part of '../api_client.dart';

class ApiEndpoints {
  ApiEndpoints._();
  static const String baseUrl = 'https://core.rentyard.com';
  static const String stripeBaseUrl = 'https://api.stripe.com';
  // Auth
  static const String login = '/api/v1/auth/login';
  static const String forgotPassword = '/api/v1/auth/forgot-password';
  static const String resetPassword = '/api/v1/auth/reset-password';
  static const String changePassword = '/api/v1/auth/change-password';

  // OTP
  static const String verifyOtp = '/api/v1/otp/verify-otp';
  static const String reSendOtp = '/api/v1/otp/resend-otp';

  // Email change
  static const String emailVerify = '/api/v1/users/send-verification-otp';
  static const String verifyEmailOtp = '/api/v1/users/verify-old-email';

  // User
  static const String createUser = '/api/v1/users/create';
  static String updateUser({required String userId}) =>
      '/api/v1/users/update/$userId';
  static const String updateMyProfile = '/api/v1/users/update-my-profile';
  static const String deleteMyProfile = '/api/v1/users/delete-my-account';
  static String deleteUser({required String userId}) =>
      '/api/v1/users/:$userId';
  static const String getMyProfile = '/api/v1/users/my-profile';
  static String getUserById({required String userId}) =>
      '/api/v1/users/$userId';
  static const String getUsers = '/api/v1/users';

  // Payment
  static const String createSetupIntent = '/api/v1/stripe/create-setup-intent';
  static const String createCustomer = '/v1/customers';
  static String addBankAccount({required String customerId}) =>
      '/v1/customers/:$customerId/sources';
  static const String listCards = '/api/v1/stripe/list-cards';
  static const String setDefaultCard = '/api/v1/stripe/set-default-card';

  // add property
  static const String addProperty = '/api/v1/singlepoparty/create';
  static const String rentAndLease = '/api/v1/rentlease/create-rentAndLease';
  static const String imageUpload = '/api/v1/images/create';
  static const String instituteCreate = '/api/v1/school/create-school';
  static String addPropertyUpdate({required String propertyId}) =>
      '/api/v1/singlepoparty/update/$propertyId';

  // single property
  static const String allSingleProperty = '/api/v1/singlepoparty/all';
  static String allInfoOfSingleProperty({required String propertyId}) =>
      '/api/v1/singlepoparty/get-all-information/$propertyId';
}
