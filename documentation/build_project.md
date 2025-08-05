# Build LC3 Project via GitHub Actions

This document explains how to use the `build_project.bat` script and its associated GitHub Actions workflow to build a logi.CAD 3 project for a specific configuration.

## 📂 File Locations

- **Batch Script:** `scripts/build_project.bat`
- **GitHub Actions Workflow:** `.github/workflows/build_project.yml`
- **Log4j Configuration:** `log4j.xml` at project root

## ▶️ Usage

### 1. Manually from Command Line

```bat
scripts\build_project.bat MyProjectName MyConfigurationName
```

This will:
- Use the workspace folder `MyProjectName` in the repository root.
- Build the LC3 project using the specified configuration (as defined in its `.iecplc` PLC object file).

### 2. Via GitHub Actions Pipeline

1. Go to the **Actions** tab in your GitHub repository.
2. Select **Build LC3 Project** workflow.
3. Click **Run workflow**.
4. Enter the workspace folder name in the `project_name` field.
5. Enter the build configuration name (from the `.iecplc` file) in the `configuration_name` field.
6. Run the workflow.

The workflow will execute on a **self-hosted Windows runner** with logi.CAD 3 installed.

## ⚙️ Requirements

- logi.CAD 3 installed and licensed on the self-hosted runner.
- The workspace must already contain the imported project.
- The configuration name must match exactly as defined in the `.iecplc` file.

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

- The `configuration_name` must match exactly the `CONFIGURATION` name in the `.iecplc` PLC object file.
- If multiple `.iecplc` files exist, choose the correct one for your target.
- Update the `WORKSPACE` variable in the `.bat` file if a different location is required.
