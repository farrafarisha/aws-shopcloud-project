# ☁️ ShopCloud – AWS E-Commerce Web Application
### Cloud Computing Group Project | AWS Free Tier

---

## 👥 Team Members
| Name | Student ID | Role |
|------|-----------|------|
| [Nur Farra Farisha Binti Rusdi] | [52222223221] | EC2 Setup, Website Development, GitHub |
| [Fathin Noorshafirah Binti Ismail Phua] | [52222223203] | RDS & S3 Setup, VPC Config, Report & Video |

---

## 🎥 Video Presentation
▶️ **YouTube Link:** https://youtu.be/J4-WEkg8v9M?si=HWSpVo5LIZmFOmvL

---

## 🌐 Live Website
🔗 **Website URL:** http://[http://13.214.210.146]  
🔗 **S3 Static URL:** http://shopcloud-assets-farrafathin.s3-website-ap-southeast-1.amazonaws.com

---

## 📋 Project Overview

**ShopCloud** is a fully functional small e-commerce web application deployed on **Amazon Web Services (AWS)**. The project demonstrates real-world usage of four core AWS services:

| AWS Service | Category | Purpose |
|-------------|----------|---------|
| **Amazon EC2** (t2.micro) | Compute | Hosts the Apache web server & application |
| **Amazon RDS** (MySQL 8.0) | Database | Stores product catalog & order data |
| **Amazon S3** | Storage | Hosts static website files & assets |
| **Amazon VPC** | Networking | Isolated private network with subnets & security groups |

---

## 🏗️ AWS Architecture

```
Internet
    │
    ▼
Internet Gateway
    │
    ▼
┌─────────────────────────────────────┐
│  VPC: 10.0.0.0/16 (ShopCloud-VPC)  │
│                                     │
│  ┌──────────────────────────────┐   │
│  │  Public Subnet 10.0.1.0/24  │   │
│  │  ┌──────────────────────┐   │   │
│  │  │  EC2 t2.micro        │   │   │
│  │  │  Apache Web Server   │   │   │
│  │  │  ShopCloud Website   │   │   │
│  │  └──────────────────────┘   │   │
│  └──────────────────────────────┘   │
│                                     │
│  ┌──────────────────────────────┐   │
│  │  Private Subnet 10.0.2.0/24 │   │
│  │  ┌──────────────────────┐   │   │
│  │  │  RDS MySQL 8.0       │   │   │
│  │  │  db.t2.micro         │   │   │
│  │  │  shopcloud database  │   │   │
│  │  └──────────────────────┘   │   │
│  └──────────────────────────────┘   │
└─────────────────────────────────────┘
         │
         ▼
    S3 Bucket (Static Assets)
```

---

## 📁 Repository Structure

```
aws-shopcloud-project/
├── README.md
├── website/
│   └── index.html          ← Main e-commerce website (HTML/CSS/JS)
├── report/
│   └── ShopCloud_AWS_Project_Report.docx
├── sql/
│   └── shopcloud_schema.sql   ← MySQL database schema & seed data
└── screenshots/
    ├── ec2_instance.png
    ├── rds_database.png
    ├── s3_bucket.png
    ├── vpc_setup.png
    └── website_demo.png
```

---

## 🚀 How to Replicate This Project

### Prerequisites
- AWS Free Tier account
- A computer with Terminal (Mac/Linux) or PowerShell (Windows)
- Basic familiarity with web browsers

### Quick Start

1. **Clone this repo**
   ```bash
   git clone https://github.com/farrafarisha/aws-shopcloud-project.git
   ```

2. **Set up AWS (follow the full guide in the report)**
   - Create VPC → Subnets → Internet Gateway → Route Tables
   - Launch EC2 t2.micro (Amazon Linux 2023)
   - Create RDS MySQL 8.0 (db.t2.micro)
   - Create S3 bucket with static hosting

3. **Run the SQL schema**
   ```bash
   mysql -h shopcloud-db.czqeioku0x0a.ap-southeast-1.rds.amazonaws.com -u admin -p < sql/shopcloud_schema.sql
   ```

4. **Upload the website to EC2**
   ```bash
   scp -i shopcloud-key.pem website/index.html ec2-user@13.214.210.146:/home/ec2-user/
   ssh -i shopcloud-key.pem ec2-user@13.214.210.146
   sudo cp index.html /var/www/html/index.html
   ```

5. **Visit your site** at `http://13.214.210.146`

---

## 🌟 Features
- 🛍️ 12 products across 5 categories
- 🔍 Category filtering
- 🛒 Add to cart with live counter
- 💬 Product detail modal
- ❤️ Wishlist notifications
- 📊 AWS status bar (EC2, RDS, S3, VPC live indicators)
- 📱 Mobile responsive design

---

## 💰 AWS Free Tier Cost
**Total cost for this project: $0.00** (within Free Tier limits)

| Service | Free Tier Limit | Used |
|---------|----------------|------|
| EC2 t2.micro | 750 hrs/month | ~10 hrs |
| RDS db.t2.micro | 750 hrs/month | ~5 hrs |
| S3 Storage | 5 GB | <1 MB |
| Data Transfer | 1 GB outbound | <100 MB |

---

## 📄 Report
Full step-by-step tutorial report is available in `/report/ShopCloud_AWS_Project_Report.docx`

---

## 📚 References
- [AWS EC2 Documentation](https://docs.aws.amazon.com/ec2/)
- [AWS RDS User Guide](https://docs.aws.amazon.com/rds/)
- [AWS S3 Documentation](https://docs.aws.amazon.com/s3/)
- [AWS VPC User Guide](https://docs.aws.amazon.com/vpc/)
- [AWS Free Tier](https://aws.amazon.com/free/)

---

*Built with ☁️ Amazon Web Services | Cloud Computing Course 2025*
