# Deployment Guide

Hugo generates a static website that can be deployed to any web server. Here's how to do it.

## Building the Site

### Step 1: Build the Static Files

Run this command in your website directory:

```bash
hugo
```

This creates a `public/` folder containing all the static HTML, CSS, and JavaScript files needed for your website.

### Step 2: Verify the Build

Check that the `public/` folder was created:

```bash
ls public/
```

You should see:
- `index.html` (homepage)
- `about/`, `research/`, `team/`, etc. (page directories)
- `css/` (stylesheet)
- `js/` (JavaScript)
- `images/` (if you added any)

## Deployment Options

### Option 1: Traditional Web Server (Apache/Nginx)

1. **Build the site:**
   ```bash
   hugo
   ```

2. **Upload the `public/` folder contents** to your web server:
   - Via FTP/SFTP: Upload everything in `public/` to your server's web root (usually `public_html/`, `www/`, or `html/`)
   - Via SCP:
     ```bash
     scp -r public/* user@yourserver.com:/var/www/html/
     ```
   - Via rsync:
     ```bash
     rsync -avz --delete public/ user@yourserver.com:/var/www/html/
     ```

3. **Set permissions** (if needed):
   ```bash
   chmod -R 755 /var/www/html/
   ```

### Option 2: GitHub Pages (Free)

1. **Create a GitHub repository**

2. **Build and commit:**
   ```bash
   hugo
   cd public
   git init
   git add .
   git commit -m "Deploy website"
   git branch -M main
   git remote add origin https://github.com/yourusername/yourrepo.git
   git push -u origin main
   ```

3. **Enable GitHub Pages** in repository settings (Settings → Pages → Source: main branch)

4. **Your site will be at:** `https://yourusername.github.io/yourrepo/`

### Option 3: Netlify (Free, Easy)

1. **Sign up at** [netlify.com](https://netlify.com)

2. **Drag and drop** the `public/` folder, OR

3. **Connect to Git:**
   - Push your code to GitHub
   - Connect Netlify to your repository
   - Build command: `hugo`
   - Publish directory: `public`

4. **Automatic deployments** on every git push!

### Option 4: Vercel (Free, Easy)

1. **Sign up at** [vercel.com](https://vercel.com)

2. **Install Vercel CLI:**
   ```bash
   npm i -g vercel
   ```

3. **Deploy:**
   ```bash
   hugo
   cd public
   vercel
   ```

### Option 5: Your Own Server (SSH/SCP)

If you have SSH access to your server:

```bash
# Build the site
hugo

# Upload to server
rsync -avz --delete public/ user@yourserver.com:/var/www/html/

# Or use SCP
scp -r public/* user@yourserver.com:/var/www/html/
```

## Important Notes

### Base URL Configuration

Before deploying, update `baseURL` in `config.toml`:

```toml
baseURL = 'https://yourdomain.com/'
```

Or for subdirectories:
```toml
baseURL = 'https://yourdomain.com/lab/'
```

### Building for Production

For production, exclude draft content:

```bash
hugo --minify
```

This also minifies CSS/JS for faster loading.

### Automated Deployment Script

Create a `deploy.sh` script:

```bash
#!/bin/bash
# Build the site
hugo --minify

# Upload to server
rsync -avz --delete public/ user@yourserver.com:/var/www/html/

echo "Deployment complete!"
```

Make it executable:
```bash
chmod +x deploy.sh
```

Then deploy with:
```bash
./deploy.sh
```

## Testing Before Deployment

Always test locally first:

```bash
# Build and test
hugo
cd public
python3 -m http.server 8000
# Or: php -S localhost:8000
```

Visit `http://localhost:8000` to verify everything works.

## What Gets Deployed

Only the `public/` folder contents need to be on your web server:
- ✅ HTML files
- ✅ CSS files
- ✅ JavaScript files
- ✅ Images and assets
- ❌ NOT the Hugo source files (content/, themes/, config.toml, etc.)

## Quick Deploy Checklist

- [ ] Update `baseURL` in `config.toml`
- [ ] Run `hugo` to build
- [ ] Test locally (open `public/index.html` or use a local server)
- [ ] Upload `public/` contents to web server
- [ ] Verify site is accessible
- [ ] Check all links work
- [ ] Test on mobile devices

## Troubleshooting

**404 errors?** Check that `baseURL` in `config.toml` matches your domain.

**CSS/JS not loading?** Ensure paths are correct and files uploaded.

**Images not showing?** Verify images are in `static/images/` and uploaded.

**Need to update?** Just rebuild with `hugo` and re-upload the `public/` folder.
