# Content Management Guide

This guide explains how to add and update content on your lab website.

## Quick Workflow

1. **Edit** the Markdown files in `content/` directory
2. **Test locally**: Run `hugo server --buildDrafts` to preview changes
3. **Build**: Run `hugo` to generate static files in `public/`
4. **Deploy**: Upload the `public/` folder to your web server

## Site-Wide Settings

Edit `config.toml` to change:
- Lab name
- Lab description
- Contact email
- Institution name
- Base URL

```toml
title = 'Lab Name'
[params]
  labName = "Lab Name"
  labDescription = "Advancing research in [Your Field]"
  email = "contact@yourlab.example.com"
  institution = "Your University"
```

## Adding/Editing Team Members

Edit `content/team.md` to add or modify team members.

### Adding a Team Member

Use the `team-member` shortcode:

```markdown
{{< team-member name="Dr. Jane Smith" title="Professor" email="jane.smith@university.edu" >}}
**Research interests:** Machine Learning, Computer Vision

Dr. Smith is a leading researcher in artificial intelligence with over 15 years of experience.
{{< /team-member >}}
```

### Parameters:
- `name` - Full name (required)
- `title` - Position/title (required)
- `email` - Email address (optional)

### Example: Complete Team Page Structure

```markdown
## Principal Investigator

{{< team-member name="Dr. Your Name" title="Professor" email="your.email@university.edu" >}}
**Research interests:** Your research areas

Your bio and description here.
{{< /team-member >}}

---

## Graduate Students

<div class="team-grid">
{{< team-member name="Student One" title="PhD Student" email="student1@university.edu" >}}
**Research focus:** Specific research area

Description of their work.
{{< /team-member >}}

{{< team-member name="Student Two" title="Master's Student" email="student2@university.edu" >}}
**Research focus:** Another research area

Description of their work.
{{< /team-member >}}
</div>
```

## Editing Other Content Pages

### Homepage (`content/_index.md`)
- Edit news items
- Update research overview
- Modify welcome message

### About Page (`content/about.md`)
- Update lab description
- Edit mission statement
- Modify research areas

### Research Page (`content/research.md`)
- Add/remove projects
- Update research interests
- Modify methodology descriptions

### Publications Page (`content/publications.md`)
- Add new publications
- Organize by year
- Add links to papers

### Contact Page (`content/contact.md`)
- Update lab location
- Change contact information
- Add social media links

## Using Cards

### Basic Card
```markdown
{{< card title="Card Title" >}}
Your content here
{{< /card >}}
```

### Card with Image
```markdown
{{< card title="Title" image="/images/icon.svg" image-position="left" >}}
Content here
{{< /card >}}
```

### Multiple Cards in Grid
```markdown
{{< cards-grid >}}
{{< card title="Card 1" >}}Content 1{{< /card >}}
{{< card title="Card 2" >}}Content 2{{< /card >}}
{{< /cards-grid >}}
```

## Adding Images

1. Place images in `static/images/` directory
2. Reference them as `/images/filename.svg` or `/images/filename.png`
3. Use in cards: `image="/images/your-image.svg"`

## Markdown Basics

- **Bold**: `**text**`
- *Italic*: `*text*`
- Links: `[text](url)`
- Lists: Use `-` or `1.`
- Headings: `#` for H1, `##` for H2, etc.
- Horizontal rule: `---`

## Rebuilding the Site

After making changes:

```bash
# Preview locally (with drafts)
hugo server --buildDrafts

# Build for production
hugo

# The public/ folder contains your static website
# Upload everything in public/ to your web server
```

## Tips

- Always test locally with `hugo server` before deploying
- Use the shortcodes for consistent formatting
- Keep images optimized (SVG preferred for icons)
- Use the grid layout for multiple items
- Edit Markdown files with any text editor
