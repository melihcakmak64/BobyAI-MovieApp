import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("environment")

    productFlavors {
        create("dev") {
            dimension = "environment"
            applicationId = "com.example.movieai.dev"
            resValue(type = "string", name = "app_name", value = "MovieAI Dev")
        }
        create("staging") {
            dimension = "environment"
            applicationId = "com.example.movieai.staging"
            resValue(type = "string", name = "app_name", value = "MovieAI Staging")
        }
        create("prod") {
            dimension = "environment"
            applicationId = "com.example.movieai"
            resValue(type = "string", name = "app_name", value = "MovieAI")
        }
    }
}