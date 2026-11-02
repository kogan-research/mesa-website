# MESA Lab Website

This website uses [Hugo](https://gohugo.io/). Submit website changes through a
GitHub pull request (PR) so a lab maintainer can review them before publication.

## Start Here: Your About Us Profile

All team profiles currently live together on the **About Us** page, not on
separate personal pages. For a profile update, you normally need only:

| What to change | Where |
| --- | --- |
| Your name, role, and short bio | [content/about.md](content/about.md) |
| Your profile photo | [static/images/team/](static/images/team/) |

The filenames are `about.md` and `images/team/` (not `abouy.md` or `images/tem/`).
Thomas's existing photo is [static/images/team/tg.jpg](static/images/team/tg.jpg).

Although the content file ends in `.md`, the profile cards use HTML and a Hugo
image shortcode. Keep the existing tags, CSS classes, and the settings between
the `---` lines at the top of the file. Change only your own profile unless your
PR is specifically intended to add or move a member.

### Example: Update Your Role and Bio

Find your name in [content/about.md](content/about.md). Replace the placeholder
text inside your role and bio paragraphs, for example:

```html
<h3>Jane Smith</h3>
<p class="team-card-role">PhD Student</p>
<p class="team-card-bio">I study how online communities coordinate during crises.</p>
```

Keep the surrounding card markup. Use plain text or HTML inside these
paragraphs, not Markdown links. For example, a personal website link can go
inside your bio paragraph:

```html
<p class="team-card-bio">I study online communities. <a href="https://example.com/">Personal website</a>.</p>
```

Write `&amp;` for an ampersand in HTML text, for example `Data &amp; Society`.
Only publish contact details and photos you are comfortable making public.

### Example: Add or Replace Your Photo

1. Choose a clear headshot that you have permission to publish. A square crop
   works well; photos are cropped to fill their frame.
2. Save it as a reasonably sized JPG or PNG with a lowercase, space-free filename,
   such as `jane-smith.jpg`. Aim for under 500 KB where practical.
3. Add it to [static/images/team/](static/images/team/).
4. Replace your empty `<div class="team-card-image"></div>` with:

```html
<div class="team-card-image team-card-image--photo">
  {{< img src="images/team/jane-smith.jpg" alt="Jane Smith" class="team-card-photo" >}}
</div>
```

The `src` must match the filename exactly, including capitalization and extension.
Do **not** include `static/` in `src`. The shortcode handles the site's URL prefix.
Set `alt` to the person pictured.

For reference, Thomas's existing card is:

```html
<div class="team-card">
  <div class="team-card-image team-card-image--photo">
    {{< img src="images/team/tg.jpg" alt="Thomas Greger" class="team-card-photo" >}}
  </div>
  <h3>Thomas Greger</h3>
  <p class="team-card-role">PhD Student</p>
  <p class="team-card-bio">Short bio description</p>
</div>
```

To replace a photo already referenced by your card, upload a new image with the
same filename, or upload a new filename and update `src` in the same PR.

### Example: Add a New Member

Copy one complete `<div class="team-card"> ... </div>` block, such as Thomas's
card above, into the appropriate section's existing `team-cards` container
(Lab Director, Graduate Students, or Undergraduate Students). Replace the name,
role, bio, photo filename, and alt text. Do not copy the entire section or place
one card inside another. Alumni use a separate `alumni-row` layout; copy an
existing alumni row when updating that section.

## Submit a Pull Request on GitHub

You can make a small profile update entirely in your browser.

1. Open the lab's website repository on GitHub. Start from the latest `main`
   branch. With write access, create a branch using the branch selector, for
   example `profile/jane-smith`. Do not commit directly to `main`.
2. Without write access, use **Fork** to create your own copy, then create your
   branch there. When opening the PR, target the lab repository's `main` branch,
   not your fork's `main`.
3. If adding a photo, navigate to `static/images/team/`, select **Add file >
   Upload files**, and commit it to your profile branch. Then open
   [content/about.md](content/about.md), click the pencil icon, edit your card,
   and commit to that **same branch**. Example commit message:
   `Update Jane Smith's profile and photo`.
4. Open **Pull requests > New pull request** (or **Compare & pull request**).
   Use `main` as the base and your profile branch as the compare branch.
5. Review **Files changed**. Your PR should contain only your intended content
   and photo changes. Give it a clear title such as `Update Jane Smith's profile`.
6. Describe what changed and how you checked it. Include a local-preview
   screenshot when possible; if you did not preview locally, say so and ask the
   reviewer to check the rendered page. Request review from a lab maintainer.
7. Address feedback by committing further changes to the same branch. The PR
   updates automatically; you do not need to open a second PR.
8. Wait for maintainer approval and merge. Once merged into `main`, the
   repository's GitHub Actions workflow builds and deploys to GitHub Pages.

PR description example:

```text
Changes: Updated my role and research bio; added my headshot.
Checked: Previewed /about/ locally at desktop and mobile widths.
Screenshot: Attached.
```

GitHub's file preview does not render this Hugo page faithfully. The current
[deployment workflow](.github/workflows/deploy.yml) runs on pushes to `main`
(or a manual run), not on PRs. Opening a PR does not publish your edits or create
a preview site. A lack of PR checks is not proof that the page builds.

## Optional: Edit and Preview Locally

Install Git and [Hugo Extended](https://gohugo.io/installation/). The deployment
workflow uses Hugo Extended **0.154.5**; use that version when matching CI exactly.
On macOS, `brew install hugo` installs the current Homebrew version, which may
differ from CI.

Copy the lab repository's HTTPS URL from GitHub's **Code** menu, then run:

```bash
git clone <repository-url>
cd <cloned-folder>
git switch main
git pull --ff-only origin main
git switch -c profile/jane-smith
hugo server --buildDrafts --baseURL http://localhost:1313/
```

Replace the angle-bracket placeholders before running the commands. Open
`http://localhost:1313/about/` and edit the files in your editor. Hugo refreshes
the preview as you save. Stop the server with `Ctrl+C`.

Before submitting, run the production build and commit only your source changes:

```bash
hugo --minify
git diff --check
git diff -- content/about.md
git status --short
git add content/about.md static/images/team/jane-smith.jpg
git commit -m "Update Jane Smith's profile and photo"
git push -u origin profile/jane-smith
```

Omit the image path from `git add` if you did not add or replace a photo. If
working without lab repository write access, clone your fork instead and open
the PR against the lab repository. Never commit generated `public/` or
`resources/_gen/` files. Open the PR on GitHub using the steps above.

## Before Requesting Review

- [ ] My name, role, and bio are correct, with no placeholder text left in my card.
- [ ] My photo loads, has descriptive alt text, and is cropped sensibly.
- [ ] Any personal website links work.
- [ ] I checked the About Us page at desktop and mobile widths, or clearly noted
      in the PR that I need the reviewer to preview it.
- [ ] My changes do not alter another member's profile or the page's layout.
- [ ] The PR targets the lab repository's `main` branch and includes both the
      profile edit and any required photo.