#!/bin/bash
#
# Android 14 Dev folder structure for a basic hello app
# sudo pacman -S jdk21-openjdk  gradle
# download android sdk cmdline-tools from android's website in ~/Android/Sdk/
# export ANDROID_HOME="$HOME/Android/Sdk"
# export PATH=$ANDROID_HOME/cmdline-tools/bin:$PATH
# sdkmanager --sdk_root=${ANDROID_HOME} "platform-tools" "platforms;android-34" "build-tools;34.0.0"
# yes | sdkmanager --sdk_root=${ANDROID_HOME} --licenses
#
PROJECT_NAME="HelloWord"
APP_LABEL="helloworld"
PACKAGE_NAME="com.example.helloworld"
# =============================================================================



echo "Setting up Android project: $PROJECT_NAME"

# Create project root directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME" || exit

# Create core project structure
mkdir -p "app/src/main/java/$(echo "$PACKAGE_NAME" | tr '.' '/')"
mkdir -p "app/src/main/res/layout"
mkdir -p "app/src/main/res/values"

# Create setting.gradle
cat <<EOF > settings.gradle
rootProject.name = "$APP_LABEL"
include ':app'
EOF

# Create app/build.gradle
cat <<EOF > app/build.gradle
apply plugin: 'com.android.application'

android {
    namespace '$PACKAGE_NAME'
    compileSdk 34

    lintOptions {
        abortOnError false
        checkReleaseBuilds false
    }

    defaultConfig {
        applicationId "$PACKAGE_NAME"
        minSdk 21
        targetSdk 34
        versionCode 1
        versionName "1.0"
    }
}

dependencies {
    // Add your dependencies here
}

EOF

# Create top-level build.gradle
cat <<EOF > build.gradle
buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath "com.android.tools.build:gradle:8.4.0"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}
EOF


# Create AndroidManifest.xml
cat <<EOF > app/src/main/AndroidManifest.xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">

    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.INTERNET"/>

    <application
        android:icon="@android:drawable/sym_def_app_icon"
        android:label="$APP_LABEL"
        android:roundIcon="@android:drawable/sym_def_app_icon">
        <activity 
            android:name=".MainActivity"
            android:exported="true">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>

</manifest>
EOF


# Create MainActivity.java
cat <<EOF > app/src/main/java/$(echo "$PACKAGE_NAME" | tr '.' '/')/MainActivity.java
package $PACKAGE_NAME;

import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends Activity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        TextView tv = new TextView(this);
        tv.setText("Hello, Android 14!");
        setContentView(tv);
    }
}
EOF

echo "[INFO] Project setup complete in /$PROJECT_NAME."
echo "[CMD]> gradle wrapper             # run once"
echo "[CMD]> ./gradlew assembleDebug    # build"
echo "[CMD]> adb install app/build/outputs/apk/debug/app-debug.apk"
