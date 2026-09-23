# Task Specification for Coding Agent

## Objective
Extend the existing horoscope chart codebase to support a new chart style and two additional languages.

---

## 1. Add East Indian (Maithili) Chart Style

### Background
The codebase currently supports only **North Indian** and **South Indian** horoscope chart styles. We need to add support for the **East Indian / Maithili** chart style.

### Style Characteristics
- **Popular in:** Andhra Pradesh, parts of Orissa, and Bengal
- **Sign method:** Fixed sign method (same as the South Indian style)
- **Direction:** Charting is drawn **anti-clockwise** (note: this differs from the South Indian style, which is clockwise)
- **Reference asset:** `east_indian.svg` — use this file as the visual/layout reference, including example house numbers

### Requirements
- Implement a new chart renderer for the East Indian style.
- Reuse the fixed-sign logic from the existing South Indian implementation where applicable.
- Override the direction to render anti-clockwise.
- Ensure house numbers match the layout shown in `east_indian.svg`.

---

## 2. Add Language Support

Add localization support for the following languages:
- **Sinhala**
- **Tamil**

### Requirements
- Integrate both languages into the existing i18n / language system.
- Ensure all chart labels (sign names, house numbers, planet names, etc.) are translated appropriately.
- Follow the existing pattern used for other supported languages in the codebase.

---

## 3. Deliverables
1. New East Indian (Maithili) chart style, rendered anti-clockwise with fixed signs, matching `east_indian.svg`.
2. Sinhala language support integrated.
3. Tamil language support integrated.
4. All existing chart styles (North Indian, South Indian) must continue to function without regression.

---

## 4. Acceptance Criteria
- [ ] User can select "East Indian" as a chart style and see a correctly rendered anti-clockwise fixed-sign chart.
- [ ] House numbering matches the example in `east_indian.svg`.
- [ ] User can switch to Sinhala and Tamil languages.
- [ ] All labels in the chart are correctly localized for both new languages.
- [ ] No breaking changes to existing North/South Indian chart rendering.
