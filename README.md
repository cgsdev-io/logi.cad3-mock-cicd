# logiCAD3 Mock & Real CI/CD Pipeline

This repository demonstrates both a **simulated** and **real** CI/CD pipeline setup for [logi.CAD 3](https://www.logicals.com/en/products/logi-cad-3/),
a model-based engineering tool used in industrial and automotive PLC software development.  
It shows how build, test, and shutdown steps can be automated using GitHub Actions and `.bat` scripts.

---

## 🎯 Purpose

- Provide a **CI/CD structure** for logi.CAD 3 environments
- Demonstrate the **difference between simulation and real execution**
- Showcase integration with **GitHub Actions**

---

## 📁 Project Structure

```
.
├── .github/
│   └── workflows/
│       ├── ci_simulate.yml               # Simulated CI (no license needed)
│       └── ci_real.yml                   # Real CI (requires LC3 installation & license)
├── scripts/
│   ├── build_simulate.bat
│   ├── test_simulate.bat
│   ├── shutdown_simulate.bat
│   ├── build_real.bat
│   ├── test_real.bat
│   └── shutdown_real.bat
├── vendor/
│   └── lc3_examples/                     # Submodule: com.logicals.lc3.examples
│       └── BasicProject/
├── README.md

```

---

## 🚀 How It Works

Both pipelines operate on [logicals-gmbh/com.logicals.lc3.examples](https://github.com/logicals-gmbh/com.logicals.lc3.examples), an official vendor repository.

### 🧪 Simulated CI

Simulates logi.CAD 3 commands **without requiring a license or installed LC3 software**.

Uses:
- `scripts/build_simulate.bat`
- `scripts/test_simulate.bat`
- `scripts/shutdown_simulate.bat`
- `.github/workflows/ci_simulate.yml`


---

### ✅ Real LC3 CI

Executes **actual LC3 binaries** on a licensed system.

Uses:
- `scripts/build_real.bat`
- `scripts/test_real.bat`
- `scripts/shutdown_real.bat`
- `.github/workflows/ci_real.yml`

To use this:
- Install logi.CAD 3 (e.g., version 3.20.0)
- Ensure binaries like `logiCAD3.exe`, `eclipseC.exe`, and `com.logicals.lc3.command.jar` are in PATH
- A valid license server or local license must be active

## ⚙️ Configuration Notes for Real LC3 CI

To successfully run the `*_real.bat` scripts in your local or CI environment, ensure the following conditions are met:

### 1. ✅ Install logi.CAD 3

Install logi.CAD 3 (version 3.20.0 or compatible) and verify the following executables exist:

- `logiCAD3.exe`
- `eclipseC.exe`
- `com.logicals.lc3.command.jar`

> ℹ️ These are usually located under:  
> `C:\Program Files\logi.cals.LC3_03XXXX\`

---

### 2. 🔧 Update Paths in `.bat` Scripts

If the installation path or project structure is different in your system:

- Edit the following lines in `build_real.bat`, `test_real.bat`, and `shutdown_real.bat`:

```bat
set PROJECTPATH=...
set WORKSPACE=...
set LOGCONFIG=...
```

- Also update the path to `com.logicals.lc3.command.jar` in `shutdown_real.bat` if it's different.

---

### 3. 🛣 Add to PATH and Set JAVA_HOME (if needed)

Make sure the following are accessible:

- Add logi.CAD 3 installation folder to your system `PATH`
- Ensure `JAVA_HOME` is set properly and Java 8+ is installed

```bat
set JAVA_HOME=C:\Program Files\Java\jdk1.8.0_202
set PATH=%JAVA_HOME%\bin;%PATH%
```

---

## 📜 License

This repository is for **demonstration and educational purposes only**.  
The actual usage of logi.CAD 3 depends on licensing and system configuration provided by logi.cals GmbH.

