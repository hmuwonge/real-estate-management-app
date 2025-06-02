# 🧩 SawaTech Mini Property Management Project Setup Guide

Welcome to the documentation for this project built with **ABP Framework** on the backend and **Angular** on the frontend.

---

## 📦 Technologies Used

* **Backend**: [ABP Framework](https://abp.io) (.NET Core)
* **Frontend**: [Angular](https://angular.io)
* **Database**: (e.g., SQL Server, PostgreSQL — update accordingly)
* **Authentication**: (e.g., JWT / Identity Server — update if needed)

---

## 🚀 Prerequisites

Make sure you have the following installed:

### 🔧 Backend

* [.NET SDK (6.0 or 7.0+)](https://dotnet.microsoft.com/download)
* [EF Core CLI tools](https://learn.microsoft.com/en-us/ef/core/cli/dotnet)
* [SQL Server / PostgreSQL](https://www.postgresql.org/) (or your DB of choice)

### 🌐 Frontend

* [Node.js (v16+ or LTS)](https://nodejs.org/)
* [Angular CLI](https://angular.io/cli)
* [Yarn ](https://yarn.io/cli)

```bash
npm install -g @angular/cli
```

---

## 🛠️ Getting Started

### 1. Clone the Repository

```bash
git clone https://your-repo-url.git
cd your-project-folder
```

---

## ⚙️ Backend Setup (ABP)

### 2. Navigate to Backend Folder

```bash
cd aspnet-core
```

### 3. Restore Dependencies

```bash
dotnet restore
```

### 4. Set Up the Database

Update the `appsettings.json` with your connection string.

Example:

```json
"ConnectionStrings": {
  "Default": "Server=localhost;Database=YourDbName;User Id=sa;Password=your_password;"
}
```

Run migrations to create the database:

```bash
dotnet ef database update --project SawaTech.PropertyMini.EntityFrameworkCore
```

Or using ABP CLI:

```bash
abp database update
```

### 5. Run the Backend API

```bash
dotnet run --project YourProjectName.HttpApi.Host
```

---

## 🖼️ Frontend Setup (Angular)

### 6. Navigate to Angular Folder

```bash
cd angular
```

### 7. Install Dependencies

```bash
yarn install
```

### 8. Configure Environment

Update the `environment.ts` file with your backend API URL:

```ts
export const environment = {
  production: false,
  baseUrl: 'https://localhost:44343', // Backend URL
  // other config
};
```

### 9. Run the Angular App

```bash
ng serve
```

Open the browser and visit: [http://localhost:4200](http://localhost:4200)

---

## 🔐 Login Info

> Update with actual credentials or point to registration flow.

* **Admin Email**: `admin@yourdomain.com`
* **Password**: `123qwe`

---

## 📁 Project Structure

```bash
your-project/
├── angular/              # Angular Frontend
│   └── src/
│       └── app/
├── aspnet-core/          # ABP .NET Backend
│   └── src/
│       └── YourProjectName.*
├── docs/                 # Optional documentation
└── README.md
```

---

## 💬 Common Commands

### Backend

| Task          | Command                                                                  |
| ------------- | ------------------------------------------------------------------------ |
| Run API       | `dotnet run --project *.HttpApi.Host`                                    |
| Update DB     | `dotnet ef database update` or `abp database update`                     |
| Add Migration | `dotnet ef migrations add MigrationName --project *.EntityFrameworkCore` |

### Frontend

| Task      | Command           |
| --------- | ----------------- |
| Serve App | `ng serve`        |
| Build App | `ng build --prod` |
| Lint      | `ng lint`         |

---

## 🧪 Testing

> Optional section — describe any unit/integration testing commands if applicable.

---

## 🆘 Troubleshooting

* Make sure your backend runs on HTTPS and CORS is configured properly in `appsettings.json` .
* If Angular can't reach the backend, check `apiUrl` and browser CORS errors.

---
<!-- 
## 👥 Contributing

> Provide instructions for team members if necessary

```bash
git checkout -b feature/your-feature-name
``` -->
