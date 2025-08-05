# Create or Modify LC3 Project via GitHub Actions

This document explains how to use the `create_or_modify_project.bat` script and its associated GitHub Actions workflow to create or modify a logi.CAD 3 project.

## 📂 File Locations

- **Batch Script:** `scripts/create_or_modify_project.bat`
- **GitHub Actions Workflow:** `.github/workflows/create_or_modify_project.yml`
- **Log4j Configuration:** `log4j.xml` at project root

## ▶️ Usage

### 1. Manually from Command Line

```bat
scripts\create_or_modify_project.bat MyProjectName
```

This will:
- Create a folder named `MyProjectName` in the **repository root** (if it doesn’t already exist)
- Use that folder as the LC3 workspace
- Create or modify the LC3 project with the same name

### 2. Via GitHub Actions Pipeline

1. Go to the **Actions** tab in your GitHub repository.
2. Select **Create or Modify LC3 Project** workflow.
3. Click **Run workflow**.
4. Enter the desired project name in the `project_name` field.
5. Run the workflow.

The workflow will execute on a **self-hosted Windows runner** with logi.CAD 3 installed.

## ⚙️ Requirements

- logi.CAD 3 installed and licensed on the self-hosted runner.
- `eclipseC`, `logiCAD3.ini`, and `log4j.xml` available in the expected locations.
- `JAVA_HOME` and PATH configured if necessary.

## 📜 Example log4j.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE log4j:configuration SYSTEM "log4j.dtd">
<log4j:configuration xmlns:log4j="http://jakarta.apache.org/log4j/">
    <appender name="CONSOLE" class="org.apache.log4j.ConsoleAppender">
        <layout class="org.apache.log4j.PatternLayout">
            <param name="ConversionPattern" value="[%d{HH:mm:ss}] %-5p %c - %m%n"/>
        </layout>
    </appender>
    <root>
        <priority value="INFO"/>
        <appender-ref ref="CONSOLE"/>
    </root>
</log4j:configuration>
```

## 📝 Notes

- If a project with the same name already exists in the repository root, it will be modified.
- The workspace location will match the project name provided as a parameter.
- Update the `WORKSPACE` variable in the `.bat` file if a different location is required.
