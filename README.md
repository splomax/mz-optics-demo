# MZ Optics: demo portfolio

A single-file demo portfolio site for Michael Zimmerman (@mz_optics). It's a pitch, not a production build.

## View it
Open `index.html` in a browser (`open index.html`). It needs no build step or server.

## What's in it
- Hero with a live "drawing machine" animation
- Filterable gallery (Projection / Drawing Machine / Tour Visuals) with a lightbox (arrow keys, Esc)
- Upload demo: drag in images and they show up in the gallery. They stay in the browser tab only and are gone on refresh.
- Rotating quotes section with a grid of more quotes below it
- Process, About, Contact

## Swapping in real art
Put images in `images/` and add `src: "images/file.jpg"` to the matching entry in the `WORK` array in `index.html`.
Entries without a `src` draw a generated placeholder. Quotes are in the `QUOTES` array. All current quotes are placeholders.

## Screenshots
`./scripts/screenshot.sh [out_dir]` saves desktop and phone screenshots using headless Chrome.
