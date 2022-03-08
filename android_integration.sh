pushd android
# # flutter build generates files in android/ for building the app
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/app_test.dart
popd

gcloud auth activate-service-account --key-file=letthinkgrow.json
gcloud --quiet config set project letthinkgrow


gcloud firebase test android run --type instrumentation \
  --app build/app/outputs/apk/debug/app-debug.apk \
  --test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
  --use-orchestrator \
  --results-bucket=gs://staging.letthinkgrow.appspot.com\
  --results-dir=tests/firebase



#run using cmd ./android_integration.sh