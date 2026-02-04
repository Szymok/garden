# 04 - Data Sources & APIs

# Data Sources & API Integration

## Primary Sources

### 1. BZP Poland (Biuletyn Zamówień Publicznych)

**URL**: `https://ezamowienia.gov.pl/mo-client-board/api/notices/`​  
**Access**: Public, no API key required  
**Coverage**: All Polish public procurement above thresholds  
**Update Frequency**: Real-time  
**Format**: JSON

**Key Fields**:

- Notice number (ID)
- Title
- CPV codes (classification)
- Value (amount + currency)
- Submission deadline
- Contracting authority

### 2. TED Europe (Tenders Electronic Daily)

**URL**: `https://api.ted.europa.eu`​  
**Documentation**: https://docs.ted.europa.eu  
**Access**: Public, free for read operations  
**Coverage**: All EU public procurement above EU thresholds (740k+ notices/year)  
**Languages**: All 24 EU languages  
**Format**: JSON, XML (eForms standard)

**Why Important**:

- Foundation for EU expansion
- Standardized format across countries
- Already includes Polish tenders above EU threshold

### 3. Future Sources

- **Czech**: Vestník veřejných zakázek (VVZ)
- **Slovak**: UVO (Úrad pre verejné obstarávanie)
- **German**: TED-DE + Länder portals
- **French**: BOAMP

## Integration Strategy

### Phase 1: Polish MVP

- BZP API only
- TED API prepared but not active

### Phase 2: TED Activation

- Enable TED for Polish tenders (validation)
- Cross-reference BZP vs TED data

### Phase 3: Czech Launch

- Add Czech VVZ API
- TED for Czech tenders above threshold

### Phase 4: Multi-country

- Template-based country addition
- 6 weeks per new country (not 6 months!)

## API Client Architecture
