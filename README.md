# VeilByte iOS SDK

Official iOS SDK for the [VeilByte](https://veilbyte.io) platform. Provides authentication, push notification management, and user services for iOS apps.

[![Swift 6.0](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://swift.org)
[![iOS 16+](https://img.shields.io/badge/iOS-16%2B-blue.svg)](https://developer.apple.com/ios/)
[![SPM](https://img.shields.io/badge/SPM-compatible-green.svg)](https://swift.org/package-manager/)

## Installation

Add the SDK to your project via Swift Package Manager:

```
https://github.com/Veilbyte-Platforms/veilbyte-ios-sdk.git
```

Or add it to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/Veilbyte-Platforms/veilbyte-ios-sdk.git", from: "0.1.0")
]
```

### Modules

| Module | Description |
|--------|-------------|
| `VeilByteCore` | Configuration, networking, models, error handling |
| `VeilByteAuth` | Authentication (email, Apple, Google), account management |
| `VeilBytePush` | Push notification device registration and topic subscriptions |

Import only the modules you need:

```swift
import VeilByteCore
import VeilByteAuth
import VeilBytePush
```

## Quick Start

### 1. Configure the SDK

Call `configure()` once at app launch (e.g. in `AppDelegate` or `@main` App init):

```swift
import VeilByteCore
import VeilByteAuth

VeilByte.configure(
    appId: "your-app-id",
    apiKey: "your-api-key"
)
```

### 2. Authentication

```swift
// Email registration
let response = try await VeilByte.auth.register(
    email: "user@example.com",
    password: "securePassword123"
)

// Email login
let response = try await VeilByte.auth.login(
    email: "user@example.com",
    password: "securePassword123"
)

// Apple Sign-In
let response = try await VeilByte.auth.signInWithApple(
    identityToken: identityTokenString,
    authCode: authorizationCodeString
)

// Google Sign-In (pass the id_token from Google SDK)
let response = try await VeilByte.auth.signInWithGoogle(
    idToken: googleIdToken
)

// Get current user
let me = try await VeilByte.auth.getMe()
print(me.user.email, me.profile?.firstName)

// Logout
try await VeilByte.auth.logout()
```

### 3. Push Notifications

```swift
import VeilBytePush

// Register device token (from APNs)
let device = try await VeilByte.push.registerDevice(token: apnsTokenString)

// Subscribe to a topic
try await VeilByte.push.subscribe(topicId: "news")

// Unsubscribe
try await VeilByte.push.unsubscribe(topicId: "news")

// List registered devices
let devices = try await VeilByte.push.getDevices()

// Unregister device
try await VeilByte.push.unregisterDevice(token: apnsTokenString)
```

## API Reference

### VeilByte.auth

| Method | Description |
|--------|-------------|
| `register(email:password:deviceInfo:)` | Create a new account |
| `login(email:password:deviceInfo:)` | Sign in with email and password |
| `signInWithApple(identityToken:authCode:firstName:lastName:deviceInfo:)` | Sign in with Apple |
| `signInWithGoogle(idToken:deviceInfo:)` | Sign in with Google |
| `logout(allDevices:)` | Sign out (optionally from all devices) |
| `getMe()` | Get current user profile |
| `verifyEmail(code:)` | Verify email with code |
| `resendVerificationEmail()` | Resend verification email |
| `requestPasswordReset(email:)` | Request password reset |
| `confirmPasswordReset(token:newPassword:)` | Set new password with reset token |

### VeilByte.push

| Method | Description |
|--------|-------------|
| `registerDevice(token:deviceInfo:)` | Register APNs device token |
| `getDevices()` | List all registered devices |
| `unregisterDevice(token:)` | Remove a device |
| `subscribe(topicId:)` | Subscribe to a push topic |
| `unsubscribe(topicId:)` | Unsubscribe from a push topic |

## Error Handling

All SDK methods throw `VBError`:

```swift
do {
    let response = try await VeilByte.auth.login(email: email, password: password)
} catch let error as VBError {
    switch error {
    case .server(let serverError):
        // API error with code and message
        print(serverError.code, serverError.message)
    case .network(let urlError):
        // Network connectivity issue
        print(urlError.localizedDescription)
    case .refreshFailed:
        // Session expired, redirect to login
        break
    case .unauthorized:
        // Not authenticated
        break
    default:
        print(error.localizedDescription)
    }
}
```

## Token Management

The SDK handles token lifecycle automatically:

- Access and refresh tokens are stored securely in Keychain
- Expired access tokens are refreshed transparently on API calls
- If refresh fails, the SDK throws `.refreshFailed` — your app should redirect to login

## Configuration Options

```swift
VeilByte.configure(
    appId: "your-app-id",
    apiKey: "your-api-key",
    baseURL: URL(string: "https://api.veilbyte.io")!,  // custom API endpoint
    logLevel: .debug  // .none | .error | .warning | .info | .debug
)
```

## Requirements

- iOS 16.0+
- Swift 6.0+
- Xcode 16.0+

## License

Copyright (c) VeilByte. All rights reserved. This SDK is distributed as a closed-source binary.
