---
title: Bez nazwy
Data: ""
type: event
---
# Abstrakt
# Opinia

# Notes
# UART
Poszukujemy pinów na plytce. ![[images/Pasted image 20240305171758.png]]
Nastepnie miernik ustawiamy na test ciaglosci. Czarny do masy, a czerwony do kazdego z pinow po kolei. Nastepnie przelaczamy na 20 V i sprawdzamy ponownie. Jezeli mamy wynik 3,3 to jest to zasilanie, ktore wykluczamy. Linia RX odpowiada za otrzymywane pakiet y do urzadzenia. Bedzie zawsze miala wartosc 0. Za nadawanie danych z urzadzenia do konwertera odpowiada linia, gdzie wystepuja wahania.
![[images/Pasted image 20240305173220.png]]
Baud rate musi być taki sam dla nadajnika jak i odbiornika! Najczęściej używane prędkości: 110, 300, 600, 1200, 2400, 4800, 9600, 14400, 19200, 38400, 57600, 115200, 128000
Picocom
# Rekonesans
Wiele urządzeń embedded jest wyposażona w specjalną "konsolę", która służy do różnych celów takich jak - debug oprogramowania, różne testy etc.
Co nam to daje? (ludziom z cybersec)
- czasami od razu mamy na urządzeniu shella!
- pomocny w rekonesansie
- ataki na bootloader, pamięć, itp.

Poszukiwanie informacji
FCC

REL - Radio Equipment List

Patenty 
- Google Patents
- USPTO Patent Center (niedawno USPTO Public PAR)

Schematy i karty katalogowe
Strony trzecie 
- openwrt.org

Red Team

# Typy pamieci
- NOR Flash
	- NOR Flash to pamięć nieulotna
	- Szybki odczyt (szybszy od pamięci NAND)
	- Wolniejsze czyszczenie oraz zapis
	- NOR Flash przechowuje ważne dane: firmware, konfiguracje, etc. „to jest dobra wiadomość ;>
Nasz chip flash ma wybraną obudowę (w tym wypadku SOIC8) oraz swoją nazwę. Nazwę możesz odczytać za pomocą lupy albo smartfona Hint: rób zdjęcię pod różnym kątem. Dokumentacja jest w internecie.. albo nie, ALE nie jest to problem :)
### protokól SPI
Full duplex: architektura typu master <-> slave Urządzenie nadrzędne zapewnia sygnał zegara SPI wymaga 4 przewodów do komunikacji 
SCLK - jest to sygnał zegarowy
CS - Chip Select "włącznik" układu SPI
MOSI - Master Out Slave In. Odbiór danych od mastera 
MISO - Master In Slave Out. Wysłanie danych do mastera
- NAND Flash
- eMMC Flash