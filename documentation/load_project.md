# Load LC3 Project to PLC via GitHub Actions

This document explains how to use the `load_project.bat` script and its associated GitHub Actions workflow to load a built logi.CAD 3 project to a target PLC.

## 📂 File Locations

- **Batch Script:** `scripts/load_project.bat`
- **GitHub Actions Workflow:** `.github/workflows/load_project.yml`
- **Log4j Configuration:** `log4j.xml` at project root

## ▶️ Usage

### 1. Manually from Command Line

```bat
scripts\load_project.bat MyProjectName MyConfigurationName MyTargetName
```

This will:
- Use the workspace folder `MyProjectName` in the repository root.
- Load the LC3 project using the specified configuration to the specified target PLC.

### 2. Via GitHub Actions Pipeline

1. Go to the **Actions** tab in your GitHub repository.
2. Select **Load LC3 Project to PLC** workflow.
3. Click **Run workflow**.
4. Enter the workspace folder name in the `project_name` field.
5. Enter the build configuration name (from the `.iecplc` file) in the `configuration_name` field.
6. Enter the target PLC name in the `target_name` field.
7. Run the workflow.

The workflow will execute on a **self-hosted Windows runner** with logi.CAD 3 installed.

## ⚙️ Requirements

- logi.CAD 3 installed and licensed on the self-hosted runner.
- The workspace must already contain the imported and built project.
- The target PLC must be accessible (network, serial, or other connection type as defined in the project).

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
- The `target_name` must match the PLC target as defined in the project configuration.
- Ensure the PLC is powered on and reachable before running the load command.
