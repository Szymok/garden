# Warsztaty

Always start to build even in small team and then evolve into the whole company with the DG Framework.

Measure the level of influence and involvement of stakeholder groups in company.

Define correct roles.

Data Lineage should be a descriptions of Data Flows.

Free consultations - Irina Steenbeek

# Konferencja

## Data Management Maturity

---

Ask two questions: Where do we want to be and where are we now?

Understanding the current state and desired future state of data governance is crucial. These questions help in setting a clear vision and identifying gaps that need to be addressed.

How to measure data governance maturity or performance? Both are important.

Measuring data governance maturity involves assessing the current capabilities and performance of data management practices. This helps in identifying areas for improvement and tracking progress over time.

Maturity - definition and what is the object of this measurement?

Maturity refers to the level of sophistication and effectiveness of data governance practices within an organization. The object of this measurement is to evaluate how well data governance processes are implemented and how they contribute to the overall business objectives.

The correct definitions are most important inside the company, not from the books. Everyone in a company needs to speak the same language.

It's essential to have a common understanding and consistent terminology within the organization. This ensures that everyone is aligned and can effectively communicate about data governance practices.

Start to measure data governance maturity:

1. Planning Activities
    
    - Define the scope and objectives of your data governance program.
    - Identify key stakeholders and their roles.
    - Develop a roadmap for implementation.
2. Setting up KPIs
    
    - Establish Key Performance Indicators (KPIs) to measure the effectiveness of data governance.
    - KPIs could include data quality metrics, compliance rates, and user satisfaction.
3. Benchmarking Results
    
    - Compare your data governance practices against industry standards or best practices.
    - Use benchmarking to identify strengths and areas for improvement.

How?

- Use external frameworks.
    
    - Leverage established frameworks such as DAMA (Data Management Association) or DCAM (Data Capability Assessment Model) to guide your data governance efforts.
- Adjust frameworks for your needs.
    
    - Customize these frameworks to fit the specific needs and context of your organization.
- Create your own.
    
    - If existing frameworks do not fully meet your requirements, develop a tailored framework that aligns with your business goals and data governance objectives.

Additional Resources:

- DataCrossroads page: Articles about matching some capabilities of DAMA and DCAM frameworks.
    
    - Explore resources on DataCrossroads to understand how to align different data governance capabilities with established frameworks.

---

# AI by Snowflake

Snowflake Arctic model

REKLAMA

# Open table formats

---

Metadata layer and orchestration to ensure the integrity of shared data with multiple readers and writers.

Open table formats (OTFs) provide a robust metadata layer that manages and orchestrates data access, ensuring data integrity even when multiple users or applications are reading and writing data simultaneously. This is crucial for maintaining consistency and reliability in distributed data environments.

OTF Capabilities

- Time Travel for accessing the data (snapshots)
    
    - Time travel allows users to query historical versions of the data, providing the ability to access and analyze data as it existed at any point in time. This is particularly useful for auditing, debugging, and historical analysis.
- ACID (Atomicity, Consistency, Isolation, Durability)
    
    - OTFs support ACID transactions, ensuring that all data operations are completed successfully and consistently. This guarantees data integrity and reliability, even in complex, distributed environments.
- Schema Evolution
    
    - Schema evolution allows for changes to the data schema without disrupting ongoing operations. This capability supports the addition, modification, or removal of columns, enabling the data model to adapt to changing business requirements.
- Housekeeping
    
    - Housekeeping refers to the maintenance tasks required to manage data efficiently, such as compaction, vacuuming, and cleanup of obsolete data. These tasks help optimize storage and improve query performance.

ETL versus ELT

Open Table Formats (OTFs) will render the distinction between ETL and ELT meaningless.

- The distinction between ETL and ELT mattered when RDBMS engines and data storage were tightly coupled.
    
    - Historically, ETL (Extract, Transform, Load) and ELT (Extract, Load, Transform) approaches were defined by the capabilities and limitations of RDBMS systems. ETL involved transforming data before loading it into the database, while ELT performed transformations after loading the data.
