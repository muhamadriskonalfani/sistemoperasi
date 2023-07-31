@echo off
setlocal enabledelayedexpansion

:login
    set /p user="Masukan Username   : "

    if %user% == %USERNAME% goto menu

    cls
    echo Inputan Anda Salah . . .
    goto login


:menu
    cls
    color 1F
    echo.
    echo [====================================================]
    echo                    Daftar Menu 
    echo [====================================================]
    echo.
    echo    [1] Penilaian Mahasiswa
    echo    [2] Aplikasi Perhitungan
    echo    [3] Menu Perbaikan Komputer
    echo    [4] Menu Jaringan Komputer
    echo    [5] Menu Aplikasi
    echo    [6] Menu Setting
    echo    [0] Keluar
    echo.
    echo [=====================================================]
    echo.

    set /p pilihan="Pilihan Anda : "

    if %pilihan% == 1 goto penilaian_mahasiswa
    if %pilihan% == 2 goto aplikasi_perhitungan
    if %pilihan% == 3 goto menu_perbaikan_komputer
    if %pilihan% == 4 goto menu_jaringan_komputer
    if %pilihan% == 5 goto menu_aplikasi
    if %pilihan% == 6 goto menu_setting
    if %pilihan% == 0 exit

    goto menu


:penilaian_mahasiswa
    cls
    set /p nim="NIM   : "
    set /p nama="Nama  : "
    set /p kelas="Kelas : "
    set /p prodi="Prodi : "

    cls
    set mata_kuliah[1]=Kewirausahaan                & set sks[1]=2
    set mata_kuliah[2]=Etika Profesi                & set sks[2]=2
    set mata_kuliah[3]=Manajemen Jaringan           & set sks[3]=2
    set mata_kuliah[4]=Sistem Operasi               & set sks[4]=2
    set mata_kuliah[5]=Probabilitas Statistik       & set sks[5]=3
    set mata_kuliah[6]=Manajemen Basis Data         & set sks[6]=3
    set mata_kuliah[7]=Rekayasa Perangkat Lunak     & set sks[7]=3
    set mata_kuliah[8]=Pemrograman Objek            & set sks[8]=4

    :: Menginput nilai
    for /L %%i in (1,1,8) do (
        echo Mata Kuliah  : !mata_kuliah[%%i]!
        echo SKS          : !sks[%%i]!

        set /p nilai[%%i]="Nilai        : "
        echo.
        
        if !nilai[%%i]! geq 81 ( if !nilai[%%i]! leq 100 ( set grade[%%i]=A  & set bobot[%%i]=4.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] )) 
        if !nilai[%%i]! geq 76 ( if !nilai[%%i]! leq 80  ( set grade[%%i]=AB & set bobot[%%i]=3.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 71 ( if !nilai[%%i]! leq 75  ( set grade[%%i]=B  & set bobot[%%i]=3.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 66 ( if !nilai[%%i]! leq 70  ( set grade[%%i]=BC & set bobot[%%i]=2.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 61 ( if !nilai[%%i]! leq 65  ( set grade[%%i]=C  & set bobot[%%i]=2.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 56 ( if !nilai[%%i]! leq 60  ( set grade[%%i]=CD & set bobot[%%i]=1.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 51 ( if !nilai[%%i]! leq 55  ( set grade[%%i]=D  & set bobot[%%i]=1.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 0  ( if !nilai[%%i]! leq 50  ( set grade[%%i]=E  & set bobot[%%i]=0.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))

        set /a total_sks+=sks[%%i]
        set /a total_bobot+=total_bobot[%%i]
        
    )


    ::  Menyimpan teks ke dalam file txt
    cls
    echo. >> %nim%_%nama%.txt
    echo [==================================================================] >> %nim%_%nama%.txt
    echo    Mata Kuliah                     SKS     Nilai   Grade   Bobot     >> %nim%_%nama%.txt
    echo [==================================================================] >> %nim%_%nama%.txt
    echo. >> %nim%_%nama%.txt
    for /L %%i in (1,1,8) do (
        echo    !mata_kuliah[%%i]!    !sks[%%i]!        !nilai[%%i]!      !grade[%%i]!   !bobot[%%i]! >> %nim%_%nama%.txt
    )
    echo. >> %nim%_%nama%.txt
    echo [==================================================================] >> %nim%_%nama%.txt
    echo. >> %nim%_%nama%.txt

    echo    NIM          :  %nim%          >> %nim%_%nama%.txt
    echo    Nama         :  %nama%         >> %nim%_%nama%.txt
    echo    Kelas        :  %kelas%        >> %nim%_%nama%.txt
    echo    Prodi        :  %prodi%        >> %nim%_%nama%.txt
    echo    Total SKS    :  %total_sks%    >> %nim%_%nama%.txt
    echo    Total Bobot  :  %total_bobot%  >> %nim%_%nama%.txt

    set /a ip=%total_bobot%/%total_sks%
    echo    IP           :  %ip%           >> %nim%_%nama%.txt

    echo Data Berhasil Disimpan . . .
    echo.
    pause


    ::  Menampilkan isi file 
    type %nim%_%nama%.txt
    echo.
    pause
    goto menu


:aplikasi_perhitungan
    cls
    echo.
    echo [=====================================================]
    echo                Kalkulator Sederhana
    echo               Ketik [x] Untuk Kembali
    echo [=====================================================]
    echo.

    :loop
        set /p input=
        set /a hasil=%input%
        echo %hasil%
        echo.

        if %input% == x  goto menu
        goto loop


:menu_perbaikan_komputer
    cls
    echo.
    echo [========================================================]
    echo                 Menu Perbaikan Komputer
    echo [========================================================]
    echo.
    echo    [1] Masalah Audio
    echo    [2] Masalah Koneksi Internet
    echo    [3] Masalah Printer
    echo    [4] Masalah Windows Update
    echo    [5] Masalah Koneksi Jaringan Kabel (Ethernet)
    echo    [6] Masalah Bluetooth 
    echo    [88] Kembali    [0] Keluar
    echo.
    echo [========================================================]
    echo.

    set /p perbaikan="Pilihan Anda : "

    if %perbaikan% == 1  start msdt.exe -id AudioPlaybackDiagnostic
    if %perbaikan% == 2  start msdt.exe -id NetworkDiagnosticsWeb
    if %perbaikan% == 3  start msdt.exe -id PrinterDiagnostic
    if %perbaikan% == 4  start msdt.exe -id WindowsUpdateDiagnostic
    if %perbaikan% == 5  start msdt.exe -id NetworkDiagnosticsInbound
    if %perbaikan% == 6  start msdt.exe -id BluetoothDiagnostic
    if %perbaikan% == 88 goto menu
    if %perbaikan% == 0  exit

    goto menu_perbaikan_komputer
    

:menu_jaringan_komputer
    cls
    echo.
    echo [==================================================]
    echo                Menu Jaringan Komputer
    echo [==================================================]
    echo.
    echo    [1] Pengaturan Jaringan
    echo    [2] Tampilkan Alamat IP
    echo    [3] Periksa Koneksi Jaringan
    echo    [4] Periksa Kecepatan Internet
    echo    [88] Kembali     [0] Keluar
    echo.
    echo [==================================================]
    echo.

    set /p jaringan="Pilihan Anda : "

    if %jaringan% == 1  start ms-settings:network
    if %jaringan% == 2  ipconfig & pause
    if %jaringan% == 3  ping -n 4 8.8.8.8 & pause
    if %jaringan% == 4  "C:\speedtest\speedtest.exe" & pause
    if %jaringan% == 88 goto menu
    if %jaringan% == 0  exit

    goto menu_jaringan_komputer


:menu_aplikasi
    cls
    echo.
    echo [==================================================]
    echo                     Menu Aplikasi
    echo [==================================================]
    echo.
    echo    [1] Microsoft Office
    echo    [2] Visual Studio Code
    echo    [3] Google Chrome
    echo    [4] Git Bash
    echo    [5] Notepad
    echo    [6] File Explorer
    echo    [88] Kembali     [0] Keluar
    echo.
    echo [==================================================]
    echo.

    set /p aplikasi="Pilihan Anda : "

    if %aplikasi% == 1  goto microsoft_office
    if %aplikasi% == 2  goto visual_studio_code
    if %aplikasi% == 3  goto google_chrome
    if %aplikasi% == 4  goto git_bash
    if %aplikasi% == 5  goto notepad
    if %aplikasi% == 6  goto file_explorer
    if %aplikasi% == 88 goto menu
    if %aplikasi% == 0  exit

    goto menu_aplikasi

    :microsoft_office
        cls
        echo.
        echo [=================================================]
        echo                Microsoft Office
        echo [=================================================]
        echo.
        echo    [1] Microsoft Word
        echo    [2] Microsoft Power Point
        echo    [3] Microsoft Excel
        echo    [88] Kembali       [0] Exit
        echo.
        echo [=================================================]
        echo.

        set /p microsoft="Pilihan Anda : "

        if %microsoft% == 1  start Winword.exe
        if %microsoft% == 2  start powerpnt.exe
        if %microsoft% == 3  start Excel.exe
        if %microsoft% == 88 goto menu_aplikasi
        if %microsoft% == 0  exit
        
        goto microsoft_office


    :visual_studio_code
        "C:\Users\user\AppData\Local\Programs\Microsoft VS Code\Code.exe"
        goto menu_aplikasi

    :google_chrome
        "C:\Program Files\Google\Chrome\Application\chrome.exe"
        goto menu_aplikasi

    :git_bash
        "C:\Program Files\Git\git-bash.exe"
        goto menu_aplikasi
        
    :notepad
        start Notepad.exe
        goto menu_aplikasi
        
    :file_explorer
        start explorer.exe
        goto menu_aplikasi


:menu_setting
    cls
    echo.
    echo [==================================================]
    echo                     Menu Setting
    echo [==================================================]
    echo.
    echo    [1] Pengaturan Sistem
    echo    [2] Pengaturan Tampilan
    echo    [3] Pengaturan Suara
    echo    [4] Pengaturan Tanggal Dan Waktu
    echo    [5] Shutdown
    echo    [6] Restart
    echo    [88] Kembali     [0] Keluar
    echo.
    echo [==================================================]
    echo.

    set /p setting="Pilihan Anda : "

    if %setting% == 1  start ms-settings:system
    if %setting% == 2  start ms-settings:display
    if %setting% == 3  start ms-settings:sound
    if %setting% == 4  start ms-settings:dateandtime
    if %setting% == 5  shutdown /s /f /t 0
    if %setting% == 6  shutdown /r /t 0
    if %setting% == 88 goto menu
    if %setting% == 0  exit

    goto menu_setting


endlocal