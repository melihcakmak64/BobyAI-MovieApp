# Build Environments & CI/CD Setup



## Running the App

# Variant A
[![Variant A Short](https://img.youtube.com/vi/q56rS2CoUio/0.jpg)](https://youtube.com/shorts/q56rS2CoUio)

# Variant B
[![Variant B Short](https://img.youtube.com/vi/Ig5Wwzq4wJU/0.jpg)](https://youtube.com/shorts/Ig5Wwzq4wJU)



All of them only tested for android devices

```bash
# Development
flutter run --flavor dev 

# Staging
flutter run --flavor staging 

# Production
flutter run --flavor prod 
```

## Building for Release

```bash
# Android APK
flutter build apk --flavor prod --release

# iOS Archive
flutter build ipa --flavor prod --release
```

## CI/CD Considerations


### Environment Variables

```yaml
env.common:
  TMDB_BEARER_TOKEN=Bearer ey***********
  TMDB_IMAGE_URL=https://api.themoviedb.org/3
```

```yaml
env.dev:
  TMDB_BASE_URL=https://api.themoviedb.org/3
```

```yaml
env.staging:
  TMDB_BASE_URL=https://api.themoviedb.org/3
```
```yaml
env.prod:
  TMDB_BASE_URL=https://api.themoviedb.org/3
```



## Environment Files Structure

The application uses multiple `.env` files to clearly separate common and environment-specific variables:
```
.env.common
.env.dev
.env.staging
.env.prod
```

### File Responsibilities

* **`.env.common`**
   * Variables shared across all environments
   * Example:
      * App name
      * Default timeouts
      * Feature flags
      * Analytics toggles

* **`.env.dev` / `.env.staging` / `.env.prod`**
   * Environment-specific variables
   * Example:
      * API base URLs
      * API keys
      * Logging levels
      * Third-party service credentials

### How Environment Loading Works

At app startup, environment variables are loaded in two steps:

1. `.env.common` is loaded first
2. Based on the active flavor, the corresponding environment file is loaded (`.env.dev`, `.env.staging`, or `.env.prod`)
3. Variables are merged, where flavor-specific values override common ones if duplicated

## Tools Used

- **flutter_flavorizr**: Automated flavor configuration