- With OTFs, there is no inherent advantage or distinction between ETL and ELT because the storage of data is no longer "trapped" inside a proprietary RDBMS file system.
    
    - OTFs decouple data storage from processing, allowing transformations to occur at any stage of the data pipeline. This flexibility eliminates the traditional constraints of ETL and ELT, enabling more efficient and scalable data processing.
- Data warehouse or data lake database no longer has an "unfair" advantage in accessing data for processing - may the best engine win!
    
    - With OTFs, data can be accessed and processed by any compatible engine, whether it's a data warehouse, data lake, or other analytics platform. This democratizes data access and allows organizations to choose the best tools for their specific needs.

Legacy ETL Approach: Transformations take place in the compute engine on dedicated ETL servers.

- In the traditional ETL approach, data transformations are performed on dedicated ETL servers before loading the data into the target system. This approach can be resource-intensive and may introduce latency.

Legacy ELT Approach: Transformations take place on the RDBMS servers using SQL execution inside the data warehouse.

- The ELT approach leverages the processing power of the RDBMS to perform transformations after loading the data. This can be more efficient for certain workloads, especially when dealing with large volumes of historical data.

The use of the ELT approach was particularly advantageous when historical data used in transformations could be efficiently accessed via SQL joins between staging tables and data warehouse content (all within the RDBMS).

- ELT is beneficial when the data warehouse can efficiently handle complex SQL joins and transformations, making it easier to integrate and analyze historical data.

External System Analysis: Correcting sentences and adding thoughts to each point in the notes.

- When analyzing external systems, it's important to consider how OTFs can enhance data integration and processing capabilities. By leveraging the advanced features of OTFs, organizations can streamline their data workflows, improve data quality, and gain deeper insights from their data assets.

---

​![1000003050.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/142b1ffa-b5b2-4c5d-af4f-b84f772d476c/1000003050.jpg)​

​![1000003049.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/0986d5f4-b3ec-44fa-8049-7dfe4ad76652/1000003049.jpg)​

​![1000003048.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/770915a7-e242-4950-90eb-a95d8944f350/1000003048.jpg)​

​![1000003047.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/f83e0b9d-1161-4979-a8a1-431cc62f730c/1000003047.jpg)​

# Data Mesh - co warto wiedziec

### Dlaczego się nie udaje?

1. Skomplikowany compliance
    
    - Implementacja Data Mesh wymaga zaawansowanego zarządzania zgodnością z regulacjami. Wiele organizacji napotyka trudności w utrzymaniu spójności i zgodności danych w zdecentralizowanym środowisku, co może prowadzić do problemów prawnych i operacyjnych.
2. Biznes vs IT
    
    - Konflikty między zespołami biznesowymi a IT są częstym problemem. Zespoły biznesowe mogą nie mieć wystarczającej wiedzy technicznej, aby efektywnie zarządzać danymi, podczas gdy zespoły IT mogą nie rozumieć w pełni potrzeb biznesowych. Brak wspólnego języka i celów może prowadzić do niepowodzeń w implementacji Data Mesh.

### Czym jest Data Mesh?

1. Kluczowe są Data Producty
    
    - Data Mesh opiera się na koncepcji Data Productów, czyli paczek danych, które są łatwo konsumowane przez różne zespoły w organizacji. Każdy Data Product jest zarządzany jako produkt, z jasno określonymi właścicielami, którzy są odpowiedzialni za jego jakość i dostępność.
2. Kontrola nad danymi odpowiedniemu działowi - biznesowi
    
    - W Data Mesh odpowiedzialność za dane jest przenoszona na zespoły biznesowe, które najlepiej rozumieją kontekst i wartość danych. Zespoły te zarządzają swoimi danymi i procesami przetwarzania, co pozwala na szybsze i bardziej efektywne wykorzystanie danych w codziennych operacjach.

### Kluczowe Wyzwania i Rozwiązania

1. Budowanie solidnej podstawy dla sukcesu Data Mesh
    
    - Wyzwanie: Ryzyko tworzenia silosów danych, szczególnie gdy różne części biznesu korzystają z różnych usług chmurowych.
    - Rozwiązanie: Wprowadzenie wspólnej warstwy udostępniania danych, która umożliwia łatwe odkrywanie i konsumpcję danych przez różne zespoły, niezależnie od technologii, na której są one przechowywane.
