# Struktura plików graficznych dla strony D-Tech

Aby zachować porządek na stronie (ponieważ będziemy mieli wiele produktów), przygotowałem strukturę folderów w katalogu `img/`. Proszę używać jej przy dodawaniu nowych zdjęć.

Struktura wygląda następująco:

```text
img/
├── brand/                    # Gólne zdjęcia marki (logo docelowo, obrazki z "o nas", tła)
├── Chronos/                  # Zdjęcia dla systemu Chronos
│   ├── hero/                 # Główne zdjęcie do bannera (okrągły zoom) dla Chronos
│   ├── galeria/              # Duże zdjęcia do galerii produktu (popup)
│   └── thumbnails/           # Miniaturki zdjęć z galerii (opcjonalnie, do szybszego ładowania)
├── RadarCapture/             # Zdjęcia dla Radaru Capture
│   ├── hero/                 # Główne zdjęcie do bannera (okrągły zoom) dla Radar Capture
│   ├── galeria/              # Duże zdjęcia do galerii produktu (popup)
│   └── thumbnails/           # Miniaturki zdjęć z galerii (opcjonalnie, do szybszego ładowania)
└── Soteria/                  # W istniejącym folderze Soterii (można również uporządkować w ten sam sposób)
    ├── hero/                 # "Lampy Soteria RGB.png" lub "soteria_main.jpg" (obecne)
    ├── Realizacje/           # Twoja aktualna galeria
    └── ...
```

## Gdzie wrzucać nowe pliki według instrukcji:

1. **Strona główna (index.html):** Prawdopodobnie będzie szukać w `img/brand/` lub podawać ścieżkę do `img/Soteria/hero/` jeśli hero używa wybranego z portfolio.
2. **Dodawanie zdjęcia do banneru:** Gdy będziemy tworzyć stronę produktu np. Chronos (`chronos.html`), poproszę o umieszczenie głównego pliku tła w `img/Chronos/hero/`.
3. **Galerie dla produktów:** Wszystkie sekcje "Zdjęcia Produktu", jakie dodamy na podstronach będą zaczytywały pliki z folderów `galeria/` danego działu (bądź bezpośrednio docelowego podfolderu z `Realizacje/` w przypadku Soterii).

Pozwoli to na lepsze zarządzanie mediami podczas budowania podstron wielu produktów.
