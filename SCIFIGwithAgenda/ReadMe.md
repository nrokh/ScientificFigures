# Using SCIFIG with Agentic Artificial Intelligence Models (e.g., Claude, Codex, Gemini, Aider)

General description: Agentic AI models such as Anthropic's Claude or OpenAI's Codex can read your plotting code, run it, look at the rendered figure, and revise it in a loop. That makes them useful figure-making partners, **as long as you keep the scientific judgment for yourself.** This guide gives copy-and-paste prompts that ground the model in the SCIFIG materials (the Spectrum of Figure Creation, the six-attribute Figure Rubric, and the P³ lessons on posters, presentations, and publications) so its feedback matches what we teach in the workshop. The prompts were made in collaboration with SCIFIG tutorial attendees and are still ongoing improvements. 

Prompts were written and tested with Claude Opus 5.5, however should work with most agentic models. Throughout the ReadMe you will see several items with `[BRACKETS]` which are meant for you to fill in with your own details for your figures, scientific projects, etc. AI agents are tools to support your figure-making, not a substitute for it. The scientific judgment, the main message, and the responsibility for your figures remain you and your co-authors responsibility. 

---

<h2 align="center">Before You Start</h2>

<details>
<summary>Give the model the SCIFIG context</summary>

A model gives much better figure feedback when it critiques against a shared standard rather than its own taste. Pick the option that matches how you use Claude:

