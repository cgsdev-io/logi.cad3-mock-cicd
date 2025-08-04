@echo off
set LC3Path=C:\Program Files\LC3_03014

echo === Simulating LC3 Shutdown ===
echo java -jar "%LC3Path%\util\com.logicals.lc3.command.jar" -port 50055 -shutdown
timeout /t 2 >nul
echo Shutdown simulated successfully.
