# Baby Tools Shop

A simple Django-based web application for browsing baby product categories and products.  
This project is part of the DevSecOps course and demonstrates how to run a Django app locally, inside a Docker container and deploy it to a server.

## Table of Contents
- [Description](#description)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Quickstart](#quickstart)
  - [Prerequisites](#prerequisites)
  - [Run locally](#run-locally)
  - [Run with Docker](#run-with-docker)
- [Usage](#usage)
  - [Admin panel](#admin-panel)
  - [Creating categories and products](#creating-categories-and-products)
  - [Static and media files](#static-and-media-files)
- [Configuration](#configuration)
  - [Environment variables](#environment-variables)
- [Deployment](#deployment)
- [Testing checklist](#testing-checklist)
- [Security notes](#security-notes)
- [Author](#author)

## Description
The **Baby Tools Shop** is a simple demo webshop built with Django.  
Users can browse categories and products, and administrators can manage shop content using the Django admin interface.

This project demonstrates:
- Django project structure
- Running Django locally using a virtual environment
- Running Django inside a Docker container
- Deploying a containerized application to a remote server

## Tech Stack
- **Python:** 3.11  
- **Framework:** Django 4.0.2  
- **Database:** SQLite  
- **Containerization:** Docker  

## Project Structure
```
baby-tools-shop/
├─ babyshop_app/
│  ├─ babyshop/           
│  ├─ products/           
│  ├─ templates/          
│  ├─ static/             
│  ├─ manage.py           
├─ .gitignore
├─ Checklist_Baby_Tools_Shop             
├─ Dockerfile             
├─ requirements.txt       
├─ README.md              
```

## Quickstart

### Prerequisites
- Python 3.11  
- pip  
- Git  
- Docker (for containerized run)  

### Run locally
```bash
git clone https://github.com/ognjenmanojlovic/baby-tools-shop.git
cd baby-tools-shop
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
cd babyshop_app
python manage.py migrate
python manage.py runserver
```

Open:  
`http://127.0.0.1:8000`

### Run with Docker
```bash
docker build -t baby-tools-shop .
docker run --rm -p 8025:8025 baby-tools-shop
```

Open:  
`http://127.0.0.1:8025`

## Usage

### Admin panel
Local:
```
http://127.0.0.1:8000/admin
```
Docker:
```
http://127.0.0.1:8025/admin
```

Create admin user:
```bash
cd babyshop_app
python manage.py createsuperuser
```

### Creating categories and products
Inside the Django admin:
- Create Categories  
- Create Products (name, description, price, category, image)

### Static and media files
- Static files are served by Django directly  
- Uploaded product images go into `media/` (ignored by Git)

## Configuration

### Environment variables
Recommended for production deployments:
```
DJANGO_SECRET_KEY
DJANGO_DEBUG
DJANGO_ALLOWED_HOSTS
```

## Deployment

### Deploying to a server

1. Install Docker (if missing)
```
sudo apt update
sudo apt install -y docker.io
```

2. Clone the repository
```
git clone https://github.com/ognjenmanojlovic/baby-tools-shop.git
cd baby-tools-shop
git checkout development
```

3. Build the Docker image
```
sudo docker build -t baby-tools-shop .
```

4. Run the container  
Replace `<your-server-ip>` with your actual server IP.
```
sudo docker run -d   --restart unless-stopped   -p 8025:8025   -e DJANGO_ALLOWED_HOSTS="<your-server-ip>,localhost,127.0.0.1"   --name baby-tools-shop   baby-tools-shop
```

5. Access the application
```
http://<your-server-ip>:8025
```

## Testing checklist
- [x] App runs locally  
- [x] App runs inside Docker  
- [x] App deployed on server  
- [x] App reachable via `<your-server-ip>:8025`  

## Security notes
- No secrets or passwords are committed  
- Environment variables should be used for sensitive data  
- No SSH keys, API keys, or tokens stored in the repository  

## Author
**Ognjen Manojlovic**

- [Instagram](https://instagram.com/0gisha)
- [LinkedIn](https://www.linkedin.com/in/ognjen-manojlovic-299a2b2a0)