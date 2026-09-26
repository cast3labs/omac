# Wallpaper review

Omarchy's themes come with 92 wallpapers and 22 preview screenshots. Omarchy
publishes no credits or licenses for them, and many are clearly other people's
work: film stills, famous paintings, stock photos, AI output, fan art. Omac may
redistribute only what it has the right to, so every image was reviewed on
2026-09-26 against Omarchy `2fbac0c8`.

**Result: 22 wallpapers kept, 92 images dropped, including all 22 previews.**
The kept list is `assets/wallpapers-allowed.txt` in Omac's source, and the
build refuses any image that is not on it.

## What happens in the app

- 20 of the 22 themes keep at least one wallpaper: Omarchy's wordmark or logo in
  the theme's colours.
- **Last Horizon** and **Solitude** keep none. Switching to them leaves the
  desktop picture as it was; everything else in the theme still applies.
- Previews are not shown anywhere in Omac, so dropping them changes nothing on
  screen.
- Your own wallpapers are never affected. Put them in
  `~/.config/omac/backgrounds/<theme>/` and they join the theme's cycle.

## The rules

An image was kept only if all of these held:

1. **Nothing identifiable belongs to someone else.** No character, logo, brand,
   readable third-party text, signature, recognizable artwork (even restyled),
   or identifiable person.
2. **And one of these:**
   - **(2a) Too simple to be anyone's creative work** — a flat colour, a gradient,
     or a plain geometric shape or pattern.
   - **(2b) Omarchy's own art** — its wordmark or logo, made in Omarchy's
     repository, in the theme's palette.
3. **Metadata did not point elsewhere.** An image whose file history named a
   stock site, an AI generator (for example a C2PA record naming ChatGPT) or an
   outside artist was dropped.
4. **A preview passes only if everything visible passes**, its wallpaper
   included.
5. **Unsure means drop.**

Each image was checked by one reviewer, from a thumbnail, the full-resolution
original, its file metadata and its git history in Omarchy. **Every KEEP was then
checked by a second reviewer told to find a reason to drop it**; the second
reviewer overturned 5 of them.

## Kept (22)

