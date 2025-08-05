# Rule Check LC3 Project via GitHub Actions

This document explains how to use the `rulecheck_project.bat` script and its associated GitHub Actions workflow to perform automated rule checking on a logi.CAD 3 project.

## 📂 File Locations

- **Batch Script:** `scripts/rulecheck_project.bat`
- **GitHub Actions Workflow:** `.github/workflows/rulecheck_project.yml`
- **Log4j Configuration:** `log4j.xml` at project root

## ▶️ Usage

### 1. Manually from Command Line

```bat
scripts\rulecheck_project.bat MyProjectName local.iecplc reports report01.mrclog
```

This will:
- Use the workspace folder `MyProjectName` in the repository root.
- Run the rule check on `local.iecplc` within the project.
- Store the report in the `reports` folder as `report01.mrclog`.

### 2. Via GitHub Actions Pipeline

1. Go to the **Actions** tab in your GitHub repository.
2. Select **Rule Check LC3 Project** workflow.
3. Click **Run workflow**.
4. Enter the workspace folder name in the `project_name` field.
5. Enter the PLC object, POU, or folder name in the `object_to_validate` field.
6. Enter the report output directory in the `report_path` field.
7. Enter the report file name in the `report_file` field.
8. Run the workflow.

The workflow will execute on a **self-hosted Windows runner** with logi.CAD 3 installed.

## ⚙️ Requirements

- logi.CAD 3 installed and licensed on the self-hosted runner.
- The workspace must already contain the imported project.
- The `object_to_validate` must exist in the project.

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

- `<OBJECT>` refers to the PLC object, POU, or folder to be validated.
- `<REPORTPATH>` is the directory where the rule check report will be saved (it will be created if it doesn't exist).
- `<REPORTFILE>` is the name of the report file to be generated.
- The `.mrclog` file format is the standard rule check log format for logi.CAD 3.