2. Ustanowienie rygorystycznych środków kontroli jakości
    
    - Wyzwanie: Różne zespoły mogą mieć różne priorytety i terminologię, co może prowadzić do problemów z jakością danych.
    - Rozwiązanie: Wprowadzenie kontraktów danych, które definiują oczekiwania dotyczące jakości danych i zapewniają, że zmiany w danych nie wpłyną negatywnie na ich konsumentów.
3. Zmiana kulturowa
    
    - Wyzwanie: Brak zarządzania zmianą i brak kulturowego dostosowania mogą prowadzić do oporu wobec nowego modelu.
    - Rozwiązanie: Promowanie kultury współpracy i ciągłego uczenia się, a także zapewnienie, że wszyscy interesariusze rozumieją korzyści płynące z Data Mesh.

​![1000003053.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/74c5e0f7-45e0-47d8-b061-c0e395292a10/1000003053.jpg)​

​![1000003054.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/a8e53b9f-c71f-4a48-97a2-35b49ecf82e8/1000003054.jpg)​

​![1000003055.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/5a330037-df7f-4e4d-a024-6ab750c63109/1000003055.jpg)​

​![1000003057.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/61a11075-e07b-4b88-9986-04f5afe4141b/1000003057.jpg)​

# AI u bram - dyskusja

Kto powinien odpowiadac za bezpieczenstwo, miejsce Chief Data Officera?

Ponownie doceniany jest obszar Data Management. Garbage in, garbage out.

# Bez anonimizacji nie ma zaufania - a bez zaufaniai nie ma gospodarki opartej na danych

### Dlaczego anonimizacja danych jest ważna?

---

1. Ochrona prywatności
    
    - Anonimizacja danych jest kluczowa dla ochrony prywatności osób, których dane są zbierane i przetwarzane. Dzięki anonimizacji, dane osobowe są przekształcane w taki sposób, że nie można ich powiązać z konkretnymi osobami, co minimalizuje ryzyko naruszenia prywatności.
2. Zgodność z regulacjami
    
    - Regulacje takie jak GDPR w Europie i CCPA w Stanach Zjednoczonych wymagają, aby organizacje chroniły dane osobowe. Anonimizacja danych pomaga firmom spełniać te wymagania, jednocześnie umożliwiając im korzystanie z danych do celów analitycznych i badawczych.
3. Budowanie zaufania
    
    - Konsumenci są bardziej skłonni do współpracy z firmami, którym ufają, że będą chronić ich dane. Efektywna anonimizacja danych może zwiększyć zaufanie konsumentów do praktyk zarządzania danymi w organizacji, co prowadzi do silniejszych relacji z klientami i lepszej reputacji firmy.

### Wyzwania i ograniczenia anonimizacji danych

1. Ryzyko ponownej identyfikacji
    
    - Mimo wysiłków włożonych w anonimizację danych, zawsze istnieje ryzyko, że dane mogą zostać ponownie zidentyfikowane poprzez różne techniki, takie jak ataki łączeniowe czy analizy zaawansowane.
2. Balansowanie prywatności i użyteczności
    
    - Jednym z głównych wyzwań jest znalezienie równowagi między ochroną prywatności a zachowaniem użyteczności danych. Zbyt agresywna anonimizacja może prowadzić do utraty wartości danych dla celów analitycznych.
3. Nowe typy danych
    
    - Pojawienie się nowych typów danych, takich jak dane biometryczne czy dane z urządzeń IoT, stawia dodatkowe wyzwania dla technik anonimizacji, ponieważ te dane często zawierają unikalne identyfikatory, które są trudne do anonimizacji bez utraty ich użyteczności.

### Przyszłość anonimizacji danych

1. Zaawansowane techniki anonimizacji
    
    - Przyszłe badania mogą skupić się na rozwijaniu bardziej bezpiecznych i wydajnych metod anonimizacji, takich jak homomorficzne szyfrowanie, które pozwala na przetwarzanie danych bez ich odszyfrowywania.
2. Integracja z AI i ML
    
    - Integracja technik anonimizacji z AI i ML, takich jak modele generatywne, może pomóc w tworzeniu syntetycznych danych, które zachowują właściwości statystyczne oryginalnych danych, jednocześnie chroniąc prywatność