| Image | What it shows | Why it is safe |
|---|---|---|
| `catppuccin-latte/backgrounds/omarchy.webp` | Blue pixel-art OMARCHY wordmark centred on a plain light-grey background. | 2b: Omarchy wordmark on solid palette color |
| `catppuccin/backgrounds/omarchy.webp` | Light-blue pixel-art OMARCHY wordmark centred on a solid dark navy background. | 2b: Omarchy wordmark on solid palette color |
| `ethereal/backgrounds/omarchy.webp` | Periwinkle pixel-art OMARCHY wordmark centred on a solid very dark navy background. | 2b: Omarchy wordmark on solid palette color |
| `everforest/backgrounds/omarchy.webp` | Teal pixel-art OMARCHY wordmark centred on a solid dark slate background. | 2b: Omarchy wordmark on solid palette color |
| `flexoki-light/backgrounds/1-orb.webp` | A single ordered-dither (Bayer) shaded blob/sphere in black on a flat Flexoki paper-cream background. | 2a: simple shape with plain dither texture |
| `flexoki-light/backgrounds/2-omarchy.webp` | The Omarchy pixel-blackletter wordmark in black, centered on a plain cream background. | 2b: Omarchy's own wordmark on a solid theme color |
| `gruvbox/backgrounds/omarchy.webp` | The Omarchy pixel-blackletter wordmark in teal-green, centered on a flat dark gray Gruvbox background. | 2b: Omarchy's own wordmark on a solid theme color |
| `hackerman/backgrounds/omarchy.webp` | The Omarchy pixel-blackletter wordmark in bright green, centered on a flat near-black Hackerman background. | 2b: Omarchy's own wordmark on a solid theme color |
| `kanagawa/backgrounds/omarchy.webp` | The Omarchy pixel-blackletter wordmark in cream, centered on a flat dark navy Kanagawa background. | 2b: Omarchy's own wordmark on a solid theme color |
| `lumon/backgrounds/omarchy.webp` | The pixel-style 'OMARCHY' wordmark in light blue on a solid dark slate background. | 2b: Omarchy's own wordmark in the theme palette (also 2a: solid color) |
| `lupine/backgrounds/06-omarchy.webp` | The pixel-style OMARCHY wordmark in blue, centered on a plain off-white background. | 2b: Omarchy wordmark on a solid palette color |
| `matte-black/backgrounds/omarchy.webp` | The pixel-style OMARCHY wordmark in orange, centered on a plain near-black background. | 2b: Omarchy wordmark on a solid palette color |
| `miasma/backgrounds/omarchy.webp` | The pixel-style OMARCHY wordmark in olive green, centered on a plain dark grey background. | 2b: Omarchy wordmark on a solid palette color |
| `nord/backgrounds/omarchy.webp` | The pixel-style OMARCHY wordmark in light steel blue, centered on a plain dark slate (Nord) background. | 2b: Omarchy wordmark on a solid palette color |
| `osaka-jade/backgrounds/omarchy.webp` | The pixel-style OMARCHY wordmark in muted green, centered on a solid dark green-black background. | 2b: Omarchy's own art (Omarchy wordmark on solid color) |
| `retro-82/backgrounds/omarchy.webp` | The pixel-font OMARCHY wordmark in orange on a flat dark navy background (716-byte file). | 2b: Omarchy wordmark on solid theme color |
| `ristretto/backgrounds/omarchy.webp` | The pixel-font OMARCHY wordmark in salmon/orange on a flat dark-brown background (716-byte file). | 2b: Omarchy wordmark on solid theme color |
| `rose-pine/backgrounds/omarchy.webp` | The pixel-font OMARCHY wordmark in teal on a flat cream background (716-byte file). | 2b: Omarchy wordmark on solid theme color |
| `tokyo-night/backgrounds/6-oma.webp` | Omarchy's glowing pink circle/square/diamond 'oma' logo centered on a plain dark navy background with faint grain. | 2b: Omarchy's own logo; 2a: plain background |
| `tokyo-night/backgrounds/omarchy.webp` | The pixel-style 'OMARCHY' wordmark in blue on a solid dark background. | 2b: Omarchy wordmark; 2a: solid color |
| `vantablack/backgrounds/omarchy.webp` | The pixel-style OMARCHY wordmark in grey, centered on a solid black background. | 2b: Omarchy wordmark on solid color |
| `white/backgrounds/omarchy.webp` | The pixel-style OMARCHY wordmark in dark grey, centered on a solid white background. | 2b: Omarchy wordmark on solid color |

## Dropped (92)

