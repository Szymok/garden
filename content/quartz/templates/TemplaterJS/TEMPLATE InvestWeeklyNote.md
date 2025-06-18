<%*
const weekNumber = tp.date.now("WW"); // Get current week number
const year = tp.date.now("YYYY");    // Get current year
const title = `${year}-T${weekNumber}`; // Format title as RRRR-TT
await tp.file.rename(title);         // Rename file with generated title
%>
# <% title %>

# Tygodniowa Notatka Inwestycyjna - <% tp.date.now("YYYY-MM-DD") %>

## 1. Obserwacje Rynkowe
- **Wzrosty:** [Aktywa, które wzrosły, np. "Bitcoin wzrósł o 10%"]
- **Spadki:** [Aktywa, które spadły, np. "Akcje XYZ spadły o 5%"]
- **Nowe trendy:** [Co nowego zauważyłeś na rynku, np. "Wzrost zainteresowania ETFami związanymi z zieloną energią"]

---

## 2. Kluczowe Wydarzenia
- **Wydarzenia ekonomiczne:** [Podaj daty i opisy ważnych wydarzeń, takich jak raporty ekonomiczne, decyzje banków centralnych]
- **Zmiany regulacyjne:** [Wszelkie zmiany w przepisach, które mogą wpłynąć na rynek]

---

## 3. Co Obserwować w Następnym Tygodniu
- **Aktywa do obserwacji:** [Wymień aktywa, które mogą wzrosnąć/spaść, np. "Obserwuj akcje ABC, które mają wyniki finansowe w przyszłym tygodniu"]
- **Wydarzenia do śledzenia:** [Podaj daty istotnych wydarzeń]

---

## 4. Refleksje Osobiste
- **Moje emocje:** [Jak się czujesz w związku z inwestycjami? Co wpływa na Twoje decyzje?]
- **Plany na przyszłość:** [Jakie kroki podejmiesz w nadchodzących tygodniach?]