3. Standaryzacja i regulacje
    
    - Rozwój międzynarodowych standardów i regulacji dotyczących anonimizacji danych może pomóc w zapewnieniu spójności i skuteczności praktyk anonimizacji na całym świecie.

# Paving a path to the GenAI

Reklama

# Wdrożenie GenAI w praktyce

# Ai w służbie jakości danych

## Corrected Sentences and Additional Thoughts

1. Modern Data Quality goes beyond implementing only general data metrics, such as the number of records, median, and average.
    
    - Thought: Data quality measures should be comprehensive and tailored to the specific needs of the organization. General metrics provide a high-level overview but may not capture nuances or domain-specific requirements.
2. Automated metrics should be generated for each column.
    
    - Thought: Automating the generation of metrics for individual columns can streamline the data quality assessment process and ensure consistency across the entire dataset. However, it's essential to define relevant metrics based on the data type, business context, and intended use of each column.
3. Currently, the Vienna Health Insurance Fund does not have standardized data quality checks. They had 9,000 rules and 700 daily reports.
    
    - Thought: Having a large number of rules and reports can be overwhelming and may lead to inefficiencies. A more streamlined approach, with a focus on essential and relevant data quality checks, could improve the effectiveness of the data quality process.
4. The solution: No rules.
    
    - Thought: While eliminating all rules may seem like an extreme approach, it highlights the need for a more intelligent and adaptive data quality framework. Instead of relying solely on predefined rules, organizations could leverage machine learning and artificial intelligence techniques to identify patterns, anomalies, and data quality issues dynamically.

## Additional Thoughts

1. Data quality should be a continuous process, not a one-time effort. As data sources, business requirements, and data usage evolve, the data quality measures and processes should be regularly reviewed and updated to ensure their relevance and effectiveness.
2. Involve domain experts and data consumers in defining data quality measures. Collaboration between technical teams, subject matter experts, and end-users can help identify the most critical data quality dimensions and ensure that the measures align with business needs.
3. Implement a data quality dashboard or reporting system. Visualizing data quality metrics and trends can provide stakeholders with a clear understanding of the current state of data quality and facilitate data-driven decision-making.
4. Establish a data governance framework. A well-defined data governance structure, with clear roles and responsibilities, can help ensure accountability, consistency, and adherence to data quality standards across the organization.
5. Consider integrating data quality checks into the data pipeline. By incorporating data quality checks and validation steps into the data ingestion, transformation, and loading processes, organizations can identify and address data quality issues early, preventing the propagation of low-quality data.
6. Continuously monitor and improve data quality processes. Regularly review the effectiveness of data quality measures, identify areas for improvement, and implement changes based on feedback and evolving requirements.
7. Promote a data-driven culture. Fostering a culture that values data quality and encourages collaboration, transparency, and continuous learning can help organizations maintain high-quality data and make informed decisions.

