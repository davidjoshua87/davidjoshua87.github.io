# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a personal portfolio website for David Joshua, hosted on GitHub Pages. It's a static website showcasing a professional profile with contact information, work experience, skills, education, and projects.

## Architecture

**Static HTML/CSS Portfolio Site**
- **index.html**: Main single-page application with semantic HTML5 structure
- **styles.css**: Complete styling with responsive design and media queries
- **Assets**: Images (profile.png, project-featured.png, screenshots) and favicon.ico

**Key Sections:**
- Header with profile and contact buttons
- About Me section
- Basic Information
- Recent Projects showcase
- Work Experience timeline
- Skills with progress bars
- Education background
- Contact form and social links

## Development Workflow

**No Build Process**: This is a static site with no package.json, build tools, or dependencies. Simply edit HTML/CSS files directly and commit to GitHub.

**Local Development**:
- Open `index.html` directly in browser
- Use browser developer tools for CSS debugging
- Test responsive design using browser dev tools

**Deployment**:
- Site is automatically deployed via GitHub Pages
- Push to master branch to update live site at https://davidjoshua87.github.io/

## File Structure

```
/
├── index.html          # Main HTML file
├── styles.css          # Complete stylesheet (513 lines)
├── profile.png         # Profile photo
├── project-featured.png # Project showcase image
├── favicon.ico         # Site favicon
├── Screen*.png         # Documentation screenshots
└── README.md          # Project description
```

## Styling Architecture

**CSS Structure** (styles.css):
- Base styles and typography (Lato & Montserrat fonts)
- Component-based sections: header, about, skills, experience, education, contact
- Responsive design with mobile-first approach (@media query at line 481)
- Custom form styling for contact section
- Progress bars for skills visualization
- Social media icons using Font Awesome 4.7.0

**Color Scheme:**
- Primary: #54ba4e (green buttons)
- Secondary: #479fc8 (blue accents)
- Background: #d0e6f8 (light blue)
- Text: #434343 (dark gray)

## Contact Integration

**Email**: `mailto:apidfc42@gmail.com` (header button)
**WhatsApp**: API link for direct messaging
**Contact Form**: Basic HTML form (non-functional, points to /action_page.php)

## Notes for Development

- External dependencies: Google Fonts (Lato, Montserrat), Font Awesome 4.7.0 CDN
- All images are local files (no external image hosting)
- Contact form is presentational only - backend not implemented
- Social media links are placeholders (#)
- Mobile responsive design implemented
- Semantic HTML5 structure used throughout