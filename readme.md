# Command Reference

This is a collection of useful commands and scripts that I find helpful and want to remember.

## Quick Start

Browse through the different sections to find commands for:
- AWS (IAM, Route53, SOC2)
- Docker
- Kubernetes
- Databases (MySQL, PostgreSQL)
- Jenkins
- Linux utilities
- Ruby (Sidekiq)
- Java (Gradle)
- OpenSearch
- SSH
- GitHub

## Building the Static Site

This repository can be built into a searchable static website using MkDocs.

### Prerequisites

- Python 3.7 or higher
- pip

### Installation

1. Install dependencies:
```bash
pip install -r requirements.txt
```

### Local Development

To preview the site locally with live reload:
```bash
mkdocs serve
```

Then open your browser to `http://127.0.0.1:8000`

### Build for Production

To build the static site:
```bash
mkdocs build
```

The static site will be generated in the `site/` directory.

### Deploy

#### Automatic Deployment (GitHub Actions)

This repository is configured to automatically build and deploy to GitHub Pages whenever you push to the `main` branch.

**Setup Steps:**
1. Go to your GitHub repository Settings > Pages
2. Under "Build and deployment", select "Deploy from a branch"
3. Select the `gh-pages` branch and `/ (root)` folder
4. Save the settings

After the first push to `main`, the site will be available at: `https://yourusername.github.io/cmds/`

The workflow will:
- Install Python and uv
- Install MkDocs dependencies
- Build and deploy the site to the `gh-pages` branch

#### Manual Deployment

You can also deploy manually to any static hosting service:

- **GitHub Pages (manual)**: `mkdocs gh-deploy`
- **Netlify**: Drag and drop the `site/` folder or connect your repo
- **Vercel**: Connect your repo and set build command to `mkdocs build`
- **AWS S3**: Upload the `site/` folder to an S3 bucket with static hosting enabled

## Features

- Full-text search across all commands
- Syntax highlighting for code blocks
- Dark/light mode toggle
- Mobile-responsive design
- Copy button for code blocks