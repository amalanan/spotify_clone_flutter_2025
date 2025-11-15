plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.spotify_clone_november_2025"
    compileSdk = flutter.compileSdkVersion

    // ✅ استخدم الـ NDK الصحيح المثبّت عندك
    ndkVersion = "29.0.14206865"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // Application ID الخاص بتطبيقك
        applicationId = "com.example.spotify_clone_november_2025"

        // إعدادات Flutter الافتراضية
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // توقيع مؤقت حتى يشتغل الأمر flutter run --release
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // (اختياري) لتفعيل viewBinding إذا احتجت لاحقًا
    buildFeatures {
        viewBinding = true
    }
}

flutter {
    source = "../.."
}
