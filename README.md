# easyflutter

flutter learning app

## QuickStart

- Install Packages

```bash
flutter packages get
```

- Run

```bash
flutter run
```

## Running Warning

```
allprojects {
    gradle.projectsEvaluated {
        tasks.withType(JavaCompile) {
            options.compilerArgs << "-Xlint:unchecked" << "-Xlint:deprecation"
        }
    }
}


```