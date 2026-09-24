# Python Libraries for Your Astrology CLI

For your Sri Lankan Vedic Astrology Engine, you can build a polished terminal interface with tables, interactive inputs, charts, and colored output using Python libraries.

Since you want a layout similar to the mockup, I'd separate the solution into:

1. Terminal UI framework — layout, panels, colors, and screen management.

2. Tables — planetary data, Shadvarga, and Dasa information.

3. Inputs — date, time, location, and menu selections.

4. Charts — planetary positions and visual astrology charts.

5. Export — optional PDF, HTML, or image reports.


## 1. Rich — Terminal rendering (Recommended)

![rich · PyPI](https://images.openai.com/static-rsc-4/BN17bGvUr717Fi6mHbWKU3Kur565k5ACWCV4fD-TRsisRJMq-gg6aSko_3Wh2tqXQ-YVBK6Fy3Mk-UHls-NhFITORUkLBLiifO-LsOCU1CaX1yI3GIlFATJ3ASVhUXnYXUpqIzCbAhYI0_PojH7zaxQkuT0DKtcUH1cBhYjCOrs?purpose=inline)

### Rich

Essential

Rich supports colored text, tables, panels, Markdown, progress bars, and styled terminal output.

![](https://www.google.com/s2/favicons?domain=https://rich.readthedocs.io\&sz=32)

Rich 14.1.0 documentation

Use for: Your existing report layout.

|
Feature

|

Support

|
| --- | --- |
|

ANSI colors

|

Yes

|
|

Tables

|

Yes

|
|

Panels / borders

|

Yes

|
|

Markdown rendering

|

Yes

|
|

Progress bars

|

Yes

|
|

Simple inputs

|

Yes

|

Bash

```
pip install rich
```

Example:

Python

Run

```
from rich.console import Console
from rich.table import Table

console = Console()

table = Table(title="Nirayana Table of Houses")

table.add_column("Planet", style="magenta")
table.add_column("Longitude", style="green")
table.add_column("Rasi", style="green")

table.add_row("Chandra", "9°23'49\"", "Mesha")
table.add_row("Ravi", "232°33'32\"", "Vrishchika")

console.print(table)
```

## 2. Textual — Full interactive terminal application

![Python 用の TUI（Text User Interface）フレームワークを探しているなら！「Textual」 - ソフトウェア開発者のための OSS、まとめてみました！](https://images.openai.com/static-rsc-4/De1pJy3T8RGF7qZEaJsJJiC2gh10zSGuwP0xfZebbZo6NiHqTSsLiFr9Um08O3_pEYQ65XSwNZ8Xs_Ig3rupzxMAT5k7BdfiXX3sAW_AUgNd5hjIard1mh0ATZZivZKcgTAaXWQiBn9OzEORSb9DkMAAK7enU8VomPnhzNRNPF4?purpose=inline)

### Textual

Advanced UI

A framework for full interactive terminal applications with layouts, widgets, and events.

![](https://www.google.com/s2/favicons?domain=https://introcs-python.cs.luc.edu\&sz=32)

CS in Python

Use for: A multi-screen astrology application.

You can build:

* Main dashboard

* Birth information input screen

* Tabbed sections

* Scrollable planetary tables

* Keyboard navigation

* Interactive Dasa timeline

* Modal dialogs

Bash

```
pip install textual
```

When to use: If you want the application to behave like a desktop application while remaining inside the terminal.

## 3. prompt_toolkit — Input and keyboard interaction

![Python Prompt Toolkit 3.0 — prompt\_toolkit 3.0.19 documentation](https://images.openai.com/static-rsc-4/ila1KkbJc0M1ig58TbidUxiSqhs0XUMGOjV7VVxmPsN58vfpqIrU_vhY3Pa-lkAF4-uJxSq7PTyZBQ9z-I1UE51Q3TwM_gAKW3Q226GvTCj6b4LJn6fRh0sna2XreLvR6-DEGHNmmPOImadb6nHhGsxNqKNRyW4baX8DH5j_muE?purpose=inline)

### prompt_toolkit

Interactive input and full-screen terminal features

Supports input editing, validation, autocompletion, mouse support, and full-screen applications.

![](https://www.google.com/s2/favicons?domain=https://python-prompt-toolkit.readthedocs.io\&sz=32)

prompt_toolkit 3.0.52 documentation

Use for your astrology input:

* Enter birth date

* Enter birth time

* Select birthplace

* Choose chart type

* Autocomplete city names

* Keyboard-based menus

Bash

```
pip install prompt_toolkit
```

Example:

Python

Run

```
from prompt_toolkit import prompt

name = prompt("Full Name: ")
birth_date = prompt("Birth Date: ")

print(name, birth_date)
```

For a simple prompt, Rich already has input functionality. Use `prompt_toolkit` when you need more advanced interaction.

## 4. plotext — Charts inside the terminal

![Tuesday Tooling: Visualise Data in the Terminal](https://images.openai.com/static-rsc-4/e-4Lsjq5ujlCN7_jyjNhsqGOnOY_Y0Pu2U1iWZ6qV7LmETh5xtprypkVjgv8w7hvmIUZA7Lmd4AmTAsC7hzcFXkZsifZbPdVVxiApVA1AyoUJSrb7PI_TxvL1OeOs2pmqGaMeJIv3-svO9ba4mCU1Q1Y4clKxRGVoKlsiHIw25M?purpose=inline)

### plotext

Terminal-native data visualization

Plotext renders plots in the terminal and supports terminal sizing and streaming plot workflows.

![](https://www.google.com/s2/favicons?domain=https://plotext.readthedocs.io\&sz=32)

plotext 6.1.0 documentation

Use for:

* Dasa duration visualizations

* Planetary longitude comparisons

* Numerical trend charts

* Time-based charts

Bash

```
pip install plotext
```

Example:

Python

Run

```
import plotext as plt

years = [1981, 1990, 2000, 2010, 2020]
values = [1, 3, 5, 4, 8]

plt.plot(years, values)
plt.title("Example Timeline")
plt.show()
```

Note: Plotext is suitable for numerical graphs. For your traditional Rasi / Navamsa grid, I would use custom rendering with Rich or Textual rather than a conventional graphing library.

## 5. Questionary — Interactive menus and selections

![Creating Interactive Command-Line Interfaces with PyInquirer | by Evan Roberts | Medium](https://images.openai.com/static-rsc-4/09WKzbtp3x27MVbIJvm0gnMMfsrAQWTxkJA1M2pnw1ZFRHlMYISTcA-aw3ApEWa1q-tEKLgPxevinFTZz0eSQuUq7mbY3GedgqZhpVQBeAoQtJtN0J7j_dHbWvuOaAEUruqn5SFDDuPOMqHfLP8KDuDdimZrrdmrHg5ZdjGoE5Q?purpose=inline)

### Questionary

User-friendly interactive prompts

A library to consider for interactive CLI questions and selection menus.

Use for:

* Select calculation type

* Select chart

* Choose language

* Confirm actions

* Select from multiple options

Bash

```
pip install questionary
```

This is an optional alternative to Rich prompts or prompt_toolkit.

# Recommended combination

### Rich

Core

Colors, tables, panels, formatting

### Textual

Optional

Full-screen interactive interface

### prompt_toolkit

Advanced input and keyboard controls

### plotext

Numerical charts in the terminal

### Installation

For a Rich-based prototype:

Bash

```
pip install rich
```

For a full interactive Python TUI:

Bash

```
pip install rich textual prompt_toolkit plotext
```

## Important for your existing project

You previously chose C++ for the astrology CLI, and the codebase is already in progress.

So I would not recommend replacing your C++ application with Python solely to obtain this layout.

|
Requirement

|

Python

|

C++ equivalent

|
| --- | --- | --- |
|

Styled terminal output

|

Rich

|

Fmt + ANSI

|
|

Interactive full-screen UI

|

Textual

|

FTXUI

|
|

Keyboard input

|

prompt_toolkit

|

FTXUI / terminal input

|
|

Terminal numerical charts

|

plotext

|

Custom rendering / plotting library

|
|

Astrology grid

|

Custom Rich rendering

|

Custom C++ renderer

|

My suggestion: Keep the astrology calculations and existing C++ codebase. If you're exploring Python as a UI prototype, Rich is the easiest place to start.

The Python library descriptions above are based on the linked documentation. The C++ equivalents are architectural suggestions, not a verified feature-by-feature comparison.


# Multi-Layout CLI Example

Yes — you should use multiple horizontal layouts. This will significantly reduce the height of your report while keeping the important information organized.

Here is a more complete design using your astrology output.

## 1. Recommended overall screen

Target width: 120–160 terminal columns

### VEDA

v2.5.0

Sri Lankan Vedic Astrology Engine

Saturday, 19 September 2026

BIRTH PROFILE

Full Name

Test User

Birth Date

2000-08-17

Birth Place

Ratnapura

CHART REFERENCE

Lagna

Meena

Degree

4°10'11"

Navamsa

Simha

PANCHANGA

Tithi

Pura-Doloswaka -12

Nakshatra

Asvida

Pada

3

Yoga

Parigha

DASA

Starting

Ketu

Period

2y 0m 23d

Reference

Birth

TIME & SOLAR METRICS

Birth Time

14:05:00

Sinhala Time

16:45:24

UT

07:25:00

Sunrise

06:12:50

Sunset

05:47:10

Sidereal

17:52:13

CHAKRA

Gana: Deva

Yoni: Ashva

Linga: Purusha

Naadi: Poorva

Varna: Brahmana

Rajju: Pada

NIRAYANA TABLE OF HOUSES

Planet

Longitude

Rasi

Avastha

Lagna

334°10'11"

Meena

-

Chandra

9°23'49"

Mesha

Upeveshana

Ravi

232°33'32"

Vrishchika

Nidra

... remaining planets ...

LAGNA CHART

ASCII chart area

Meena

NAVAMSA CHART

ASCII chart area

Simha

MAHADASA TIMELINE

├─ Ketu 2000-08-17 → 1984-01-02

├─ Shukra 1984-01-02 → 2004-01-02

├─ Ravi 2004-01-02 → 2010-01-02

├─ Chandra 2010-01-02 → 2020-01-02

└─ Kuja 2020-01-02 → 2027-01-02

\(Q\) Quit \(I\) Input \(C\) Charts \(D\) Dasa \(↑↓\) Navigate

Conceptual responsive dashboard — a visual illustration of how the sections could be organized.

## 2. How to manage the terminal height

The important idea is to use section groups with different layout behaviors.

|
Section

|

Layout

|
| --- | --- |
|

Header

|

Full width

|
|

Birth Profile + Chart Reference

|

2 columns

|
|

Time Metrics + Panchanga

|

2 columns

|
|

Dasa + Hora

|

2 columns

|
|

Chakra

|

Full width, horizontal rows

|
|

Nirayana Table

|

Full width

|
|

Shadvarga

|

Full width

|
|

Charts

|

2 columns

|
|

Timeline

|

Full width

|

Do not force everything into one long vertical list.

## 3. Use different views instead of displaying everything at once

For a large astrology application, consider a navigation system:

```
[1] Summary
[2] Planetary Details
[3] Shadvarga
[4] Charts
[5] Dasa Timeline
[6] Export Report
[Q] Quit
```

The Summary screen can display the compact two-column layout, while the other screens can show full detail.

This gives you two advantages:

* Less scrolling.

* More space for detailed tables and charts.

### Suggested technology

For the multi-layout interface, use Textual + Rich:

* Textual: responsive regions, scrolling, navigation, keyboard input.

* Rich: tables, panels, ANSI styling, and formatted output.

This will allow you to have horizontal panels and a full-screen terminal interface without manually calculating every line in your application.


Yes. There are better ways to display both the Dasa timeline and astrology charts than simply printing ASCII lines manually.

For your project, I would separate the visualizations into two categories:

* Timeline: Use a horizontal, date-scaled timeline with expandable details.

* Astrology charts: Use a custom renderer for the traditional Rasi-style grid, but let a UI library handle layout, borders, and resizing.

You don't need to manually draw every border, color, or screen layout.


## 1. Better Dasa timeline: Horizontal date-scaled view

Instead of listing every Dasa vertically, you can represent each Mahadasa as a horizontal bar proportional to its duration.

### Conceptual example

### MAHADASA TIMELINE

Overview

1981 ─────────────────────────────── 2080

Ketu

1981 – 1984

Shukra

1984 – 2004

Ravi

2004 – 2010

Chandra

2010 – 2020

Kuja

2020 – 2027

Rahu

2027 – 2045

1981

2000

2020

2040

2080

This is a conceptual illustration, not a calculated astronomical timeline. The actual bar widths should be computed from your Dasa dates.

### How to implement

Rich: Build a custom `Text` renderable or use a table containing a bar column. Rich handles the styling and terminal output; your code calculates the date positions.

Textual: Create a custom timeline widget that draws the bars, responds to terminal resizing, and lets the user select a Mahadasa to view its sub-periods. Textual supports custom widgets and Rich renderables inside widgets.

![](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub

I recommend a two-level timeline:

```
Mahadasa Overview
    ↓ Select Mahadasa
Antardasa Timeline
    ↓ Select Antardasa
Pratyantardasa Details
```

This prevents the screen from becoming overcrowded with every sub-period.

## 2. Do we need to manually create the astrology charts?

For traditional Rasi / Navamsa astrology charts: Yes, I recommend a custom renderer.

However, you don't need to manually draw each character every time. Create one reusable chart component that receives planetary data.

### Example: Traditional South Indian chart

![Reading the South Indian Vedic Astrological Chart – Asheville Vedic Astrology](https://images.openai.com/static-rsc-4/1UNa2hu5NRZpdNRvujCK7Yt5W7VVEeAToMa7HwAhbcUCJcTHbACxEre5_u7NntYiFjKMe6OwCBNxDzn9fU_KtReDYtEV8VicDk7QLiyPfnksJkrFSt6ZPK5smCLbb4uzF6NTUBtMBIfls5PwdhDIa7uJEfXA3NKTn_tqcsQJ0oo?purpose=inline)

You can implement the chart using:

|
Option

|

Use

|
| --- | --- |
|

Rich `Table`

|

Basic grid layout, but less flexible for irregular cell content

|
|

Rich `Text` + custom renderer

|

Good for a fixed South Indian grid

|
|

Textual custom Widget

|

Best for interactive, scrollable, resizable charts

|
|

SVG / browser rendering

|

If you later want a web-based or graphical export

|

### Recommended chart architecture

```
ChartRenderer
├── ChartGeometry
│   ├── SouthIndianLayout
│   └── NorthIndianLayout (optional)
├── ChartData
│   ├── Houses
│   ├── Planets
│   └── Rasi positions
└── ChartStyle
    ├── Borders
    ├── Planet colors
    └── Text alignment
```

The same chart data can be reused for:

* Rasi chart

* Navamsa chart

* Hora chart

* Drekkana chart

* Dvadasamsa chart

* Trimshamsa chart

Only the divisional chart calculation and labels change.

## 3. A better choice: Use Textual for the entire application

If you're building a serious interactive CLI, I would use Textual as the main framework and Rich for content rendering.

Textual already supports widgets, layouts, tables, and inputs, and it can use Rich renderables inside widgets.

![](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub

+1

```
Textual App
│
├── Header
│
├── Navigation
│   ├── Summary
│   ├── Planetary Details
│   ├── Divisional Charts
│   └── Dasa Timeline
│
├── Content Area
│   ├── Summary Panels
│   ├── Rich DataTables
│   ├── Custom Chart Widget
│   └── Custom Timeline Widget
│
└── Footer / Keyboard Help
```

### Suggested package installation

Bash

```
pip install textual rich
```

Start with these two packages. Add a plotting library only if you need numerical graphs outside the traditional astrology charts.

## 4. My recommendation for your project

|
Component

|

Recommended implementation

|
| --- | --- |
|

Main application

|

Textual

|
|

Horizontal panels

|

Textual CSS grid / horizontal containers

|
|

Tables

|

Textual `DataTable`

|
|

Dasa timeline

|

Custom Textual widget

|
|

Rasi chart

|

Custom chart renderer

|
|

Colors

|

Rich / Textual styles

|
|

Input forms

|

Textual input widgets

|
|

Export

|

Separate renderer for HTML or PDF

|

The key idea: Your astrology calculation engine should produce structured data. Your UI components should decide how to display that data.

This keeps the calculation logic independent from the terminal layout and makes it easier to change from a terminal application to a web interface later.


Yes, you're right. Your current chart is a compact 3×3 grid, which differs from the traditional Indian astrology chart layouts.

Your screenshot appears to use a custom arrangement of nine large cells, with planetary abbreviations and numbers placed inside. It's readable, but it isn't the conventional South Indian or North Indian chart structure.

## 1. Traditional South Indian chart

![How to Read a Horoscope - Part 1 - Astrologers In Chennai | Tamil Astrologer In Chennai | Astrology Services in Chennai](https://images.openai.com/static-rsc-4/qXgGA7sYKwEc06R_zaJqQbQK7-iL7fSeuTAjjQUKPCJcJ8LM4v2SwCZODgus_Ma_CA_nViaWYry-UTcNwGqMf-2RSZij8vQ8lQ7vz2srsVmgxxOEn-PCGfhwgBA1_aDW1okYMlg_SFVNnZEwbxqcy0heQUYx5YyzsgeVZKNS8vA?purpose=inline)

The South Indian chart generally has:

* A square, 4×4-style grid.

* 12 zodiac-sign compartments arranged in fixed positions.

* A center area that is normally not used as a regular house compartment.

* Planets placed in their respective Rasi compartments.

The zodiac signs remain in fixed locations, while planets are placed in the appropriate sign.

## 2. Traditional North Indian chart

![Astrotalk](https://images.openai.com/static-rsc-4/g-i9RR0g-Fld5nXHyJ-rKj5t9h5Z0C8-U9U_OPwPRTkWdcLL03zLluofS21L2WCop_gCNRVhECHPL381IeT7JihwYhjGBYJhSLBC2ugAC2R8r6iLhoLTtWu0_wxAPFr3FK0MOB5rqeVQKv41YH_A42kZoyXDd4dNipM1I1dGFs4?purpose=inline)

The North Indian chart generally has:

* A diamond-shaped structure.

* 12 houses arranged in a fixed layout.

* Zodiac signs represented by numbers.

* Planets placed within the houses.

The house positions remain fixed, while the zodiac signs change according to the Ascendant.

## 3. What I recommend for your CLI

For your project, I would support two chart styles, rather than forcing all charts into your current 3×3 layout.

![如何看懂自己的南印度/北印度盤 - 命運干安捏 - Medium](https://images.openai.com/static-rsc-4/g9UYLou-g1l9NWC72k76lMAZkzKs-jpTusRorjdLrbrQ93zAdosfqm_oFIO4C-QLk6CpAvu3ePUxFwqGJkOaniSRM8LgXu_NTkWfOLgUW0velCiOtxlFLkrLXZNwjDR5brdE6Nx-BODJnnbeUb1o_KsuFzhx52ETDfFNDkgFj2k?purpose=inline)

### South Indian Style

Recommended

Suitable for a traditional square Rasi and Navamsa presentation.

![Birth Chart | Janma Kundli | Lagna Kundali | Vedic Astrology](https://images.openai.com/static-rsc-4/f-dN0aXhz0glL21ZA9M8DS240PvFkjeBcp0BQwHSHXB5n48CfBB7QO62dsveQF0qTJ6qZlmLoBmo_xTAjZgri30oIcLD9AWv2FN2kMySlSFf7XCLjjYP4xfBJgvQaF4XrHaxf7drVIq8HZdNz_Z72ZDXnNWZae8NnuryNRmpkSo?purpose=inline)

### North Indian Style

Suitable if you want a diamond-shaped Kundli presentation.

### Compact Custom Grid

Your existing 3×3 layout can remain as an optional compact view, but it should be clearly defined as a custom presentation.

### Implementation approach

Create a reusable `ChartRenderer` with different layout strategies:

```
ChartRenderer
│
├── SouthIndianChart
├── NorthIndianChart
└── CompactGridChart
```

All three can use the same underlying planetary data.

One important question: Which traditional chart do you want your application to follow?

### Choose your preferred chart layout

South Indian traditional square chart

North Indian diamond chart

Sri Lankan / Sinhala traditional style

Both South Indian and North Indian styles

Keep the current compact 3×3 design

Continue with selection