[1] [https://atlan.com/data-quality-measures/](https://atlan.com/data-quality-measures/)[2] [https://www.informatica.com/resources/articles/data-quality-metrics-and-measures.html](https://www.informatica.com/resources/articles/data-quality-metrics-and-measures.html)[3] [https://www.columbusglobal.com/en/blog/6-steps-to-get-the-best-data-quality-in-your-modern-data-platform](https://www.columbusglobal.com/en/blog/6-steps-to-get-the-best-data-quality-in-your-modern-data-platform)[4] [https://docs.bigeye.com/docs/autometrics](https://docs.bigeye.com/docs/autometrics)[5] [https://docs.lightup.ai/docs/autometrics-1](https://docs.lightup.ai/docs/autometrics-1)[6] [https://www.digna.ai/autometrics](https://www.digna.ai/autometrics)[7] [https://ec.europa.eu/social/BlobServlet?docId=20375&langId=en](https://ec.europa.eu/social/BlobServlet?docId=20375&langId=en)[8] [https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9250059/](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC9250059/)[9] [https://beta.ukdataservice.ac.uk/datacatalogue/studies/study?id=856794](https://beta.ukdataservice.ac.uk/datacatalogue/studies/study?id=856794)

​![1000003063.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/da897ed6-8b10-483a-92ff-8b6f47722273/1000003063.jpg)​

​![1000003064.jpg](https://prod-files-secure.s3.us-west-2.amazonaws.com/54f03882-7562-4500-9873-1e0f3667e60f/43afcace-658c-4a66-85bd-9f34e636ae52/1000003064.jpg)​

Aktualnie wiedeńska kasa chorych nie posiada standardowych data Quality Check. Mieli 9000 rules i 700 raportów dziennie. Rozwiązaniem - no rules.

# Key Ai patterns for improved data quality

The 1-10-100 rule is a concept used in data quality management to prioritize and allocate resources effectively for addressing data quality issues. It suggests that the cost of fixing a data quality problem increases exponentially as it moves through different stages of the data lifecycle. Here's an explanation of the 1-10-100 rule:

1. At the source (1x): Addressing a data quality issue at the source or during data entry is the most cost-effective approach. It costs the least amount of effort and resources to fix an error or inconsistency when it is first introduced into the system.
2. During data processing (10x): If a data quality issue is not caught at the source, it becomes more expensive (approximately 10 times more) to identify and correct it during the data processing stage, such as data integration, transformation, or loading.
3. After data is used (100x): If a data quality problem remains unresolved and propagates further, it becomes significantly more costly (approximately 100 times more) to fix it after the data has been used for analysis, decision-making, or other business processes. Correcting errors at this stage may require extensive rework, system updates, and potentially undoing incorrect decisions or actions taken based on the flawed data.

The 1-10-100 rule highlights the importance of addressing data quality issues as early as possible in the data lifecycle. By implementing robust data quality checks and validation processes at the source and during data processing, organizations can save substantial time, effort, and costs compared to fixing issues after the data has been used for critical business operations.

Artificial Intelligence (AI) and Machine Learning (ML) techniques can play a crucial role in addressing data quality issues at each stage of the 1-10-100 rule:

1. At the source: AI can be used for automated data validation, anomaly detection, and real-time data cleansing during data entry or collection, preventing errors from entering the system in the first place.
2. During data processing: ML models can be trained to identify and correct common data quality issues, such as inconsistent formats, missing values, or duplicates, during data integration and transformation processes.
3. After data is used: AI algorithms can analyze historical data patterns, identify potential data quality issues, and provide recommendations for preventive measures or corrective actions before the data is used for critical business processes.

By leveraging AI and ML techniques throughout the data lifecycle, organizations can proactively identify and address data quality issues, reducing the overall cost and effort required to maintain high-quality data.

[1] [https://www.dataversity.net/12-key-ai-patterns-for-improving-data-quality-dq/](https://www.dataversity.net/12-key-ai-patterns-for-improving-data-quality-dq/)[2] [https://www.xenonstack.com/blog/how-generative-ai-can-improve-data-quality](https://www.xenonstack.com/blog/how-generative-ai-can-improve-data-quality)[3] [https://shelf.io/blog/data-quality-in-ai-implementations/](https://shelf.io/blog/data-quality-in-ai-implementations/)[4] [https://blog.treasuredata.com/blog/2023/06/13/ai-ml-data-quality/](https://blog.treasuredata.com/blog/2023/06/13/ai-ml-data-quality/)[5] [https://www.plauti.com/guides/data-quality-guide/revolutionizing-data-quality](https://www.plauti.com/guides/data-quality-guide/revolutionizing-data-quality)

# Data Harvesting - jak zrobić encyklopedię ze starych gazet

Sprzedaż baz danych historykiem, przetwarza starsze dzienniki zcyfryzowane. Wikipedia i polska encyklopedia zawiera około 30 tys nazwisk.

[nekrologia.wielcy.pl](http://nekrologia.wielcy.pl)

Biblioteki cyfrowe

Płeć a wymieranie. Zmiany struktury wieku umierajacych według polskich nekrologow prasowych z lat 1845-1939

Wziął wszystkie protokoły z sejmu czteeoletniego i api open Ai pomogło i do myślało się co tam powinno być. Lepiej niż ocr. Sejm wielki peel.

## Data Harvesting - jak zrobić encyklopedię ze starych gazet

Data harvesting, czyli zbieranie i przetwarzanie danych z różnych źródeł, może być skutecznym sposobem na tworzenie encyklopedii lub baz wiedzy na podstawie starych gazet i innych historycznych materiałów. Oto kilka kluczowych punktów dotyczących tego procesu:

### Źródła danych

1. Zdigitalizowane archiwa prasowe: Wiele bibliotek i instytucji udostępnia zdigitalizowane archiwa starych gazet i czasopism. Są one cennym źródłem informacji historycznych, biograficznych i faktograficznych.
2. Biblioteki cyfrowe: Inicjatywy takie jak Europeana, Google Books czy Polona oferują dostęp do milionów zdigitalizowanych książek, czasopism i dokumentów, które mogą stanowić bogate źródło danych.
3. Nekrologi i biografie: Strony takie jak [nekrologia.wielcy.pl](http://nekrologia.wielcy.pl/) gromadzą nekrologi i biografie znanych postaci, które można wykorzystać do budowy bazy danych biograficznych.

### Ekstrakcja danych

1. Optyczne rozpoznawanie znaków (OCR): Techniki OCR pozwalają na konwersję zeskanowanych dokumentów na tekst, który można następnie przetwarzać i analizować. Jednak OCR może mieć ograniczenia w przypadku starych lub uszkodzonych materiałów.
2. Przetwarzanie języka naturalnego (NLP): Zaawansowane algorytmy NLP, takie jak te oferowane przez OpenAI, mogą pomóc w lepszym zrozumieniu i interpretacji treści zawartych w starych dokumentach, poprawiając jakość ekstrakcji danych.
3. Uczenie maszynowe: Modele uczenia maszynowego mogą być przeszkolone do automatycznego rozpoznawania i klasyfikowania informacji w tekstach, co znacznie przyspiesza proces ekstrakcji danych.

### Organizacja i prezentacja danych

1. Bazy danych biograficznych: Zebrane dane biograficzne można zorganizować w formie bazy danych lub encyklopedii online, zawierającej informacje o życiu i osiągnięciach znanych postaci historycznych.
2. Encyklopedie tematyczne: Dane mogą być również wykorzystane do tworzenia encyklopedii tematycznych, np. dotyczących historii regionu, wydarzeń historycznych lub dziedzin nauki.
3. Wizualizacje i analizy: Zgromadzone dane można poddać analizom i wizualizacjom, aby odkryć ciekawe wzorce i trendy, np. zmiany struktury wieku umierających według nekrologów prasowych z różnych okresów.
4. Otwarte zasoby wiedzy: Zebrane dane mogą być udostępniane jako otwarte zasoby wiedzy, przyczyniając się do rozwoju nauki i edukacji.

Data harvesting ze starych gazet i archiwów jest procesem żmudnym, ale może dostarczyć cennych informacji historycznych i biograficznych, które inaczej mogłyby zostać zapomniane. Dzięki nowoczesnym technologiom, takim jak OCR, NLP i uczenie maszynowe, proces ten staje się coraz bardziej wydajny i dokładny.

# Łatwiej prosić o wybaczenie niż o pozwolenie", czyli innowacje w czasach genAI

Gardner Frames of mind

## LLMOps - Operacje na Modelach Wielkojęzykowych

LLMOps (Large Language Model Operations) to nowy paradygmat skupiający się na zarządzaniu operacyjnym dużymi modelami językowymi (LLM) w środowiskach produkcyjnych. Obejmuje on praktyki, techniki i narzędzia umożliwiające efektywny rozwój, wdrażanie i utrzymanie LLM, a także ograniczanie związanego z nimi ryzyka i maksymalizację korzyści.

### Kluczowe aspekty LLMOps

### Cykl życia LLM

LLMOps obejmuje cały cykl życia LLM, od gromadzenia danych po wdrożenie modelu i generowanie wyników. Kluczowe etapy to:

1. Gromadzenie i przygotowanie danych: Zebranie różnorodnych danych tekstowych reprezentujących domenę i zadanie LLM, zapewnienie jakości, różnorodności i przydatności danych.
2. Opracowywanie podpowiedzi wejściowych: Tworzenie skutecznych podpowiedzi, które pozwolą uzyskać pożądane wyniki z LLM, wykorzystując kreatywność i eksperymentowanie.
3. Dostosowywanie modeli: Dostosowanie wstępnie wytrenowanych LLM do określonych domen poprzez wybór odpowiednich danych, hiperparametrów i metryk oraz unikanie nadmiernego lub niedopasowania.
4. Wdrażanie w produkcji: Wysyłanie dopracowanych LLM do produkcji, zapewniając skalowalność, bezpieczeństwo i kompatybilność ze środowiskiem świata rzeczywistego.
5. Monitorowanie i aktualizacja: Śledzenie wydajności LLM i aktualizowanie ich o nowe dane w miarę ewolucji domeny i zadania.
6. Etyka i odpowiedzialność: Ustanowienie polityki etycznej stosowania LLM, przestrzeganie norm prawnych i społecznych oraz budowanie zaufania wśród użytkowników i interesariuszy.

### Najlepsze praktyki LLMOps

Skuteczne LLMOps opierają się na solidnym zestawie najlepszych praktyk, takich jak:

- Kontrola wersji: Śledzenie zmian w danych, kodzie i modelach oraz zarządzanie nimi.
- Eksperymentowanie: Testowanie i ocena różnych wersji danych, kodu i modeli w celu znalezienia optymalnej konfiguracji.
- Automatyzacja: Automatyzacja i orkiestracja różnych zadań i przepływów pracy związanych z cyklem życia LLM.
- Monitorowanie: Gromadzenie i analizowanie wskaźników oraz informacji zwrotnych związanych z wynikami, zachowaniem i wpływem LLM.
- Alerty: Konfigurowanie i wysyłanie alertów oraz powiadomień na podstawie zebranych wskaźników i informacji zwrotnych.
- Zarządzanie: Ustanawianie i egzekwowanie polityk, standardów i wytycznych dotyczących etycznego i odpowiedzialnego korzystania z LLM.

### Narzędzia i platformy LLMOps

Organizacje muszą korzystać z różnych narzędzi i platform, które mogą wspierać i ułatwiać LLMOps, takich jak:

- OpenAI: Firma badawcza oferująca usługi i modele LLM, w tym GPT-4, DALL-E, CLIP i DINOv2, oraz API wspierające ramy odpowiedzialnej sztucznej inteligencji.
- Hugging Face: Platforma do tworzenia, wdrażania i zarządzania modelami LLM, oferująca narzędzia do trenowania, ewaluacji i hostingu modeli.
- Weights & Biases: Narzędzie do śledzenia eksperymentów, monitorowania i zarządzania modelami LLM, umożliwiające wizualizację i porównywanie wyników.

### Korzyści i wyzwania LLMOps

### Korzyści

- Zwiększona wydajność: LLMOps zapewnia niezbędną infrastrukturę i narzędzia usprawniające rozwój, wdrażanie i utrzymanie LLM.
- Obniżone koszty: LLMOps oferuje techniki zmniejszania mocy obliczeniowej i pamięci wymaganej dla LLM bez pogarszania ich wydajności.
- Zarządzanie ryzykiem: LLMOps pomaga łagodzić ryzyko związane z LLM, takie jak generowanie niedokładnych, stronniczych lub szkodliwych wyników.
- Maksymalizacja korzyści: LLMOps umożliwia pełne wykorzystanie potencjału LLM w różnych rzeczywistych zastosowaniach i dziedzinach.

### Wyzwania

- Wymagania obliczeniowe: LLM wymagają dużej mocy obliczeniowej i pamięci masowej do trenowania i wdrażania.
- Jakość danych: LLM potrzebują ogromnych ilości wysokiej jakości danych, co może podnieść problemy związane z prywatnością i etyką.
- Ocena i moderacja: Wyniki generowane przez LLM mogą być niedokładne, stronnicze lub szkodliwe, wymagając dokładnej oceny i moderacji.
- Wiedza specjalistyczna: LLMOps wymaga dużej wiedzy specjalistycznej, zasobów i koordynacji między różnymi zespołami i etapami.

# Notes

- Book James Serra Different Types of Data Architectures
- Wdrażanie DG od zera, wskazówki od każdego
- Visa-konkursy kaggle

# To-do

# PDF