# Library Operations (Build/Deploy/Verify) via GitHub Actions

This document explains how to use the `library_operations.bat` script and its associated GitHub Actions workflow to build, deploy, and optionally verify a logi.CAD 3 library.

## 📂 File Locations

- **Batch Script:** `scripts/library_operations.bat`
- **GitHub Actions Workflow:** `.github/workflows/library_operations.yml`
- **Log4j Configuration:** `log4j.xml` at project root

## ▶️ Usage

### 1. Manually from Command Line

```bat
scripts\library_operations.bat MyProjectName MyLibraryDef.lc3lib MyLib__1.0.0 "C:\deploy\folder" "C:\libs\MyLib__1.0.0.zip" true
```

This will:
- Build `MyLib__1.0.0` using `MyLibraryDef.lc3lib`
- Deploy it to `C:\deploy\folder`
- Verify it against the ZIP at `C:\libs\MyLib__1.0.0.zip`

### 2. Via GitHub Actions Pipeline

1. Go to the **Actions** tab in your GitHub repository.
2. Select **Library Operations (Build/Deploy/Verify)** workflow.
3. Click **Run workflow**.
4. Enter the required parameters (`project_name`, `library_definition_name`).
5. Optionally enter `library_name_version`, `lib_deploy_to`, `full_library_name`, and `enable_lib_check`.
6. Run the workflow.

The workflow will execute on a **self-hosted Windows runner** with logi.CAD 3 installed.

## ⚙️ Requirements

- logi.CAD 3 installed and licensed on the self-hosted runner.
- The workspace must already contain the imported project with a `.lc3lib` definition file.
- Optional parameters can be left empty if not needed.

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

- `library_name_version` follows the pattern `Name__Version`.
- If `enable_lib_check` is set to `true`, verification will be performed using `full_library_name` if provided.
- All optional parameters can be skipped if the operation is not needed.
