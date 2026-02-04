```dataviewjs
const trackerData = {
    entries: [],
    heatmapTitle: "Produktywność (Deep Work)",
    heatmapSubtitle: "Kategoria #6 z Excela",
    year: 2026,
    intensityScaleStart: 1,
    intensityScaleEnd: 8,
    colorScheme: {
        // Skala żółta/złota
        customColors: ["#fff9c4", "#fff176", "#ffd54f", "#ffb74d", "#ff9800", "#e65100"]
    }
}

// TU JEST KLUCZOWA ZMIANA ŚCIEŻKI:
const PATH = '"02_Private/Daily"'; 
const PARAM = 'productive_hours';

for(let page of dv.pages(PATH).where((p) => p[PARAM])){
    trackerData.entries.push({
        date: page.file.name,
        filePath: page.file.path,
        intensity: page[PARAM],
        content: `${page[PARAM]}h`
    });
}
renderHeatmapTracker(this.container, trackerData);
```

```dataviewjs
const trackerData = {
    entries: [],
    heatmapTitle: "Obowiązki (Praca & Szkoła)",
    heatmapSubtitle: "Work (#5) + School (#4)",
    year: 2026,
    intensityScaleStart: 1,
    intensityScaleEnd: 10,
    colorScheme: {
        customColors: ["#e1f5fe", "#b3e5fc", "#4fc3f7", "#0288d1", "#01579b"]
    }
}
const PATH = '"02_Private/Daily"';
const PARAM = 'work_school_hours';

for(let page of dv.pages(PATH).where((p) => p[PARAM])){
    trackerData.entries.push({
        date: page.file.name,
        filePath: page.file.path,
        intensity: page[PARAM],
        content: `${page[PARAM]}h`
    });
}
renderHeatmapTracker(this.container, trackerData);
```

```dataviewjs
const trackerData = {
    entries: [],
    heatmapTitle: "Waste / Strata czasu",
    heatmapSubtitle: "Kategoria #9",
    year: 2026,
    intensityScaleStart: 1,
    intensityScaleEnd: 6,
    colorScheme: {
        customColors: ["#ffcdd2", "#ef9a9a", "#e57373", "#ef5350", "#d32f2f", "#b71c1c"]
    }
}
const PATH = '"02_Private/Daily"';
const PARAM = 'waste_hours';

for(let page of dv.pages(PATH).where((p) => p[PARAM])){
    trackerData.entries.push({
        date: page.file.name,
        filePath: page.file.path,
        intensity: page[PARAM],
        content: `${page[PARAM]}h`
    });
}
renderHeatmapTracker(this.container, trackerData);
```

```dataviewjs
const trackerData = {
    entries: [],
    heatmapTitle: "Relaks i Hobby",
    heatmapSubtitle: "Kategorie #7 i #8",
    year: 2026,
    intensityScaleStart: 1,
    intensityScaleEnd: 6,
    colorScheme: {
        customColors: ["#f3e5f5", "#e1bee7", "#ba68c8", "#8e24aa", "#4a148c"]
    }
}
const PATH = '"02_Private/Daily"';
const PARAM = 'relax_hobby_hours';

for(let page of dv.pages(PATH).where((p) => p[PARAM])){
    trackerData.entries.push({
        date: page.file.name,
        filePath: page.file.path,
        intensity: page[PARAM],
        content: `${page[PARAM]}h`
    });
}
renderHeatmapTracker(this.container, trackerData);
```

```dataviewjs
const trackerData = {
    entries: [],
    heatmapTitle: "Sen / Sleep",
    heatmapSubtitle: "Godziny snu (Cel: 7-8h)",
    year: 2026,
    intensityScaleStart: 4,
    intensityScaleEnd: 10,
    colorScheme: {
        customColors: ["#c5cae9", "#9fa8da", "#7986cb", "#3949ab", "#1a237e"]
    }
}
const PATH = '"02_Private/Daily"';
const PARAM = 'sleep_hours';

for(let page of dv.pages(PATH).where((p) => p[PARAM])){
    trackerData.entries.push({
        date: page.file.name,
        filePath: page.file.path,
        intensity: page[PARAM],
        content: `${page[PARAM]}h`
    });
}
renderHeatmapTracker(this.container, trackerData);
```

```dataviewjs
const trackerData = {
    entries: [],
    heatmapTitle: "Życie Społeczne (Social)",
    heatmapSubtitle: "Rodzina (#1), Przyjaciele (#2), Partner (#3)",
    year: 2026,
    intensityScaleStart: 1,
    intensityScaleEnd: 6,
    colorScheme: {
        customColors: ["#e8f5e9", "#a5d6a7", "#66bb6a", "#43a047", "#1b5e20"]
    }
}
const PATH = '"02_Private/Daily"';
const PARAM = 'social_hours';

for(let page of dv.pages(PATH).where((p) => p[PARAM])){
    trackerData.entries.push({
        date: page.file.name,
        filePath: page.file.path,
        intensity: page[PARAM],
        content: `${page[PARAM]}h`
    });
}
renderHeatmapTracker(this.container, trackerData);
```