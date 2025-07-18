part of '../api_client.dart';

enum TokenType { authToken, bearerToken, stripe }

class PublicApiOptions {
  Options get options => Options(
    headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
  );
}

class ProtectedApiOptions {
  ProtectedApiOptions({required this.cacheService, this.tokenType});

  final CacheService cacheService;
  final TokenType? tokenType;

  Future<Options> get options async {
    final bearerToken = await cacheService.bearerToken;
    final authToken = await cacheService.authToken;
    return Options(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (tokenType == TokenType.bearerToken)
          'Authorization': 'Bearer $bearerToken',
        if (tokenType == TokenType.authToken) 'token': authToken,
      },
    );
  }
}
