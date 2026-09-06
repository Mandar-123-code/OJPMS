<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Recruiter Dashboard | SMARTHIRE</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap"
        rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <style>

        :root {
            --ink: #13211e;
            --mint: #d9f67f;
            --coral: #f27961;
            --paper: #f4f1e8;
            --white: #ffffff;
            --muted: #718078;
            --line: #d6ddd1;
            --soft: #edf1e9;
            --green: #3d765b;
            --danger: #c95d4e;
            --shadow: 0 18px 45px rgba(19, 33, 30, 0.08);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: "DM Sans", sans-serif;
            background: var(--paper);
            color: var(--ink);
            min-height: 100vh;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        button,
        input {
            font-family: inherit;
        }

        /* =========================
           SIDEBAR
        ========================= */

        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            height: 100vh;
            background: var(--ink);
            color: white;
            padding: 25px 16px;
            z-index: 100;
            overflow-y: auto;
        }

        .sidebar-logo {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 5px 10px 30px;
        }

        .sidebar-logo-icon {
            width: 43px;
            height: 43px;
            border-radius: 13px;
            background: var(--mint);
            color: var(--ink);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
            box-shadow: 0 8px 20px rgba(217, 246, 127, 0.12);
        }

        .sidebar-logo-text h2 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 19px;
            letter-spacing: -0.5px;
        }

        .sidebar-logo-text span {
            display: block;
            color: #9ba9a3;
            font-size: 11px;
            margin-top: 2px;
        }

        .sidebar-nav {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .sidebar-nav a {
            display: flex;
            align-items: center;
            gap: 13px;
            min-height: 46px;
            padding: 0 13px;
            border-radius: 11px;
            color: #aebbb5;
            font-size: 14px;
            font-weight: 500;
            transition:
                background 0.25s ease,
                color 0.25s ease,
                transform 0.25s ease;
        }

        .sidebar-nav a i {
            width: 18px;
            text-align: center;
            font-size: 14px;
        }

        .sidebar-nav a:hover {
            background: rgba(255, 255, 255, 0.07);
            color: white;
            transform: translateX(3px);
        }

        .sidebar-nav a.active {
            background: var(--mint);
            color: var(--ink);
            font-weight: 700;
        }

        .sidebar-nav a.active:hover {
            transform: translateX(0);
        }

        .nav-divider {
            height: 1px;
            background: rgba(255, 255, 255, 0.09);
            margin: 17px 8px;
        }

        .sidebar-nav .logout-link {
            color: #e5aaa0;
        }

        .sidebar-nav .logout-link:hover {
            background: rgba(242, 121, 97, 0.10);
            color: #ffb2a4;
        }

        /* =========================
           MAIN
        ========================= */

        .main-content {
            margin-left: 250px;
            min-height: 100vh;
            padding: 0 38px 45px;
        }

        /* =========================
           TOPBAR
        ========================= */

        .topbar {
            min-height: 82px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 25px;
            border-bottom: 1px solid var(--line);
        }

        .topbar-left h1 {
            font-family: "Space Grotesk", sans-serif;
            font-size: 22px;
            letter-spacing: -0.7px;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .rd-search {
            width: 250px;
            height: 42px;
            border: 1px solid var(--line);
            border-radius: 11px;
            background: rgba(255, 255, 255, 0.65);
            padding: 0 14px;
            outline: none;
            color: var(--ink);
            font-size: 13px;
            transition: 0.25s ease;
        }

        .rd-search::placeholder {
            color: #8b9891;
        }

        .rd-search:focus {
            border-color: var(--ink);
            background: white;
            box-shadow: 0 0 0 4px rgba(19, 33, 30, 0.05);
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 7px;
        }

        .top-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            min-height: 37px;
            padding: 0 13px;
            border: 1px solid var(--line);
            border-radius: 9px;
            background: rgba(255, 255, 255, 0.65);
            color: var(--ink);
            font-size: 12px;
            font-weight: 600;
            transition: 0.25s ease;
        }

        .top-btn:hover {
            background: white;
            border-color: #b8c2ba;
            transform: translateY(-2px);
        }

        .top-btn.logout {
            color: var(--danger);
        }

        /* =========================
           WELCOME
        ========================= */

        .welcome-banner {
            position: relative;
            overflow: hidden;
            margin-top: 30px;
            padding: 34px 38px;
            min-height: 210px;
            border-radius: 22px;
            background: var(--ink);
            color: white;
            box-shadow: var(--shadow);
            animation: fadeUp 0.55s ease both;
        }

        .welcome-banner::before {
            content: "";
            position: absolute;
            width: 240px;
            height: 240px;
            border-radius: 50%;
            background: var(--mint);
            opacity: 0.08;
            right: -65px;
            top: -100px;
        }

        .welcome-banner::after {
            content: "";
            position: absolute;
            width: 130px;
            height: 130px;
            border-radius: 50%;
            border: 1px solid rgba(217, 246, 127, 0.18);
            right: 110px;
            bottom: -70px;
        }

        .welcome-banner > div {
            position: relative;
            z-index: 2;
        }

        .welcome-banner h1 {
            font-family: "Space Grotesk", sans-serif;
            font-size: clamp(27px, 3vw, 39px);
            line-height: 1.1;
            letter-spacing: -1.5px;
            max-width: 700px;
        }

        .welcome-banner h1 span {
            color: var(--mint);
        }

        .welcome-banner p {
            margin-top: 11px;
            color: #aebbb5;
            font-size: 14px;
            max-width: 620px;
        }

        .welcome-actions {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 23px;
        }

        .btn-welcome {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            min-height: 42px;
            padding: 0 17px;
            border-radius: 10px;
            font-size: 13px;
            font-weight: 700;
            transition: 0.25s ease;
        }

        .btn-welcome-primary {
            background: var(--mint);
            color: var(--ink);
        }

        .btn-welcome-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 9px 20px rgba(217, 246, 127, 0.14);
        }

        .btn-welcome-outline {
            border: 1px solid rgba(255, 255, 255, 0.18);
            color: white;
            background: rgba(255, 255, 255, 0.04);
        }

        .btn-welcome-outline:hover {
            background: rgba(255, 255, 255, 0.09);
            transform: translateY(-2px);
        }

        /* =========================
           STATS
        ========================= */

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 17px;
            margin-top: 22px;
        }

        .stat-card {
            position: relative;
            overflow: hidden;
            background: white;
            border: 1px solid var(--line);
            border-radius: 17px;
            padding: 21px 23px;
            min-height: 130px;
            transition: 0.28s ease;
            animation: fadeUp 0.55s ease both;
        }

        .stat-card:nth-child(2) {
            animation-delay: 0.08s;
        }

        .stat-card:nth-child(3) {
            animation-delay: 0.16s;
        }

        .stat-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 14px 32px rgba(19, 33, 30, 0.08);
            border-color: #c5cec5;
        }

        .stat-icon {
            width: 37px;
            height: 37px;
            border-radius: 10px;
            background: var(--soft);
            color: var(--ink);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            margin-bottom: 14px;
        }

        .stat-number {
            font-family: "Space Grotesk", sans-serif;
            font-size: 27px;
            font-weight: 700;
            letter-spacing: -1px;
        }

        .stat-label {
            margin-top: 2px;
            color: var(--muted);
            font-size: 12px;
            font-weight: 500;
        }

        /* =========================
           LOWER GRID
        ========================= */

        .rd-grid {
            display: grid;
            grid-template-columns: minmax(0, 1.7fr) minmax(280px, 0.9fr);
            gap: 20px;
            margin-top: 22px;
        }

        .table-wrapper,
        .rd-quick-actions {
            background: white;
            border: 1px solid var(--line);
            border-radius: 17px;
            overflow: hidden;
            animation: fadeUp 0.6s ease both;
        }

        .table-title {
            min-height: 68px;
            padding: 0 22px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            border-bottom: 1px solid var(--line);
        }

        .table-title h2,
        .rd-card-title {
            font-family: "Space Grotesk", sans-serif;
            font-size: 16px;
            letter-spacing: -0.4px;
        }

        .section-icon {
            color: var(--coral);
            margin-right: 8px;
        }

        .view-all-btn {
            display: inline-flex;
            align-items: center;
            min-height: 34px;
            padding: 0 12px;
            border: 1px solid var(--line);
            border-radius: 8px;
            font-size: 11px;
            font-weight: 700;
            transition: 0.25s ease;
        }

        .view-all-btn:hover {
            border-color: var(--ink);
            transform: translateY(-1px);
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th {
            padding: 13px 22px;
            text-align: left;
            background: #fafbf8;
            color: #7c8982;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 0.8px;
            font-weight: 700;
        }

        .data-table td {
            padding: 17px 22px;
            border-top: 1px solid #edf0eb;
            color: #52615a;
            font-size: 13px;
        }

        .data-table td strong {
            color: var(--ink);
            font-weight: 700;
        }

        .data-table tbody tr {
            transition: 0.2s ease;
        }

        .data-table tbody tr:hover {
            background: #fafbf8;
        }

        .badge {
            display: inline-flex;
            align-items: center;
            min-height: 25px;
            padding: 0 9px;
            border-radius: 50px;
            font-size: 10px;
            font-weight: 700;
        }

        .badge-success {
            background: #e4f1e7;
            color: var(--green);
        }

        /* =========================
           QUICK ACTIONS
        ========================= */

        .rd-quick-actions {
            padding: 21px;
        }

        .rd-card-title {
            display: flex;
            align-items: center;
            gap: 9px;
            margin-bottom: 13px;
        }

        .rd-card-title i {
            color: var(--coral);
            font-size: 14px;
        }

        .rd-action-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 13px 4px;
            border-top: 1px solid #edf0eb;
            transition: 0.22s ease;
        }

        .rd-action-item:hover {
            transform: translateX(4px);
        }

        .rd-action-icon {
            width: 36px;
            height: 36px;
            border-radius: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #edf4e0;
            color: #536e32;
            font-size: 13px;
            flex-shrink: 0;
        }

        .rd-action-icon-red {
            background: #f9e9e6;
            color: var(--danger);
        }

        .rd-action-content {
            min-width: 0;
        }

        .rd-action-content h4 {
            color: var(--ink);
            font-size: 12px;
            font-weight: 700;
        }

        .rd-action-content p {
            margin-top: 2px;
            color: var(--muted);
            font-size: 10px;
        }

        .action-arrow {
            margin-left: auto;
            color: #b1bbb5;
            font-size: 10px;
            transition: 0.2s ease;
        }

        .rd-action-item:hover .action-arrow {
            color: var(--ink);
            transform: translateX(3px);
        }

        /* =========================
           ANIMATION
        ========================= */

        @keyframes fadeUp {
            from {
                opacity: 0;
                transform: translateY(12px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 1150px) {

            .main-content {
                padding-left: 27px;
                padding-right: 27px;
            }

            .topbar-right {
                gap: 9px;
            }

            .rd-search {
                width: 190px;
            }

            .nav-links a:nth-child(2),
            .nav-links a:nth-child(3) {
                display: none;
            }
        }

        @media (max-width: 900px) {

            .sidebar {
                width: 215px;
            }

            .main-content {
                margin-left: 215px;
            }

            .rd-grid {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: repeat(3, 1fr);
            }

            .topbar-left h1 {
                font-size: 18px;
            }
        }

        @media (max-width: 700px) {

            .sidebar {
                position: static;
                width: 100%;
                height: auto;
                padding: 15px;
            }

            .sidebar-logo {
                padding-bottom: 15px;
            }

            .sidebar-nav {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
            }

            .nav-divider {
                display: none;
            }

            .main-content {
                margin-left: 0;
                padding: 0 15px 30px;
            }

            .topbar {
                min-height: auto;
                padding: 18px 0;
                align-items: flex-start;
                flex-direction: column;
            }

            .topbar-right {
                width: 100%;
                flex-direction: column;
                align-items: stretch;
            }

            .rd-search {
                width: 100%;
            }

            .nav-links {
                width: 100%;
            }

            .nav-links a {
                flex: 1;
            }

            .welcome-banner {
                margin-top: 20px;
                padding: 27px 24px;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .table-wrapper {
                overflow-x: auto;
            }

            .data-table {
                min-width: 500px;
            }
        }

        @media (max-width: 450px) {

            .sidebar-nav {
                grid-template-columns: 1fr;
            }

            .nav-links {
                flex-wrap: wrap;
            }

            .nav-links a {
                flex: 1 1 45%;
            }

            .welcome-banner h1 {
                font-size: 28px;
            }

            .welcome-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .btn-welcome {
                justify-content: center;
            }

            .table-title {
                padding: 0 16px;
            }

            .data-table th,
            .data-table td {
                padding-left: 16px;
                padding-right: 16px;
            }
        }

    </style>
</head>

<body>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>


<!-- =========================
     SIDEBAR
========================= -->

<div class="sidebar">

    <div class="sidebar-logo">

        <div class="sidebar-logo-icon">
            <i class="fa-solid fa-briefcase"></i>
        </div>

        <div class="sidebar-logo-text">
            <h2>SMARTHIRE</h2>
            <span>Recruiter Portal</span>
        </div>

    </div>


    <nav class="sidebar-nav">

        <a href="${pageContext.request.contextPath}/recruiter-dashboard.jsp"
           class="active">
            <i class="fa-solid fa-gauge"></i>
            <span>Dashboard</span>
        </a>

        <a href="${pageContext.request.contextPath}/post-job.jsp">
            <i class="fa-solid fa-plus"></i>
            <span>Post Job</span>
        </a>

        <a href="${pageContext.request.contextPath}/postedjobs">
            <i class="fa-solid fa-list-ul"></i>
            <span>Posted Jobs</span>
        </a>

        <a href="${pageContext.request.contextPath}/recruiterprofile?id=${user.id}">
            <i class="fa-solid fa-user-tie"></i>
            <span>Profile</span>
        </a>

        <a href="${pageContext.request.contextPath}/shortlistedcandidates">
            <i class="fa-solid fa-star"></i>
            <span>Shortlisted</span>
        </a>

        <a href="${pageContext.request.contextPath}/rejectedcandidates">
            <i class="fa-solid fa-circle-xmark"></i>
            <span>Rejected</span>
        </a>

        <div class="nav-divider"></div>

        <a href="${pageContext.request.contextPath}/logout"
           class="logout-link">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Logout</span>
        </a>

    </nav>

</div>


<!-- =========================
     MAIN CONTENT
========================= -->

<div class="main-content">


    <!-- TOPBAR -->

    <div class="topbar">

        <div class="topbar-left">
            <h1>Recruiter Dashboard</h1>
        </div>


        <div class="topbar-right">

            <input
                type="text"
                data-smart-search="generic"
                placeholder="Search jobs, applications..."
                class="rd-search"
            >


            <div class="nav-links">

                <a href="${pageContext.request.contextPath}/home.jsp"
                   class="top-btn">
                    Home
                </a>

                <a href="${pageContext.request.contextPath}/register.jsp"
                   class="top-btn">
                    Register
                </a>

                <a href="${pageContext.request.contextPath}/login.jsp"
                   class="top-btn">
                    Login
                </a>

                <a href="${pageContext.request.contextPath}/logout"
                   class="top-btn logout">
                    <i class="fa-solid fa-right-from-bracket"
                       style="margin-right:6px;"></i>
                    Logout
                </a>

            </div>

        </div>

    </div>


    <!-- WELCOME BANNER -->

    <section class="welcome-banner">

        <div>

            <h1>
                Welcome Back,
                <span>${user.name}</span>
            </h1>

            <p>
                Manage your job postings, review applications and
                connect with the right talent for your team.
            </p>


            <div class="welcome-actions">

                <a href="${pageContext.request.contextPath}/post-job.jsp"
                   class="btn-welcome btn-welcome-primary">

                    <i class="fa-solid fa-plus"></i>
                    Post New Job

                </a>


                <a href="${pageContext.request.contextPath}/postedjobs"
                   class="btn-welcome btn-welcome-outline">

                    <i class="fa-solid fa-list-ul"></i>
                    View Posted Jobs

                </a>

            </div>

        </div>

    </section>


    <!-- STATISTICS -->

    <section class="stats-grid">


        <div class="stat-card">

            <div class="stat-icon">
                <i class="fa-solid fa-briefcase"></i>
            </div>

            <div class="stat-number">
                12
            </div>

            <div class="stat-label">
                Active Jobs
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                <i class="fa-solid fa-file-lines"></i>
            </div>

            <div class="stat-number">
                128
            </div>

            <div class="stat-label">
                Applications
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-icon">
                <i class="fa-solid fa-star"></i>
            </div>

            <div class="stat-number">
                24
            </div>

            <div class="stat-label">
                Shortlisted
            </div>

        </div>

    </section>


    <!-- LOWER CONTENT -->

    <section class="rd-grid">


        <!-- RECENT JOBS -->

        <div class="table-wrapper">

            <div class="table-title">

                <h2>
                    <i class="fa-solid fa-clock-rotate-left section-icon"></i>
                    Recent Job Postings
                </h2>

                <a href="${pageContext.request.contextPath}/postedjobs"
                   class="view-all-btn">
                    View All
                </a>

            </div>


            <table class="data-table">

                <thead>

                    <tr>
                        <th>Job Title</th>
                        <th>Applications</th>
                        <th>Status</th>
                    </tr>

                </thead>


                <tbody>

                    <tr>

                        <td>
                            <strong>Java Developer</strong>
                        </td>

                        <td>
                            25
                        </td>

                        <td>
                            <span class="badge badge-success">
                                Active
                            </span>
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <strong>Frontend Developer</strong>
                        </td>

                        <td>
                            18
                        </td>

                        <td>
                            <span class="badge badge-success">
                                Active
                            </span>
                        </td>

                    </tr>


                    <tr>

                        <td>
                            <strong>UI/UX Designer</strong>
                        </td>

                        <td>
                            10
                        </td>

                        <td>
                            <span class="badge badge-success">
                                Active
                            </span>
                        </td>

                    </tr>

                </tbody>

            </table>

        </div>


        <!-- QUICK ACTIONS -->

        <div class="rd-quick-actions">

            <h2 class="rd-card-title">

                <i class="fa-solid fa-bolt"></i>

                Quick Actions

            </h2>


            <a href="${pageContext.request.contextPath}/post-job.jsp"
               class="rd-action-item">

                <div class="rd-action-icon">
                    <i class="fa-solid fa-plus"></i>
                </div>

                <div class="rd-action-content">

                    <h4>Post New Job</h4>

                    <p>Create a new job listing</p>

                </div>

                <i class="fa-solid fa-chevron-right action-arrow"></i>

            </a>


            <a href="${pageContext.request.contextPath}/postedjobs"
               class="rd-action-item">

                <div class="rd-action-icon">
                    <i class="fa-solid fa-list-ul"></i>
                </div>

                <div class="rd-action-content">

                    <h4>Posted Jobs</h4>

                    <p>Manage your listings</p>

                </div>

                <i class="fa-solid fa-chevron-right action-arrow"></i>

            </a>


            <a href="${pageContext.request.contextPath}/shortlistedcandidates"
               class="rd-action-item">

                <div class="rd-action-icon">
                    <i class="fa-solid fa-star"></i>
                </div>

                <div class="rd-action-content">

                    <h4>Shortlisted</h4>

                    <p>Review shortlisted talent</p>

                </div>

                <i class="fa-solid fa-chevron-right action-arrow"></i>

            </a>


            <a href="${pageContext.request.contextPath}/rejectedcandidates"
               class="rd-action-item">

                <div class="rd-action-icon rd-action-icon-red">
                    <i class="fa-solid fa-circle-xmark"></i>
                </div>

                <div class="rd-action-content">

                    <h4>Rejected</h4>

                    <p>Review rejected candidates</p>

                </div>

                <i class="fa-solid fa-chevron-right action-arrow"></i>

            </a>

        </div>

    </section>

</div>


<script src="${pageContext.request.contextPath}/js/smart-search.js"></script>

</body>
</html>