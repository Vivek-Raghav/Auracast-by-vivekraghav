## Hey there , My Name is Vivek Raghav (Welcome to my responsive info)

## Flutter Material TextTheme Cheat-Sheet

> **Note:** Sizes are in **sp** (scale-independent pixels).

### 🎨 Display (Big, bold statements)

| Style            | Size | Usage Example            |
|------------------|-----:|--------------------------|
| `displayLarge`   |   57 | Full-screen titles       |
| `displayMedium`  |   45 | Splash / welcome screens |
| `displaySmall`   |   36 | Section-opening headers  |

---

### 📰 Headline (Page & section headings)

| Style              | Size | Usage Example         |
|--------------------|-----:|-----------------------|
| `headlineLarge`    |   32 | Major page titles     |
| `headlineMedium`   |   28 | Sub-page headings     |
| `headlineSmall`    |   24 | Card or panel headers |

---

### ✨ Title (Dialogs, cards, app bars)

| Style            | Size | Usage Example                   |
|------------------|-----:|---------------------------------|
| `titleLarge`     |   22 | Dialog titles, feature cards    |
| `titleMedium`    |   16 | AppBar titles, section subtitles|
| `titleSmall`     |   14 | Tab labels, small captions      |

---

### 📖 Body (Main & secondary text)

| Style            | Size | Usage Example                      |
|------------------|-----:|------------------------------------|
| `bodyLarge`      |   16 | Primary paragraph text             |
| `bodyMedium`     |   14 | Secondary paragraphs, list items   |
| `bodySmall`      |   12 | Fine print, footnotes, image captions|

---

### 🔖 Label (Buttons, form labels, overlines)

| Style            | Size | Usage Example                     |
|------------------|-----:|-----------------------------------|
| `labelLarge`     |   14 | Raised / filled buttons           |
| `labelMedium`    |   12 | Text buttons, form field labels   |
| `labelSmall`     |   11 | Overline text, helper metadata    |

---

#### Material 2 ↔️ Material 3 mapping

| M2 Name        | M3 Equivalent                                   |
|----------------|-------------------------------------------------|
| `headline1…6`  | `displayLarge…small`, `headlineLarge…small`     |
| `subtitle1`    | `titleMedium`                                   |
| `subtitle2`    | `titleSmall`                                    |
| `bodyText1`    | `bodyLarge`                                     |
| `bodyText2`    | `bodyMedium`                                    |
| `caption`      | `bodySmall`                                     |
| `button`       | `labelLarge`                                    |
| `overline`     | `labelSmall`                                    |

*Keep this guide handy whenever you’re styling text in your Flutter app!*