| Image | What it shows | Why |
|---|---|---|
| `catppuccin-latte/backgrounds/1-color-fade.webp` | Soft pastel gradient of layered wavy bands (peach, pink, lavender, mint). | DROP: metadata points to AI-generator tool |
| `catppuccin-latte/preview.png` | A light-theme desktop screenshot showing a neovim editor, a terminal ls listing, btop and the Nautilus Files window. The pastel wavy wallpaper shows at the edges and gaps. | DROP: visible wallpaper is AI-generated (metadata) + third-party brand names |
| `catppuccin/backgrounds/1-totoro.webp` | Silhouette of Totoro with soot sprites inside a lavender gradient circle on a dark background. | 1: recognizable character (Studio Ghibli's Totoro and soot sprites) |
| `catppuccin/backgrounds/2-waves.webp` | Flowing ribbon of many thin interpolated sine-like lines shading from mauve to blue on a dark navy background. | DROP: detailed vector illustration of unknown authorship |
| `catppuccin/backgrounds/3-blue-eye.webp` | A single blue spirograph/epitrochoid rosette curve with an inner ring of rays, centred on a dark navy background. | Overturned by the second reviewer: The Omarchy PR 1008 body says only "'waves' and 'blue eye' matched to theme background". That means the contributor recoloured existing images and never claimed to have made them. The 'cat-...-mocha' filename is the usual naming for a catppuccinified… |
| `catppuccin/preview.png` | A dark Catppuccin desktop screenshot with neovim, terminal, btop and Files windows over a faint wallpaper; Totoro's silhouette with eyes and whiskers shows through the translucent editor window. | 1: Studio Ghibli character (Totoro) visible in wallpaper |
| `ethereal/backgrounds/1-cosmic.webp` | Detailed digital render of a purple and blue nebula with stars and cloud-like formations. | DROP: detailed illustration/render of unknown authorship |
| `ethereal/backgrounds/2-meadow.webp` | Photograph of a tree silhouetted in fog in a meadow, color-graded blue to pink with a sunrise glow. | DROP: photograph of unknown authorship |
| `ethereal/preview.png` | A dark navy desktop screenshot with neovim, terminal, btop and Files windows, with a starry purple and blue nebula wallpaper showing in the gaps. | DROP: visible wallpaper is a detailed space illustration of unknown authorship |
| `everforest/backgrounds/1-tree-tops.webp` | Muted photograph of a misty, fog-covered conifer forest on a hillside. | DROP: photograph of unknown authorship |
| `everforest/preview.png` | An Everforest dark desktop screenshot with neovim, terminal, btop and Files windows; a misty forest photo wallpaper shows faintly in the gaps and borders. | DROP: visible wallpaper is a photograph of unknown authorship |
| `flexoki-light/preview.png` | Flexoki-light theme screenshot (nvim, btop, terminal, Files) over the 1-orb wallpaper, a single halftone-dithered gradient circle on a cream background. | Overturned by the second reviewer: I checked crops of the full 1800x1012 original, and several things fail rubric rule 1 and the preview rule that 'everything visible passes'. (1) Third-party logo: the inactive nvim tab 'neovim.lua' shows a Nerd Font devicon at about x=330,y=75. It is a… |
| `gruvbox/backgrounds/1-the-backwater.jpg` | A detailed impressionist-style oil painting of a woman in a white dress by a river with a man in a rowing boat. There is a signature at the bottom right. | DROP: detailed painting of unknown authorship / recognizable artwork |
| `gruvbox/backgrounds/2-flower-basket.webp` | A Flemish Baroque still-life oil painting of a wicker basket of flowers and a glass vase of tulips on a table, in the style of Jan Brueghel. | 1: recognizable artwork / DROP: detailed painting of unknown authorship |
| `gruvbox/backgrounds/3-village-square.jpg` | A 17th-century Dutch Golden Age oil painting of a village square with an inn, horses, travellers and a church spire, in the style of Isack van Ostade. | 1: recognizable artwork / DROP: detailed painting of unknown authorship |
| `gruvbox/backgrounds/4-idyllic-procession.jpg` | A Flemish old-master landscape painting of a wooded road with carts, cattle, pigs and peasants, in the style of Jan Brueghel the Elder. There is a small signature at the bottom. | 1: recognizable artwork / DROP: detailed painting of unknown authorship |
| `gruvbox/backgrounds/5-leaves.jpg` | A close-up photograph of green fern fronds. | DROP: photograph of unknown authorship |
| `gruvbox/preview.png` | Gruvbox theme screenshot over a painted landscape/foliage wallpaper (one of the backwater/village/procession paintings), visible through the window gaps and translucency. | DROP: detailed painting/illustration of unknown authorship |
| `hackerman/backgrounds/1-synth-scape.jpg` | A synthwave-style vector illustration of cyan wireframe mountains and a grid floor under a glowing sun on a teal gradient. | DROP: metadata points to stock / copyright notice |
| `hackerman/backgrounds/2-geometric.webp` | An abstract low-poly 'plexus' illustration of cyan triangles and connected lines on a black background. | DROP: detailed illustration of unknown authorship (likely stock) |
| `hackerman/preview.png` | Hackerman theme screenshot over the 1-synth-scape wallpaper, a cyan wireframe-mountains-and-sun render whose glow shows at the window edges. | DROP: stock illustration (metadata: Adobe Illustrator, stock title/keywords) |
| `kanagawa/backgrounds/1-kanagawa.jpg` | Hokusai's woodblock print 'The Great Wave off Kanagawa', with its Japanese title cartouche and signature. | 1: recognizable artwork |
| `kanagawa/preview.png` | Kanagawa theme screenshot over the 1-kanagawa wallpaper, the Great Wave off Kanagawa line art, whose wave curls are visible in the gaps. | 1: recognizable artwork (Hokusai's Great Wave, restyled) |
| `last-horizon/backgrounds/1-eyes-wide.webp` | A detailed painterly close-up of a woman's face with blue-green eyes looking upward, dark hair and light streaks across the cheeks. | DROP: detailed illustration of unknown authorship |
| `last-horizon/backgrounds/2-blink.webp` | A dark cinematic render of a giant bloodshot eye in a stone hall, with a lone cloaked figure standing at the top of some steps. | DROP: detailed illustration/render of unknown authorship |
| `last-horizon/backgrounds/3-bokeh.webp` | Defocused bokeh circles of light in warm and green tones on a dark background. | DROP: photograph of unknown authorship (unsure counts as DROP) |
| `last-horizon/backgrounds/4-new-horizons.jpg` | A digital illustration of a lone figure on a teal dune in front of a huge red-orange sun and a second planet, with a flock of birds and a starry purple sky. | DROP: detailed illustration of unknown authorship |
| `last-horizon/preview.png` | Last Horizon theme screenshot (2880x1800) over a blurred photographic wallpaper showing skin and a face (the 'eyes-wide' image) behind the windows. | DROP: photograph of unknown authorship / possibly identifiable person |
| `lumon/backgrounds/01-united-in-severance.webp` | The Lumon globe logo and wordmark from the TV show Severance on a dark teal gradient, with horizontal lines and the tagline 'UNITED IN SEVERANCE'. | 1: Lumon logo (fictional-company trademark from Severance) |
| `lumon/backgrounds/02-opinions-equally.webp` | The Omarchy bracket logo and 'OMARCHY' wordmark on a dark blue terminal-style background, with the tagline 'Enjoy Each Opinion Equally' and HUD text 'TERMINAL: ONLINE' and 'BRANCH: 501'. | 1: readable text referencing a third-party work (Severance) |
| `lumon/preview.png` | Lumon theme screenshot with the Lumon Industries logo (globe ellipse and 'LUMON' wordmark) clearly visible behind the terminal and btop windows. | 1: Lumon logo (fictional-company mark from Severance) |
| `lupine/backgrounds/01-cherry-blossom-bokeh.webp` | A photograph of a pink cherry blossom branch against a bright blue sky, with sun flare and falling petals. | DROP: photograph of unknown authorship |
| `lupine/backgrounds/02-cherry-blossom-white.webp` | A photograph of white-pink cherry blossom trees against a blown-out white sky. | DROP: photograph of unknown authorship |
| `lupine/backgrounds/03-pastel-clouds.webp` | A photograph of pastel pink and lavender cumulus clouds filling the sky. | DROP: photograph of unknown authorship |
| `lupine/backgrounds/04-elegant-blue-wave.webp` | Translucent light-blue flowing wave ribbons on a white background. | DROP: stock-style rendered abstract of unknown authorship (unsure counts as DROP) |
| `lupine/backgrounds/05-abstract-wave.webp` | A glossy blue and grey 3D abstract wave swoosh with light streaks on a white background. | DROP: stock-style rendered abstract of unknown authorship (unsure counts as DROP) |
| `lupine/preview.png` | Lupine theme screenshot (light) over the 04-elegant-blue-wave wallpaper, translucent layered blue swoosh curves visible at the edges and bottom-right. | DROP: stock-style abstract render of unknown authorship (unsure) |
| `matte-black/backgrounds/0-ship-at-sea.jpg` | A detailed orange-and-black illustration of a sailing ship on stylised waves under a large glowing sun, swirling clouds and floating orbs. | DROP: detailed illustration of unknown authorship |
| `matte-black/backgrounds/1-dark-waters.webp` | A near-black, highly detailed texture of rough ocean waves, either a photo or a 3D render. | DROP: photograph/detailed render of unknown authorship |
| `matte-black/backgrounds/2-dot-hands.webp` | A dot-matrix rendering of the two reaching hands from Michelangelo's 'Creation of Adam' on black, signed `@samdape` in the bottom-right corner. | 1: recognizable artwork restyled + third-party artist signature |
| `matte-black/preview.png` | Matte Black theme screenshot over an orange sunset seascape illustration with a ship's mast (0-ship-at-sea), visible through the gaps. | DROP: detailed illustration of unknown authorship |
| `miasma/backgrounds/01-nature-of-fear.webp` | A dark oil painting of a gaunt figure whose face is smeared and faceless, reaching out with one arm, in a chiaroscuro Old Master style. | DROP: detailed painting of unknown authorship / recognizable artwork |
| `miasma/backgrounds/02-crowned.webp` | A dark oil painting of a crowned, draped figure (Christ with the crown of thorns) whose face is dissolved into drips of paint. | DROP: detailed painting of unknown authorship / recognizable artwork |
| `miasma/preview.png` | Miasma theme screenshot over the 01-nature-of-fear wallpaper, a dark detailed painting of a gaunt figure whose hand/arm shows through the gap between windows. | DROP: detailed painting of unknown authorship |
| `nord/backgrounds/0-black-moon.jpg` | A landscape photo of a jagged mountain range over a beach (looks like Vestrahorn, Iceland), composited with a large black sphere and orbital star trails in the sky. | DROP: photograph of unknown authorship |
| `nord/backgrounds/1-city-view.webp` | A detailed blue-toned illustration of a girl in silhouette reading by a large window that overlooks a city skyline at dusk, with a cat on the sill. | DROP: detailed illustration of unknown authorship |
| `nord/backgrounds/2-night-hawks.webp` | A recoloured, blue-tinted version of Edward Hopper's painting 'Nighthawks' (the diner at night with patrons at the counter). | 1: recognizable artwork (famous painting recoloured) |
| `nord/preview.png` | Nord theme screenshot over a dark mountain/landscape wallpaper (black-moon / city-view style photo-illustration) visible through the translucent windows. | DROP: photograph/detailed illustration of unknown authorship |
| `osaka-jade/backgrounds/1-glowing-city.webp` | Anime-style painted night cityscape tinted green: Japanese houses with lit windows, utility poles and wires, and a skyline with hills behind. | DROP: detailed illustration of unknown authorship |
| `osaka-jade/backgrounds/2-shaded-entrance.webp` | Detailed anime-style painting of a traditional Japanese house front at night under a glowing green wisteria/willow tree, with flowers and a utility pole. | DROP: detailed illustration of unknown authorship |
| `osaka-jade/backgrounds/3-mountain-moon.webp` | Flat vector landscape in greens: silhouetted pine trees, layered mountains, a white sun and a flock of birds. | DROP: detailed illustration of unknown authorship |
| `osaka-jade/preview.png` | Osaka Jade theme screenshot over the 1-glowing-city wallpaper, a detailed green anime-style night cityscape with power lines, glowing through the gaps. | DROP: detailed illustration of unknown authorship |
| `retro-82/backgrounds/1-in-the-groove.webp` | Close-up color-graded photograph of a vinyl record spinning on a turntable, with a red record label (blurred text and label logo) and a tonearm. | DROP: photograph of unknown authorship; 1: third-party label text/logo |
| `retro-82/backgrounds/2-dusk-guardian.webp` | Photograph of a stag silhouetted against a misty orange sunrise over a frosty green field. | DROP: photograph of unknown authorship |
| `retro-82/backgrounds/3-glassy-lines.webp` | Abstract render of dense glossy diagonal lines shading from orange/amber (upper left) to teal (lower right). | DROP: detailed render of unknown authorship (unsure counts as DROP) |
| `retro-82/backgrounds/4-gateway.webp` | Digital painting of a figure with headphones and a backpack standing before a glowing orange doorway between utility poles, with a small plush toy, signed 'RAJA NANDEPU' at bottom left. | DROP: named artist signature / detailed illustration of unknown license |
| `retro-82/backgrounds/5-zen-boat.webp` | Painterly illustration of a person sitting on a stone building ledge before a large orange sun over a teal sea, with a small boat. | DROP: detailed illustration/painting of unknown authorship |
| `retro-82/backgrounds/6-abstract-pyramids.webp` | Intricate geometric artwork of interlocking impossible-triangle bands made of small textured triangles, in orange, cream, sage and navy. | DROP: detailed illustration of unknown authorship (unsure counts as DROP) |
| `retro-82/backgrounds/7-the-journey.webp` | Color-graded landscape of a kayaker on a still lake reflecting mountains and a full moon under an orange-to-teal sky. | DROP: photograph/photo-manipulation of unknown authorship |
| `retro-82/backgrounds/8-glitter-glass.webp` | Macro/underwater-style photograph of orange and teal glitter particles and streaks suspended in water or on glass. | DROP: photograph of unknown authorship |
| `retro-82/preview.png` | Retro 82 theme screenshot over a teal/orange retro landscape illustration (sunset scene) visible at the screen edges and window gaps. | DROP: detailed illustration of unknown authorship |
| `ristretto/backgrounds/0-launch.webp` | Five flat curved stripes (brown, rust, red-orange, orange, tan) that run down the centre and flare outward at the bottom, on a flat dark-brown background, in a 70s-retro style. | Overturned by the second reviewer: Nothing shows it is Omarchy's own work, and there are signs it was taken from elsewhere. (1) It is 5120x3414, a 3:2 frame upscaled from some source. That is the usual stock-vector and photo aspect, not a screen ratio, and every one of Omarchy's own… |
| `ristretto/backgrounds/1-color-curves.webp` | Overlapping translucent curved bands of orange, tan, rust, green and brown on a dark background, with soft grain. | DROP: likely AI-generated, unknown authorship |
| `ristretto/backgrounds/2-coffee-beans.jpg` | Close-up of coffee cherries/beans on a leafy coffee branch, in dark moody photographic style. | DROP: photograph/photoreal image of unknown authorship |
| `ristretto/backgrounds/3-industrial-moon.webp` | A detailed pixel-art-style city skyline with skyscrapers, clouds and a large orange moon. | DROP: detailed illustration of unknown authorship |
| `ristretto/preview.png` | Ristretto theme screenshot: Omarchy desktop with Neovim, btop, a terminal and the Files window, over the brown/orange 1-color-curves wallpaper, which shows through the translucent windows (confirmed by boosting contrast and by image correlation, 0.82 against 1.0+ for the other backgrounds). | preview: wallpaper fails - detailed illustration of unknown authorship |
| `rose-pine/backgrounds/1-funky-shapes.webp` | Pastel Memphis/organic composition: pink, teal and lavender blobs, hand-drawn dash clusters, concentric scribble rings, wavy lines and a white blob on a pale pink background. | DROP: composed illustration of unknown authorship (stock-vector look) |
| `rose-pine/backgrounds/2-dot-map.webp` | A regular grid of small square dots in Rose Pine Dawn palette colours (gold, rose, love, pine, foam, iris, greys) on a cream background, denser in some areas. | Overturned by the second reviewer: the provenance leads to a named third-party artist. It was first added as '2-wave-light.png' by an outside contributor in Omarchy PR 1023. The PR says 'Added 3 more backgrounds' and does not claim to have made them, and its sibling 'leafy-dawn' comes from… |
| `rose-pine/backgrounds/3-omarchy-plants.webp` | The multicoloured pixel OMARCHY wordmark centred on a cream background, with a pale sun and flat-vector tropical plants (monstera leaves, ferns, lavender, small flowers) in the bottom corners. | DROP: detailed illustration of unknown authorship |
| `rose-pine/preview.png` | Rose Pine theme screenshot: the same Omarchy desktop in a light pink palette, over the 1-funky-shapes wallpaper (pastel blobs, dash doodles, concentric scribbled rings), faintly visible behind the windows. | preview: wallpaper fails - illustration of unknown authorship |
| `solitude/backgrounds/1-on-pole.webp` | A detailed manga-style pen-and-ink illustration of a hooded figure in a harness standing beside a tent under a stormy, starry sky. | DROP: detailed illustration of unknown authorship (likely comic/manga panel) |
| `solitude/backgrounds/2-wreakage.webp` | A detailed manga-style illustration of a hooded figure crouching before a heap of rubble, broken concrete pillars and debris. | DROP: detailed illustration of unknown authorship (likely comic/manga panel) |
| `solitude/backgrounds/3-climb.jpg` | Detailed manga-style ink illustration of a mountaineer with a large pack climbing a snowy slope; a Mammut mammoth logo is visible on the arm patch. | 1: brand logo (Mammut) + DROP: detailed illustration of unknown authorship |
| `solitude/backgrounds/4-ether.webp` | Detailed manga-style ink illustration of a long-haired girl standing under a starry Milky Way sky. | DROP: detailed illustration of unknown authorship |
| `solitude/backgrounds/5-eyed.jpg` | Detailed manga-style illustration of a person at an apartment window looking out at a giant eye-like object filling the sky over a city. | 1: likely a still from a published manga + DROP: detailed illustration of unknown authorship |
| `solitude/preview.png` | Solitude theme screenshot (2880x1800): Omarchy desktop with Neovim, btop, a terminal and the Files window over 1-on-pole, a detailed monochrome manga-style ink illustration (grungy sky and texture visible around every window). | preview: wallpaper fails - detailed illustration of unknown authorship |
| `tokyo-night/backgrounds/0-winding-road.webp` | Painterly purple and pink sunset over rolling hills with a winding road, a road sign and a small deer. | DROP: detailed illustration/render of unknown authorship |
| `tokyo-night/backgrounds/1-quattro.webp` | An Audi quattro rally car jumping at sunset, with Audi rings, 'Audi quattro', Michelin and Castrol livery, and a 'quattro' banner. | 1: logos, brands and trademarks (Audi, quattro, Michelin, Castrol) |
| `tokyo-night/backgrounds/2-swirl-buck.webp` | Stylized vector-like illustration of a stag silhouette inside pink and purple swirling concentric waves. | DROP: detailed illustration of unknown authorship |
| `tokyo-night/backgrounds/3-sunset-lake.webp` | Flat vector landscape of a stag overlooking a mountain lake at sunset, signed 'Louis Coyle, louie.co.nz' in the bottom-right corner. | DROP: named artist signature / no license |
| `tokyo-night/backgrounds/4-omakub.webp` | Retro synthwave striped sun with two palm-tree silhouettes on a dark purple striped background. | DROP: illustration of unknown authorship (stock-style vector) |
| `tokyo-night/backgrounds/5-oma-cityscape.jpg` | Omarchy's circle/square/diamond 'oma' logo glowing above a detailed retro-anime-style night cityscape of skyscrapers, pink clouds and a moon. | DROP: detailed illustration of unknown authorship |
| `tokyo-night/preview.png` | Tokyo Night theme screenshot: Omarchy desktop windows over the 2-swirl-buck wallpaper, a pink/purple swirl with a deer silhouette. The antlers and swirls are clearly visible behind the translucent editor and btop. | preview: wallpaper fails - detailed illustration of unknown authorship |
| `vantablack/backgrounds/0-dot-hands.webp` | Dot-matrix rendering of the two reaching hands from Michelangelo's 'The Creation of Adam' on black, signed `@samdape` in the corner. | 1: recognizable artwork (restyled) + named creator handle |
| `vantablack/backgrounds/1-twisted-stairs.webp` | A dark 3D render of a spiral staircase or vortex tunnel made of layered black steps twisting toward the center. | DROP: detailed illustration/render of unknown authorship |
| `vantablack/backgrounds/2-layers-deep.webp` | A dark abstract background of flowing wavy paper-cut layers in black and charcoal. | DROP: detailed illustration/render of unknown authorship |
| `vantablack/backgrounds/3-layers-stacked.webp` | A black and grey 3D paper-cut illustration of wavy stacked layers, with a flat grey area on the left. | DROP: detailed illustration/render of unknown authorship |
| `vantablack/preview.png` | Vantablack theme screenshot: a black-and-white Omarchy desktop over the 1-twisted-stairs wallpaper, a dark 3D render of a spiral staircase that is visible when contrast is boosted. | preview: wallpaper fails - detailed render of unknown authorship |
| `white/backgrounds/1-white.webp` | A white and light-grey 3D paper-cut illustration of concentric curved layers forming an oval hole on the left. | DROP: metadata points to stock asset |
| `white/backgrounds/2-white.webp` | Light grey nested chevron (V-shaped) bands stacked downward on a near-white background. | DROP: metadata points to stock asset |
| `white/backgrounds/3-white.webp` | A photograph of blank white paper sheets and business cards laid out in a stationery mockup on a white surface. | DROP: photograph of unknown authorship |
| `white/preview.png` | White theme screenshot: a light Omarchy desktop (Neovim with Omarchy's own scripts, btop, a terminal listing, and Files with generic monochrome folder/music/picture/share icons) over 2-white, flat nested grey chevrons with thin shadows. | Overturned by the second reviewer: At full resolution (reference/omarchy/themes/white/preview.png, same sha1 a6cfa6c4), the Files window shows the trademark 'Dropbox' as readable text twice: once as a folder in the Home grid and once in the sidebar. The folder in the grid also carries a blue… |

## Re-running the review

When Omarchy adds or changes images, review only the new ones with the rules
above, then add each kept path to `assets/wallpapers-allowed.txt` and its row
here. A strict build (`OMAC_STRICT_MEDIA=1`) fails until the list, the notice
count in `THIRD_PARTY_NOTICES.md` and the bundle all agree.

If you hold the rights to an image and want it credited, added or removed, open
an issue: <https://github.com/evanscastonguay/omac/issues>