| Where you use Claude | How to load SCIFIG |
|----------------------|--------------------|
| **Claude Code / other coding agents** | Clone this repository next to your project (or copy `FigureRubric/` into it) and add the [`CLAUDE.md` template](#claudemd-template) below to your project root so the rubric is loaded in every session. |
| **Claude.ai Projects** | Create a Project, upload `FigureRubric/FigureRubric.pdf`, `FigureSpectrum/FigureSpectrum.pdf`, and `LinksAndFAQs/LinksAndFAQs.pdf` as Project knowledge, and paste the rubric summary below into the Project instructions. |
| **A single chat** | Attach `FigureRubric.pdf` to your first message along with your figure. |

**Rubric summary to paste into instructions:**
```
Evaluate every figure against the SCIFIG Figure Rubric's six attributes:
1. Scale & Resolution – elements sized for the venue; consistent sizing; lossless export (SVG, PNG, TIFF).
2. Units & Labels – every axis labeled with units (even unitless); consistent limits across side-by-side plots; titles state the take-away.
3. Colors – one palette across the whole paper/poster/talk; muted by default, saturated only for emphasis; lightness to encode ordered variables.
4. Emphasis – annotations, callouts, highlights, or line-style changes point to what matters; defined significance markers; never imply a trend that isn't in the data.
5. Ink:Content Ratio – remove anything not needed to understand the data (grid lines, boxes, redundant legends).
6. Accessibility – readable sans-serif fonts; interpretable with red-green color blindness and in grayscale; alt text is distinct from the caption.
```
</details>

<details>
<summary>Good habits when working with an agent</summary>

- **Lead with the main point.** Tell the model the one sentence your figure should communicate and who will see it. Every SCIFIG lesson flows from this.
- **Share the data and code, not just a screenshot.** The model can then make real edits instead of describing them.
- **Ask it to look at its own output.** Agents that can run code should render the figure, view the image, and check it against the rubric before handing it back.
- **Protect data integrity.** Tell the model it may change presentation, never values. Review every diff that touches data loading, filtering, axis limits, or statistics.
- **Keep the model in reviewer mode when you are learning.** Asking for questions and critique (rather than a finished figure) builds the skills the workshop is about.
- **Check your policies.** Confirm your institution allows unpublished data to be shared with AI tools, and check your target journal's rules on AI-generated imagery. Using an agent to write plotting code for your real data is very different from generating an illustration.
</details>

---

<h2 align="center">Prompt Library</h2>

<details>
<summary>1. Rubric audit of an existing figure</summary>

Use this when you have a draft figure and want structured feedback (a good match for the workshop's Figure Peer Review breakout).

```
I've attached a figure and the SCIFIG Figure Rubric.

Context:
- Main point this figure should communicate: [ONE SENTENCE]
- Venue: [publication / poster / presentation / thesis committee meeting]
- Audience: [e.g., specialists in my field, general scientific audience]

Please:
1. Tell me, in one sentence, what YOU think the main point is from the figure alone. If it doesn't match mine, say so first.
2. Score each of the six rubric attributes (Scale & Resolution, Units & Labels, Colors, Emphasis, Ink:Content Ratio, Accessibility) as Good / Needs work / Missing, with one sentence of evidence each.
3. List the three changes that would most improve the figure, in priority order.
Do not redesign the figure yet.
```
</details>

<details>
<summary>2. Place a figure on the Spectrum of Figure Creation</summary>

Helps you see where you are in the iterative process shown in Figures 1–4.

```
Using the SCIFIG Spectrum of Figure Creation (attached), where does my figure sit between Figure 1 (unprocessed defaults) and Figure 4 (plot type matched to data and audience)?

Explain:
- What moved it past the previous stage (if anything)
- What it would take to reach the next stage
- Whether the next step is a *formatting* change (Fig 1 → 2), a *data* rethink (Fig 2 → 3), or a *plot type* rethink (Fig 3 → 4)
```
</details>

<details>
<summary>3. Rethink the plot type (Figure 3 → Figure 4)</summary>

```
Here is my data: [ATTACH FILE or describe columns, variable types, sample size, and grouping].
The comparison I need the reader to make is: [e.g., "treatment vs. control across three time points"].

Suggest 2–3 plot types that match this data type and comparison. For each, give:
- Why it fits (or where it could mislead)
- Whether it shows individual data points or only summaries
- Which venue (paper / poster / talk) it suits best
Recommend one, then wait for my choice before writing any code.
```
</details>

<details>
<summary>4. Agentic revision of plotting code</summary>

For Claude Code or any agent that can run code. Try it first on `Inkscape101/coffeeCupPlotting.py`.

```
Revise [PATH TO PLOTTING SCRIPT] so the figure follows the SCIFIG Figure Rubric.

Rules:
- Do not change data values, filtering, or statistics. If you think something in the analysis is wrong, stop and tell me instead.
- Main point to emphasize: [ONE SENTENCE]
- Venue: [publication / poster / presentation]

Workflow:
1. Run the current script and look at the output. Summarize the rubric problems you see.
2. Make the edits. Export as SVG with editable text (matplotlib: plt.rc("svg", fonttype="none")) and as a 300+ dpi PNG.
3. Render the new figure, view it, and re-check all six rubric attributes. Iterate until each passes or explain why it can't.
4. Show me a before/after and a short changelog mapped to rubric attributes.
```
</details>

<details>
<summary>5. One dataset, three venues (P³)</summary>

Recreates the Figure 4a / 4b / 4c lesson for your own data.

```
Starting from [SCRIPT or FIGURE], create three versions, following the SCIFIG P³ guidance:

- Publication (4a): the reader has time; full detail, fine print and statistics are fine; sized for [single / double] column of [JOURNAL].
- Poster (4b): distilled to the main point; readable from 2 m; large fonts; same palette as the rest of my poster [HEX CODES if known].
- Presentation (4c): supports what I say out loud; show a subset of the data; build it as a sequence of [N] frames that reveal the story step by step.

Keep the data identical across versions. Explain what you removed or simplified for each venue and why.
```
</details>

<details>
<summary>6. Accessibility check</summary>

Accessibility is the highest-level rubric goal and is easy to automate with an agent.

```
Check my figure [ATTACH or PATH] for accessibility:
1. Simulate deuteranopia, protanopia, and tritanopia, plus a grayscale version, and show me the results side by side. Can every series still be told apart?
2. If not, propose a colorblind-safe palette and redundant encodings (line style, marker shape, direct labels) instead of relying on color alone.
3. Check that all text is sans-serif and large enough for [VENUE].
4. Check the figure on a dark background as well as a light one.
5. Draft alt text (what the figure shows and its main finding, for someone who cannot see it) separately from the caption.
```
</details>

<details>
<summary>7. Caption and alt text</summary>

```
Write a caption and separate alt text for this figure [ATTACH].
- Caption: title sentence stating the take-away, then what each panel shows, what markers/error bars mean, sample sizes, and statistical tests. Follow [JOURNAL]'s style if you know it; otherwise ask.
- Alt text: under [150] words, describes the figure's structure and main finding without repeating the caption.
Flag anything you had to guess, such as what error bars represent.
```
</details>

<details>
<summary>8. Prepare a figure for finishing in Inkscape</summary>

Pairs with the [Inkscape 101](../README.md#inkscape-101-) guide.

```
I'll finish this figure in Inkscape. Update [SCRIPT] so the exported SVG is easy to edit:
- Text stays as editable text, not paths
- Elements are grouped and named logically (axes, data series, legend, annotations) using gid labels
- No clipping masks or rasterized elements unless necessary
Then give me a short checklist of Inkscape edits still worth doing by hand (e.g., adding an illustration traced from a photo, as in the coffee-cup example).
```
</details>

<details>
<summary>9. Consistent style across a whole paper, poster, or thesis</summary>

```
I have [N] figures for [PAPER / POSTER / THESIS] made by the scripts in [FOLDER].
Create a shared style (e.g., a matplotlib .mplstyle file, a ggplot2 theme, or a MATLAB function) that sets fonts, font sizes for [VENUE], line widths, and one color palette, following the SCIFIG rubric.
Apply it to every script, re-render all figures, and show them together so I can check consistency. Do not change any data processing.
```
</details>

<details>
<summary>10. Integrity check</summary>

The rubric's Emphasis section asks you to *have integrity*. Use this before submission.

```
Review this figure [ATTACH] and its code [PATH] as a skeptical reviewer. Flag anything that could mislead a reader, such as:
- Truncated or inconsistent axes, or dual axes that imply a relationship
- Smoothing, binning, or aspect ratios that create or hide a trend
- Error bars or significance markers that aren't defined
- Excluded data points without explanation
Only report issues and questions; do not edit anything.
```
</details>

<details>
<summary>11. Coach mode (for learning)</summary>

Best for students working through the workshop on their own.

```
Act as a SCIFIG workshop facilitator. I'm going to improve this figure [ATTACH] myself.
Don't give me answers or code. Instead, walk through the six rubric attributes one at a time, asking me one question per attribute that helps me spot the problem. After I respond, tell me whether I caught it and move to the next attribute.
```
</details>

---

<h2 align="center">CLAUDE.md Template</h2>

<details>
<summary>Drop-in project instructions for coding agents</summary>

Save this as `CLAUDE.md` (or `AGENTS.md` for other agents) in the root of a project where you make figures. Claude Code reads it automatically at the start of each session.

```markdown
# Figure guidelines (SCIFIG)

When creating or editing figures in this project, follow the SCIFIG Figure Rubric
(https://github.com/nrokh/ScientificFigures/tree/main/FigureRubric):

1. Scale & Resolution: size elements for the target venue; export SVG (editable text) + PNG at 300+ dpi.
2. Units & Labels: label every axis with units; consistent limits across side-by-side plots; titles state the take-away.
3. Colors: use the project palette below; muted by default, saturated only for emphasis.
4. Emphasis: highlight the main point with annotation or line style; define significance markers; never imply a trend that isn't there.
5. Ink:Content: remove grid lines, boxes, and anything not needed to read the data.
6. Accessibility: sans-serif fonts; readable with color blindness and in grayscale; draft alt text separate from captions.

## Working rules
- Never change data values, filtering, or statistics while editing a figure. Ask first.
- After every figure change, render the output, view it, and check it against the six attributes.
- Ask me for the figure's main point and venue if I haven't said.

## Project specifics
- Palette: [HEX CODES]
- Font: [FONT], sizes: [e.g., 8 pt paper / 24 pt poster / 18 pt slides]
- Target journal/venue: [NAME, column widths]
```
</details>

---

## Contact

Suggestions for new prompts? Open an issue or reach out to [Nataliya Rokhmanova](https://is.mpg.de/person/rokhmanova) or [Andrew K. Schulz](https://hi.is.mpg.de/person/aschulz).
