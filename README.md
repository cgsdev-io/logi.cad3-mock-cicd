# logi.CAD 3 CI/CD Automation

This repository provides a complete set of **real** scripts and GitHub Actions workflows to automate build, test, deployment, and maintenance tasks for logi.CAD 3 projects in a CI/CD environment.

## 📌 Purpose

The goal of this repository is to:
- Automate repetitive logi.CAD 3 operations (build, load, rule check, library handling, tests, XML import/export, etc.)
- Enable triggering these operations via GitHub Actions
- Provide consistent CLI usage examples for logi.CAD 3
- Ensure that all operations can be reproduced both locally and on a CI/CD pipeline

---

## ⚙️ Prerequisites

### 1. Self-Hosted Runner
- All workflows are configured with:
  ```yaml
  runs-on: [self-hosted, windows]
  ```
- This means you **must** register a **Windows-based self-hosted runner** in your GitHub repository:
  1. Go to **Settings → Actions → Runners** in your GitHub repository
  2. Add a new runner → Select **Windows**
  3. Follow the installation instructions provided by GitHub
  4. Make sure the runner has the label `windows` (in addition to `self-hosted`)
  5. Keep the runner running (either with `run.cmd` in a terminal or as a Windows service)

### 2. logi.CAD 3 Installation
- Install and license **logi.CAD 3** on the self-hosted runner machine
- Ensure `eclipseC` and `logiCAD3.ini` are available and paths are correctly set
- Place `log4j.xml` at the project root (provided example in documentation)

### 3. Environment Requirements
- Windows OS with Java installed (compatible with logi.CAD 3 version)
- Network access to target PLC (for load operations)
- Correctly imported logi.CAD 3 projects in the workspace before running workflows

---

## 📂 Project Structure

```
.
├── scripts/                     # Batch scripts for each LC3 automation task
│   ├── build_project.bat
│   ├── load_project.bat
│   ├── rulecheck_project.bat
│   ├── library_operations.bat
│   ├── test_block.bat
│   ├── sil_test.bat
│   ├── pil_test.bat
│   ├── export_project_to_xml.bat
│   ├── import_objects_from_xml.bat
│   └── convert_source_to_xmi.bat
│
├── .github/
│   └── workflows/               # GitHub Actions workflows to run scripts
│       ├── build_project.yml
│       ├── load_project.yml
│       ├── rulecheck_project.yml
│       ├── library_operations.yml
│       ├── test_block.yml
│       ├── sil_test.yml
│       ├── pil_test.yml
│       ├── export_project_to_xml.yml
│       ├── import_objects_from_xml.yml
│       └── convert_source_to_xmi.yml
│
├── documentation/               # Documentation for each script
│   ├── build_project.md
│   ├── load_project.md
│   ├── rulecheck_project.md
│   ├── library_operations.md
│   ├── test_block.md
│   ├── sil_test.md
│   ├── pil_test.md
│   ├── export_project_to_xml.md
│   ├── import_objects_from_xml.md
│   └── convert_source_to_xmi.md
│
└── log4j.xml                     # Example logging configuration
```

---

## 🚀 Usage

### Option 1 – Run Locally
Execute scripts directly from the `scripts/` folder:
```bat
scripts\build_project.bat MyProjectName MyConfigurationName
scripts\load_project.bat MyProjectName MyConfigurationName MyTargetName
scripts\rulecheck_project.bat MyProjectName local.iecplc reports report01.mrclog
```

### Option 2 – Run via GitHub Actions
1. Go to the **Actions** tab in your repository
2. Select the desired workflow
3. Click **Run workflow**
4. Fill in the input parameters as prompted
5. Workflow runs on your **Windows self-hosted runner**

---

## 📜 Available Automation Scripts

| Script | Description |
|--------|-------------|
| `build_project.bat` | Builds an LC3 project with a specified configuration |
| `load_project.bat` | Loads the built application into a target PLC |
| `rulecheck_project.bat` | Runs automated rule checking on a project |
| `library_operations.bat` | Builds, deploys, and optionally verifies LC3 libraries |
| `test_block.bat` | Tests a specific block in a library |
| `sil_test.bat` | Runs a Software-in-the-Loop (SiL) test suite |
| `pil_test.bat` | Runs a Processor-in-the-Loop (PiL) test and optionally releases a library |
| `export_project_to_xml.bat` | Exports a project or object to XML format |
| `import_objects_from_xml.bat` | Imports objects from an XML file into a project |
| `convert_source_to_xmi.bat` | Converts IEC source files to XMI format |

---

## 📝 Notes
- All workflows require the project to be already imported into the LC3 workspace
- Configuration names (`-configurationName`) must exactly match names in `.iecplc` files
- Target names (`-targetName`) must match PLC definitions in the project
- Optional parameters in workflows can be left empty; they will be skipped in CLI calls

---

## 📚 Documentation
Detailed documentation for each script and workflow is available in the [`documentation/`](documentation) folder.

```
documentation/
  ├── build_project.md
  ├── load_project.md
  ...
```
Each file includes:
- CLI usage
- Parameter descriptions
- Example GitHub Actions usage
- Requirements
