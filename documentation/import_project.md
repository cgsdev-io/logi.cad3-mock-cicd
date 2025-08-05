# Import LC3 Project via GitHub Actions

This document explains how to use the `import_project.bat` script and its associated GitHub Actions workflow to import an existing logi.CAD 3 project into a workspace.

## 📂 File Locations

- **Batch Script:** `scripts/import_project.bat`
- **GitHub Actions Workflow:** `.github/workflows/import_project.yml`
- **Log4j Configuration:** `log4j.xml` at project root

## ▶️ Usage

### 1. Manually from Command Line

```bat
scripts\import_project.bat "C:\path\to\ExistingProject"
```

This will:
- Create a workspace folder in the repository root named after the project folder.
- Import the LC3 project from the given path into that workspace.

### 2. Via GitHub Actions Pipeline

1. Go to the **Actions** tab in your GitHub repository.
2. Select **Import LC3 Project** workflow.
3. Click **Run workflow**.
4. Enter the full path of the existing LC3 project in the `project_path` field.
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

- The workspace folder name will match the last segment of the provided project path.
- If the workspace already exists, the project will be imported into it.
- Update the `WORKSPACE` variable in the `.bat` file if a different location is required.
