@echo off
set LC3Path="C:\Program Files\logi.cals\logiCAD3"

echo === Real LC3 Shutdown ===
java -jar %LC3Path%\util\com.logicals.lc3.command.jar -port 50055 -shutdown
